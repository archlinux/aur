# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Luna Jernberg <droidbittin@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon+m2x+dev>
# Contributor: Figue <ffigue@gmail.com>
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgbase=firefox-esr
pkgname=(firefox-esr)
pkgver=115.5.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/en-US/firefox/enterprise/"
depends=(gtk3 libxt mime-types dbus-glib ffmpeg nss ttf-font libpulse)
makedepends=(unzip zip diffutils yasm mesa imake inetutils xorg-server-xvfb
             autoconf2.13 rust clang llvm jack nodejs cbindgen nasm
             python lld dump_syms
             wasi-compiler-rt wasi-libc wasi-libc++ wasi-libc++abi)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English'
            'xdg-desktop-portal: Screensharing with Wayland')
options=(!emptydirs !makeflags !strip !lto !debug)
source=(https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz{,.asc}
        $pkgname.desktop identity-icons-brand.svg)
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla Software Releases <release@mozilla.com>

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=e05d56db0a694edc8b5aaebda3f2db6a

prepare() {
  mkdir -p mozbuild
  cd firefox-$pkgver

  echo "${noextract[@]}"

  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
ac_add_options --with-app-name=$pkgname
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=$pkgname
export MOZ_APP_PROFILE="mozilla/firefox-esr"

# Keys
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
END
}

build() {
  cd firefox-$pkgver

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_ENABLE_FULL_SYMBOLS=1
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip

  export MOZ_BUILD_DATE=$(head -1 sourcestamp.txt)
  export RUSTFLAGS="-C debuginfo=1"

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
  ./mach build

  echo "Profiling instrumented browser..."
  ./mach package
  LLVM_PROFDATA=llvm-profdata \
    JARLOG_FILE="$PWD/jarlog" \
    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
    ./mach python build/pgo/profileserver.py

  stat -c "Profile data found (%s bytes)" merged.profdata
  test -s merged.profdata

  stat -c "Jar log found (%s bytes)" jarlog
  test -s jarlog

  echo "Removing instrumented browser..."
  ./mach clobber

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build

  echo "Building symbol archive..."
  ./mach buildsymbols
}

package_firefox-esr() {
  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);
END

  local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox ESR for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux
END

  local i theme=official
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dvm644 ../identity-icons-brand.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$pkgname-symbolic.svg"

  install -Dvm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/firefox-esr "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/firefox-bin"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi

  export SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE="$startdir/.crash-stats-api.token"
  if [[ -f $SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE ]]; then
    make -C obj uploadsymbols
  else
    cp -fvt "$startdir" obj/dist/*crashreporter-symbols-full.tar.zst
  fi
}

_package_i18n() {
  pkgdesc="$2 language pack for Firefox ESR"
  depends=("firefox-esr>=$pkgver")
  install -Dm644 firefox-esr-i18n-$pkgver-$1.xpi \
    "$pkgdir/usr/lib/firefox-esr/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

_languages=(
  'ach    "Acholi"'
  'af     "Afrikaans"'
  'an     "Aragonese"'
  'ar     "Arabic"'
  'ast    "Asturian"'
  'az     "Azerbaijani"'
  'be     "Belarusian"'
  'bg     "Bulgarian"'
  'bn     "Bengali"'
  'br     "Breton"'
  'bs     "Bosnian"'
  'ca-valencia "Catalan (Valencian)"'
  'ca     "Catalan"'
  'cak    "Maya Kaqchikel"'
  'cs     "Czech"'
  'cy     "Welsh"'
  'da     "Danish"'
  'de     "German"'
  'dsb    "Lower Sorbian"'
  'el     "Greek"'
  'en-CA  "English (Canadian)"'
  'en-GB  "English (British)"'
  'en-US  "English (US)"'
  'eo     "Esperanto"'
  'es-AR  "Spanish (Argentina)"'
  'es-CL  "Spanish (Chile)"'
  'es-ES  "Spanish (Spain)"'
  'es-MX  "Spanish (Mexico)"'
  'et     "Estonian"'
  'eu     "Basque"'
  'fa     "Persian"'
  'ff     "Fulah"'
  'fi     "Finnish"'
  'fr     "French"'
  'fy-NL  "Frisian"'
  'ga-IE  "Irish"'
  'gd     "Gaelic (Scotland)"'
  'gl     "Galician"'
  'gn     "Guarani"'
  'gu-IN  "Gujarati (India)"'
  'he     "Hebrew"'
  'hi-IN  "Hindi (India)"'
  'hr     "Croatian"'
  'hsb    "Upper Sorbian"'
  'hu     "Hungarian"'
  'hy-AM  "Armenian"'
  'ia     "Interlingua"'
  'id     "Indonesian"'
  'is     "Icelandic"'
  'it     "Italian"'
  'ja     "Japanese"'
  'ka     "Georgian"'
  'kab    "Kabyle"'
  'kk     "Kazakh"'
  'km     "Khmer"'
  'kn     "Kannada"'
  'ko     "Korean"'
  'lij    "Ligurian"'
  'lt     "Lithuanian"'
  'lv     "Latvian"'
  'mk     "Macedonian"'
  'mr     "Marathi"'
  'ms     "Malay"'
  'my     "Burmese"'
  'nb-NO  "Norwegian (Bokmål)"'
  'ne-NP  "Nepali"'
  'nl     "Dutch"'
  'nn-NO  "Norwegian (Nynorsk)"'
  'oc     "Occitan"'
  'pa-IN  "Punjabi (India)"'
  'pl     "Polish"'
  'pt-BR  "Portuguese (Brazilian)"'
  'pt-PT  "Portuguese (Portugal)"'
  'rm     "Romansh"'
  'ro     "Romanian"'
  'ru     "Russian"'
  'si     "Sinhala"'
  'sk     "Slovak"'
  'sl     "Slovenian"'
  'son    "Songhai"'
  'sq     "Albanian"'
  'sr     "Serbian"'
  'sv-SE  "Swedish"'
  'ta     "Tamil"'
  'te     "Telugu"'
  'th     "Thai"'
  'tl     "Tagalog"'
  'tr     "Turkish"'
  'trs    "Chicahuaxtla Triqui"'
  'uk     "Ukrainian"'
  'ur     "Urdu"'
  'uz     "Uzbek"'
  'vi     "Vietnamese"'
  'xh     "Xhosa"'
  'zh-CN  "Chinese (Simplified)"'
  'zh-TW  "Chinese (Traditional)"'
)
_url=https://archive.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}esr/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-esr-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("firefox-esr-i18n-$pkgver-$_locale.xpi::$_url/$_locale.xpi")
  eval "package_$_pkgname() {
    _package_i18n $_lang
  }"
done

# Don't extract languages
noextract=()
for _src in "${source[@]%%::*}"; do
    case "$_src" in
      *.xpi) noextract+=("$_src") ;;
    esac
done

sha512sums=('5ee722884cd545cf5146f414526b4547286625f4f5996a409d7f64f115633fb7eb74d202e82f175fd5b2d24cce88deee70020fcb284055fcdea3d39da182074e'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            'd6f9328224ef55ac61aa7b3213d5408c5dbc84136085b20959752324fa9af6784d2bab932b5cd81871bed02de78664a682691152380830a87a7fecd8002b3b05'
            'f848471c60d0c31cf779d0f602fca8a1c15d33a1e668d15f332579906f85bbf7bb82fb54cdb90d44ede850215b1368b46b321109271f71dbb261f1431e7c2bf2'
            '40efe790974ba57c9111748cabfe78684206c2831a95e4ffb044617fde3748f755efc2c9c17a719059bf9141114d524fcd618fb6a8f0f9bcb7c96fe7a49a2c8d'
            'eed5a38521c131887343e7d8dcf8f0e3bc36af2558ceeef6669811aec56edb7131086fc720e71b11e9da7aa959b30388dd9ac8a51514098763f0aede7ad34cc3'
            '24d7609edd0448d25f66385188bcaf6b9c807c07e85181d03ccd0016db01928659d5ae1b13c4d1602c67c14440e48cb9fc71cd7335331fd6a5b2ca4b4ff27e5e'
            'cfd269e253f470d0f65005941e3c0dbb6179c23cfc6e9c9e960045fe728189109edb398fb8caeb64b550186e9e72499f6a460ac118161535bb0a259ab6eb5fe9'
            'ed2564a7c3940da180134b69746e3f8b08a0b265ef0a319897d382e73106ad58c32678cf85090de437898dd8ea4d2d520ee971cc590d56a1afe98c54c476d583'
            '7e0cd143d613911e87b2238ab14240c07f93ecfca54e24f50bdcdd0992dec7152ee446d5a47a48f79b6f876fc804a788a67c9c2b7033c6a08816a215cac8e9b0'
            '829e7e7664299b5e8a65e99da2c09988aba9f5c412f09e18e485eae5c6bdbfc7f44aa5ddb981ba592ba237847b6c18d9224dc77a2fcd67320a071504b2eca34e'
            'c0666c6264e7b11e89c54b4c29ab55fd9ea0577fd8033ad69f5fb3a11ae9c601bd4aa88e3aac83f4ac5e2523c13d8de2e1e646bdfdbf377c46a97783376d179e'
            'ac3bf88b158c3dec2248d31e58a30250222b69ddfaf03abb7f4200d6121d0044145d34bb1a275654fc4e5e7aaee9a8291f74eb861eadfa89d6d7750b70c5aabf'
            '307de6c8a97d449f6cec797c485c2ff3a80e7b43ad05c45361068acd95199049e711b360efb69bbb7329ac9c6b7378958395151e2a5512e596e46d5f716ec55f'
            'b02e5cc88ae916aefc143ab5064d322798eaebbb4a0832a8f84a27ac2cade6509b1f4c83ebecb291a37e0c4d4d91a2b2cdabde021668eea7acd5d99c50e7cd20'
            '9083e4b3fbb49fb6f2fd39c47499a386510132fc37fb63a9c1779772606f1581f6b2c40906a62dbccfdb9d3d0c9046ab29d7d431989afa9113725fb7bfd52a6c'
            '79acf42eef2955abcc48a00411a091d48942992240d4d85277b2f62aade8c6903e2fc8d89e9376b679582bc2c2ca0e9a35b2bcd91153733309594458b276dfb3'
            'da6f9a8e981457024163da077d3893cbf2db97b811cee03e219ca2bf268d34b1e111034874df57c32be22abfbcf6fe683ba5e0a8db9e9cf03955c26258fafdc8'
            'f177323fb205ad73f47fc8ab5a075e5b68e85d0d407bd2d7212959abfce512412c256ba600fc053a2af380ce85827d47b8357b1d6dd7661c546fe0dfea40002d'
            '8d05fe687cfdc9a3dab09225e580ea0cf886228e6475de4ef43ed779a0836a83e6ff2d1d3247c2ed30a57636092d5ae6682d174b62714f0e3d2e416ce1bcf627'
            '88fe96ca524d3d20d20f71a1c9250a54c5aca21dae3634356b84f348ee5ca84028f58c491bc914fdd4ea6c5c2ad085c3138501636e133ce7be7804bc777e93c5'
            'c7cf7876fd6aab158ac45a125c99423f2d29923b9839d3e6a92fbc4b8f9a5b210a40fad6f82053b4cf4a1339b65cc6f3b16822e3891714276511a0a0ab91703a'
            'd602095a122ec363deae7a9d98b3934ef4684ef334aae1c594593e2d652dd4d5efaa747fdb413fde3d8e0226a25603921084d2e757a187004a5f434c877585cc'
            '2967395531bbc8c64e74d2a89c249cd0aea1c2034b7d9aa18aafc22f0a3996771be985ffab3910d6460bf59a68d3e8a98ef4ef2d2bd66496e5c129febe311d59'
            '5f47fcda2cc5d89a1846114b626d3ca9e942f881147ca28dd7e0a5b4e34454094a1aba966887809f09a25f44ae61cc3980ed71078eaa5e808069aff6e726afa6'
            'f69c105aa8bca337d4b3a975cccf8ad7ca97f557fec9f152784af70ea0bda85486c3cfd8a949ee0738ad9603d893eed8cd2a99cbf3aa0ea0fad23590e424cabf'
            '01a6b5c432db4d2f15228e7e9af17ffb69454c8ac99ec305fba64c29dbe093f6cfdbc53fe9635ad44b4e59115439c6f74de178f9e998c2047bdc805a113c6316'
            '97bea74510957c72bcc3f8b806cf4fe0cd9b1015785585d003c86a6cfc7e002f4a8af7e54c55688bc87db28917888bef0f5dda4f49cfe14a8ef5e84330a88190'
            '2e82451dc454c1d39f120b5f93fd308e766ad3052373ba749fe5287110e4f8d096cafd4d980db66509913ff259ec324d48cd21be324a48841698e7f5ded61ad3'
            '98062c87a35d93515f024a20108db1c6e7ecb0cba0027a93815d7817316bfe02667c2542c16042580c4909aa8161d40ea985425a2b490661d5c6d01c3118a981'
            'ad59fdcca7b6d7d98c7c414a5627ae51ada6613d37d32aee5eb020fab7ff4c1edbe2e7bb915413192c836e6ddfb7e5b28861c86b1d12a6cf8c5935e21b77d9bf'
            'ebc0b7d1e5882784bc09e98503751968af574c80decf5ff52d7f827422535b08df5d093a8ff6d5f8dde102660d5feda980c25be2981a583ec4fb0d900ff772be'
            'e9b4a3130f8a6be389883c4d1400108021cdf128169f13d80552e27f08ef6f899281b836772d10a3d415df305a516642bfe3fe2931366c70c4f4b49cbcb4d706'
            'bf42cf4e1f7980f8a204e24f1f844a0c92ef66745645fda8ed775dbe13ef546cb4dfd5644dc586ad472c5af17157700965cfec64448bcd7110dc554f9f201bb9'
            'e7e8a7dd75b7710f2e8729a5143ac29ddfdd146817309e79f736d460c90617b17f1ee4d974f8eb76c2a558f2e35a979929f66b6dda01faf0af5f6d5630490156'
            '818b3ccc2044908da1fa67809b7fef816030c6253dd0eaa4367055e4ed23f89015fbec1041d22bae34505cc5232b00f90f36c3a62cc0af8d2d26c8d8231f4311'
            'f2f95b1fd2292562fd7240381d1cf867db8b63c4b6237ee30da8d77bd5875a833a55ee5d4b54b5c567781d6045a1d4cad00eff967e2037afdf913d0b4ef4c8f1'
            '650aa590986017182615023f79be3249a4c0095be815bffb2fd2b96578c7e9b470bfc9e5c3a4d7f301b2219f437f11efc5cf3a30ce26aa6f52cd7385aeb38f8c'
            '76c4f2effb98d1f8c5813ec22a27eb05dd0002437023774368a649be262f356298e09d2992e87719bce1312f8b387d3874802a6b739194a2fe6e790969fed703'
            'e26ccebd367d896da2f970252298a1b84f800d30b17556f7f1577c4dc4b7f75e54300cccc19fb4619c9fe9dc58d4ce0b8416259257020610a4f04e482330c7e3'
            'b2c1e726fb67b3cf04bf9f9e8250b1d81ad535dc3b03ee660d8bc8c9f0058bb88ea6d10d9d22cab360d632c3f99bf3973aa33ffad6f753c412620c559f828305'
            '6fc241c1b613829db890faa11a3ad0aaf4b2b53775be5ad6895f0c182264e4c4b494e71794ad8c14a5bdf9e5dc0f22661d7548ae498835dc1684aa76761b56e4'
            'aaae76859bcf2163f08b543cbbb48c31737e70a71932b09532981aaa9b70009ea98b4f83ad4d6c283f4e390536926a7142b292e192bfd415b37b9a11c8c9ed28'
            'db2cf8af96f5e771254b55a7041e14190dd966dd78c5dc1350976c5008492a243294c6ee2279727fd2088ed25a9dd8a1ccf7633d142b3ede63822e65ff6b0542'
            '0f1a30cc9c73c64dbe3f8524d5eac318aa662e595fd6e36728a721ff7b364168acd0e78465a32b5aac5a9eb840f9584cf760768fbc15cc13cff1b167405c2e21'
            '204a2bc8df052e396249a0c1d209044942cefb67ce7237372e89491db7033ee65bf57353852ac2777c2ed321212152386d2e1b9de4b8df9afd22641cfdfca0f5'
            '7675c2022f222dadd2aa1ac37d97636a292bba74febd38c4ef4eb57aeb6d40f42731f53010301a7d6820b82f5b7a559b19b0a28546de4005ade0eb80b8aa1f66'
            '7d5d1fa328ed24fe4e512132f9ad74bb5c01619713193912365c6e3aa0562e1baad4fd93737d78bbc86a7ea049dc45135cf72de0e4ea232c289aeb28e84d4a3b'
            '7703853050ba24bbf22c4764b271d0c7783fa5a032dbfafe9c1939777f1f7d70fda811580c48b5ab7a723809407137fedfddb9c3fb5f79a4599ac8ec2760eb54'
            '98c2fb3ada7666c0676c13598e21788c1b217de86e8a5c6deead2e1041af7458be44aab9cf265167b93d06b04db0ace785d98be4a43562626043d3cfce569470'
            '03b1faf07c752739a0247432ddeb440beb7a39035b3ce1f5af7c97e971970546faa3a2f4499e378f5c2d1fca9c28df6ef89223bfc0c7f6b8b65515a3d068abe2'
            '1a695d598c47ef102e6d04032e96a4dc61ad411085551aa103d715833e2fcece380c7c1a4415d1bd1630255bd41c14e55122670d50e2327cfe106a176920bdfe'
            'ff99398886c0bfe65c3f2eaccdaa9d7509584dd11c417223ae130698d707157816bedcfc2d83a815b02cc34a37b01a3f507168c3ea2ed0016a0a668046ddbd56'
            'cfb35e94d9ebd6836b543458b73b043b8f776649773d242a10a94b184c4fb835ce87e5ac9e1d87462dcf1bb122cf95f90b09a76d46739a175f63a584b61714f9'
            '37c28206f6d1a14d3f1ac9d4005de58edac5a115ec4b988e1cb693a72e636ef8008a7dcfff0c791d4b6cea5f76423da905f4122bc9a25badf8f5935795497d98'
            '80f9d582c2c2261613266d0c892ff989d8db9ad71d9733f231350233a889757fbaefa500a58ab16f5b0c8259aab9059690dfed9f0b0516f3731471f82b718d4e'
            '83d98aed8420c5f1d376fd68da392922707698ca535c69bfe71bc810efc4b245895e2823e3203e1cb29da4ed3dc2611e3e3b19581f5201cfaa178659be8346a7'
            '2d132cf9052c4fbc5bdcd014d660f77258bdb0491afe6fa3e8f0c3932daf7532d8e8f1a94179fe2ae799cc54ff7fab5c936a529b7bf66bcb555692c94993e3a7'
            '296f07f1a4a1f520cba71b6cf06b0155dbb93a7a85af249f6bba167f59f876624aca4a6b645cdaf718ab31868b4b04fb4428e6209ca906587c264cac17169ed8'
            'dac0f8f935f88fcdd87018a75dac0cf9b9485884b7e8fde51ae988cfad117f7dd12ae4f861ee7b0eb1d24b71a406ae4ec88075d8be59da08a721afbde287323f'
            '8d91edd86602e40998b370c1d7f2b8cf6c6f46bc49a5e5dc7ee25273ffec6ce9175eaf0679e0897c7715f3c4a4c5476081271a3b9459887b50eb86071db8cec4'
            '287b8bbbf39da4a3f5213612bf147d75dfb075ed30cce036776329f9052fa5553c407abc8ebf88dc63b92e9fea713d76294d325efe1a5c379f7ff70f3a037c9d'
            'a5ae5a4c11155ad81e05090822c3530127707e562183a474f1616a61d000dc1a3c8330d774829d441e9a9b666571ea70af3ca6e129afeb8dcf76d6d2d3b135a8'
            '1e501ad764050cae618bbbfccc620d0f3de095c9b8c9304975891a3deed9a37e1a5458657eaa32435d1a7bc400fcee729818b4005564ee6adf7e84c1edb0ee81'
            '21d11a22b4c109d22c7c0389ad324ecd61560872e26a9ff5bc8e992eac5c80caeb2bd95ca48ad94c74c196a8ccd46aac94507a3d4b61c914f9dc3dc6a77d3dd1'
            'f8235e0e6c0da4ae20412d0816a8e0568f9c7eb9acbd86301aed8a778d81826f27c01fd88ee80290a6fa607b5a59e34570764416c0bb13727f805d000c8fd87e'
            '60b5033a2b0fb173605eec00741d2250d393913480a91b7686f9e0fc4d232140f16f5565af924f96a5e7362523fbd2ce2bbefeaf171119a7e1bbca79b4c35fdf'
            '7f0cb1ffe360d3aa8850ca0352cd95a761fe01ebc3e8fcd61ac83d4f34ae609caadb8c35e66896ba478f316cc5fe65c5ac217252185eeafd08e8f046dec2af43'
            'e4c4f5215a41012fa4c4383fb17a56b72daeea0e1859105b3326a01c1b4afb34b3fd963c575fc6f79ba900fff84807910a4488b2a1c7c59a29b0655fd682cbdb'
            'b77fe8e392f6ff56fb5495a6e1d64648b72db758daf6ae58b128aa428974512fe39b9197f316daa7980e947ebd93f8baf8c1ada39e5ba385d1d43fa224552087'
            '0ac3ef8cb3e692e66c2a28eb2bac381f5eb7ae2128b657e421d07cfc098f2af119e3ee98d30cd653cc82773694d0aebb2ac95ddb2a8e9ff77795ebfc6b169b6b'
            '57abf0326076cb23a343ba4f2b4f285bc3c1bd76182ed027dd6b1b3068cc77e6f928ffcb7e937c6219f82e5f6d0b2b4dfe6e929e70d318810ff98d35ab49371c'
            'bd4cf54c5d8b961c28868d6df2d065ee0029547bd6e5d1928dc37626346872df3793c03c154a81cbbc9266a213c69ac246e9758fcd40796da0175b9a45a70c40'
            'dba8ac95ff94005fd4488b26408c939729b4a26a88f00a1f5e4d62be5874c0df2649b69266e69efdf4f137b60ea9617d8ead7ff90f0e8aae92f4b5080d2c3165'
            'b00b8b33d0c2d32d349728d70055f5d70a08a88a1708c0c1cac2b3231095ef5bffbd105a7b1460e386f10726a6134732701dead561bac7661cf1c2c3f37a6078'
            '98001b808f8842371596466418c6c6f962f2457957341a29590324bb999d02bc7607652898c7b343b3a3415716138830f229127621b1ada7c15d3db66ee67b68'
            'ff92e4f2191bd1e5b7b33d01f75d6c43990a38d053641b83cb353e001fb83bf720dfb4108dd417084d50a27ab43ce66fa60b9977a4e89052a0ca11cccfeeea37'
            '92d6f758689415ff70f714157c554b800d49b8fa536e95176325fbb31770378c91f4a300da0622f603aa27c53cfe2b00f492f34ef4dd8cfe8083fa1241bb6f26'
            '30ed86f684d9ceabbb085d33ab1ade127892042a70f27fcbdf2d61f561fa1a69a2a49d5f7c9ab500362e446cbcc145e61934f2344c16568eaac3649910363962'
            '4b55065a8bee2d6548859bc7a787ce46754da19fbe0590e2de10ea385aa8fc053dcb880bdbcd91d44aecea3addb608bab635564a41c18e527e20582ba1c0f05c'
            '3a69aa98280bc0581e092e4600f19e96634b8f715e23ac5c56328db77addcd30e19c240186fa9a862c2cabc24435b023848d722b3836cb9637d58851e0fa365b'
            'd870a99dc8763cadb661d1200b3f7b881fd552d08e6132d76147531ae11328a47901c7738ff510660868486790070dab40e5382b03fa86af361b1e3ecf53188b'
            '87412b4272bec193536e67cecd26d3d23116684f348c7cd8c3eee6b26834803efc6828a0e6af9b3a7ca0c217903242263b3b3d795487f7772ab679794762efa2'
            'f08da111246fd8a7cedd929538aa656b4a115920aef537c85475d81d51a5c17a0adcefc9ce375d0a3cc78f7e95f08ab4972c1daa50ee0056dc3469e6ee1ee5c6'
            '520c43e79528251917f3fa4daaa7ea2de082cfcfeeca47b75dea376fd66092f37b80703cd98dff31729e130286ef84dbe70cf663797f96b30a86b47f1d791deb'
            '89b094578f623b8330efeb8a41f270a833a771571a98b14f6a901e1b3ca62f3e5972a13581520047bdf864691576e00b04ee923e66bcabe4bfeea1ef2cbfeffa'
            '8b12bd1b47cc47c61b0373c5c388286f0be9be4e413015960bef3578c085553198ecea879886f71eb6102c1e65c3d68938380523096bf74efface86b42ce45ba'
            '5977eab42a9d409d8c34abf9920aca27902f63b256cc49de865571adec81bfba82ff7cba506d1c41724413cd1672e2aae11f6436e31b92d7160c90b1a46d2bb9'
            'b74aee0b742165437d7f0e0332566c3c4fb203b5dbbb79f8f9ae664be724ebd1efbaef07776ed3f82b7129ab8404d737846cca9ac27bfc13cd7555ef3e98531f'
            '5e844bfe9cd1cfb1dbabb1668c4eb923430aff7ee00adef5e8a63e87d6efa05fe666ab4c043fc3512071ff017b3eee5c76bd35172d7e26e31ea109c324596fc1'
            'a2d64e0da46c28d81cf321a5068ef731f64e072c8a4434cb9b28d3fca97c47e763ee7e1593bd01afc06627f935a7df097c5c3a1d9c16a2d0dfa2fed40515339e'
            'c56b72bc8f631da43c65ed6d5997d325e29d2c33937ff6a23b9344645b1c9723f388362ec8fa472964d30ff025357f55c1a22cb16692b3b955cf48b797643f8d'
            'bd57b84aa21142a2bf5d77bca827e8ad8a0b1e12e97475b8ca2d830d55b8f3d3598823d17f51f2044bbec857f651594ea544484f99a22a6e4cc2f047fb6f4ce4'
            'a370ee2ff8be92d7cf1a69981dfa5b4a1793848eebcf721af03e1e1a9c8b3e367e222c1dba616c2afc4697b486cd9d80b4c4789f8cddaae10c6dcb73527cb75b'
            '7372398e33610d3091dcaa08dc125d4012230188850fe8d5a564e0770ecbe8bab78e1634292a8c2340545b4f1ae185b8b0a7c82bd2b6ee3b5f98529df1122834'
            'f396c5bf63271863fbb7d735a3e6d1bafd7a6649754ba4cc57466c323292ab54a5e49907f403be0921d5a25ab5d6c439aef6d04d5006af90217ce6906f4ade23'
            '2dc128b82824313ebafe3c147b99760d1a7da7a718b8d95f2897d13ba0b427a6a52e0c75258115598de1e9ab35de0972a933dd438d14a0326d9994f3faae9cbc'
            '62f6151b44387cdb98fae20b7128b9e3fcaf648ae59486cdec3dc6efd33b68942b643a1df3a2647e8d205399e1f6437a766eec14acd1d90074f49ff6a487acbe')


# vim:set sw=2 et:
