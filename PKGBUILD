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
pkgver=102.7.0
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

sha512sums=('2a9d212b5d15e1bf7a6156495126cbc9161d2057aeedea8f7a5a0670a19a9b00cf35044075935c8f3c788118856ba2cc00f9b297c5ac713f094857683f7cd13b'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            'ac3e4ea271d591c040aeb1ab890f782a023af5a6c9e76479aa128ee6ed8f94afe0eb4cd636061f9e0c011a0cba86b3bb4505a62345cdb4b0824f3bb8261af335'
            'ce76a370aeb002127f3973cf9c475dd72cf483d14da29227aaf73057d776e75615a2e324065650413ba4ac114514612f72454547a69b524ae3def605dddb188a'
            '1bda2e0c5c88f92aa08a680e130d1e776f7c748358ea347bf09dc9e1ee77224f7ca85901a24f3016d9e010434a9f42c49a48d6bf6f9bed63e21ce9125ef7188c'
            'b471e9be9dc3de3d868f2e98478c3a70fa7647f75f11924624eb435d7b119e1e692a6cab735f1d4a212624f1bc4f03d84b9269f2234bfef5f1e0b2954454ae8b'
            '8fdb18f0d35cb06e1d60dbae67fc900e8f0b0ddd97fa243be37d556e9f61c20affa4b62ec80a67b9fc11f0d24e8b556f7e4002eab3fc0dea20afb7ca5edc7f71'
            'ecb3d8c295e36cd749bae424e281180c75b2ca37ded3f4e1a8bd5f4fc747b00b54092dcdb42ac54e79973a90d40c4c54a0b45c467cba4e7bdc09962e98069148'
            'f4b75016d0b9f48ebde5683ab27c8196c604ec30ece5df9d285ae53ad914039b3bf437042ceedc3c698933fcb78854a666a2db16338d2bd01cc5dae7459d84b4'
            'f9699008f78adc7851cccf12bde14107a1cd49ce0ec4d1138e1e5bb718e0b4166bbb141e485fc64ac37a43ea35a532b978bf7d5d91bd603e38e150b69cd5da09'
            'e1e38039f248142f629dacd7b24ad2a47dc0cc14458f2609ad635f9bc1635418ddf5dd8427d5cd4557435fcbb35c19223053e2ccb9faeebc0501a4b3408b1274'
            'f7b38ebc62475fd52e091fba554e78d96841c0025cba05c226a4993997f60f1dc18807ba102b2dcb1a946e4a0ff863808a93ac7cd80bf557de4a9cdc85d66636'
            'e93a7ba1345e3f97ce333d94b04fc804c7e315d117f23555ae9f18f54114aad52ee91022b4ea3f850ab3da6ed977b0c37dfc47f2b54a6506a75ba6e0a3dc7309'
            'a3786106cd6a47a1a86dad3cd49874242a16215f552790b93428624f25e93d6e11570aa29b73195a811cc4ccc6dd8462ba95fe26b39a1b26ca992835b7f62dd7'
            'e53ee95066e1539ba8c4ad9576ca150338c56a8d2217c6457ca235670d89736b4baf0139cec88de59f926382b542656af322413ed51c787657357bb1ea6c9bea'
            '99d1dc5306ef1322f2c79e8a9889e775ebcbc50c2b6fd7c607a7f1a0f7c68d888371f0f3cbdd3027687f9d1382631d4557ada732830397dcd78bf872397cf3df'
            '72cce442f667af12b68ba66909ce8356c08603af91142d678db3c190f78a8fc1b55d4a074c1756490872bc6f61109c938b39e2fa964fe0b0dc17dd39b576391e'
            '1d7ffb5dba0ecff111bd2cd8d570a684ada3f0b3e02a444c3ae92cc59a9d334bd0f49cf3c1c81bd2f1d351547a154bad21363810b413975c209985154fdf13d9'
            '80900488b4374680f01515de807ceb00f31b18ae0d164f1e5295b30d66f4f58fd3ef53f342c5f324719bdda1e0c545c295b660bc7c4716b63622d5facaf7bdb8'
            'f19e5d8271db3c427f82fb790ebc827656a38970799298f211062c7107ee8ac0d3d0a183b7905b30fb4b164d871c77f211546047e7d75ec5f9dc88a1d8479c45'
            '305e587d739d340c70799d3949076d09a0fd8190e8166b0a63d9ef5928cb43e9cc2959aa8051aa029ab19d103ac236f18a1fa02809037a5396f3275c2d8458e9'
            '6946eba8bd127fdf7fc69cf75c0c36de288cda07327d2a370a3a24681f375c103c5dd3614e0ac9b378bc8e7865a7f38e7021daa1af91ada8e629dac50bd1149d'
            'c9654fb3610b9794319404a65aed0f6d14d0ed2101ec89f43183846deb2e5214e56ec9047f53711d29b2c21a38650860b31797cbd413ee8c58df55e3e8e01c7e'
            '7e3257e7015d9c462965cbf35d0105715f017c28ddd019c546ac0ca197917b8baf2dd80e269c89c1e40ccb32f6238466481eca53f740bc19e8bdd4d481b2e7f1'
            '416cbb90bdf37fb27a6583278c643c567b9e0ec99098d6bed69e21c3ce92f4536076677d6aa96b7aa8b0e7e2d42a16cf6a208854b2bc43e8e31da1ebdedc705e'
            '68639bca67e8ed6b63be46c0c50ba4f3fcd9babdbf1e33bbae6024e0342a3fc5eda774bc74a310093869c2870b3df07afdc93ae6a8ddb3a2900858832c121ed3'
            'f4a43986d34fe00f05f487b89879607e7abaf50999482dc8dfe197d4934aad96567c2bd3d1d92fd554d0b9976c07f0f971f48fdb6d3ff7992e53dac7d59353f6'
            'a6d174fdcc3de43e10b78c69744666ff12098bb8d0d438020ba87766ed56ac1ad363e77ad0a8748af6ebd3df9822785bd4787e4400dd19a0219a545c6f08577f'
            '319c6318acbe02ae98a00071c7c8661298c7b3b2fe2b8baf9f6ac022ac3803528d64d22603c122fe4315fc769b8cc549f68c8d38b47e822da2201edfebbfd5c8'
            'dbf4308e11991fd26e5974661a481af3258db6372af69ff9f700dc6b2f8b5b397970df30d30d1d6350d88265d8a8e1cba9809a90170bfd035a8608c8a26557b0'
            'f9f7e132eb4f885a1148d06b0d6081d77af0bb423cf7b71fab877c0b7613ff7572a069cb3c4f7da6f9eadc40b50abf1313d4e23e28c2f71488cba2a2d8220ea9'
            '1c29bd497f2e166ed17ac5cd3a49d5a1348cffe1ffce3f79b55768660091d96fbaf8d54ff8370a8a57b7b789ef7600f34d4a755bf563c6bcc479a450a6000217'
            '20daa26c9ccd390e40d0dec4f371eee354fc02f86041979829b42c9a4f8e8adf8c8bf0675931df31f0f4db35b2f9862667bbf234e9eb849f2a76c404030dca37'
            'd38582520b88590ea759e0ef86ea0d5ece18733008e3f160efef637a0bd780b3bd738c6b862d6cb0b1f0637ed0465a34006df9d38336583247815b0143fd3d75'
            'c47ad8b6f4b54357663484f6efb3af7f31676d91620b10580c645b9f284a7948d7cddbd39799baa1b8ee763a63fe0fde7c054f55a8646b4cc1f86465ffc967bf'
            'b8c55cb0ca83c34286bbd3830d4d8c33c6e5d6b3aaef0fa4be3c96316d20a8a66fb6ac4aafbaae8e0e4175635c3576e78a8719dd9aad46d6d9f81f7ea600f84a'
            'e6586c25fb5b5e1322e3c8241d2c6f184f546605a1e1e7773ce6bbafc8f354f937f5d55d7a4efd15f37366fbb9c5530027138cdd1792c17e594733086f91458d'
            'f170e2b6c6bb60b93a093725342b68f93e6d2f108ba3186e591fb181f9e222ea002e104082a055bb3b171fae1502d30272cfe04d7d0a0a49e138647db87164ed'
            '6b5909b207b772ae8f68187b13f6df3a39fc59c76a167ad38a749fd399ac2edbfa892361ef22a177640c0c3523a1c7fbc7ec563f8c22e16c898ffe857715f3b4'
            'cf9b626c208c74e816aafb8e15a095d4364e23a3660ed33ca05eee466637063a5cfbd99d731654347337f1b773176c80e6e088496d2bb268bc628bd21222ca67'
            '909874a4c01db80b916c784e46f4385526952071bb9ee72344dcf6834a96a09202efe01e7d545b10986de1dee72f1520ebf7e7ae741bb732f603ae6576751ff8'
            '7e5ce5d9845e348eee20a9ed6d60be49e456e41567c6bec2fa5050de225d5e17963a5f0b2f9843cdcb8153c843b01473b2856e2af26104cd3800290844dd5c3c'
            '393a6708453ea22e47e36ad8ce5437a51f79a618cd9d8b7264b708a1af38e44b141f322eaea1fa35102723ec64c1030a17a172f13f669b25ae704100f46a9cab'
            'e7c3a7fde562f82d40ba04dde16cc0e81fccc2f241e603393211e1477bcced9013568a852e53893e1f83d9d756682c0b8f5ee382b94c8973573df21d2cee1c55'
            '4a18a0b141698d0f8c931fa7264c4ba2e56bf174571a2ff238d400f7a8dfbb291ecdf244b85c61e43563d7ccdb09cb3a8e4ea3f2668506b07c054c4966f72033'
            'b61f4dfe74dfb0339481e3f4f5391f247a7beb1eb4ade28f8ad75ec5b9c887e2a40a1a8d38f37bdbc67fa67c7bd7cb8f782bb389b869adee2c2e3204f834e656'
            'd59c26b099e33fe92d0677713846803c4ce00b5d34dbc6d719861cb4352a2050aa001e10f6e6618fc001e3ab974fe17cd49bdc2d5ba72a12729462df8c9c0375'
            '3e63f478f3e8e6a62560200bafdb6f4462ed23ff0275ce8145201eb3e9f592b764a0ce2b86cbd34e594e8c2f2b28b7e704eafb032bc20c04e492e198cf309b9c'
            '022fabb011832680d12029d78b52b37f09f990f2497f3e1fc17104195da58ec0e21aa8505f71dcca2abeff670c517af1592203ba03ea59fdb08c45ffdb66848b'
            'a12eff6b02fbb68ce4a975a57f12c215763f5fe9c944d4667c8bb2bebadce71a57de8c88e8c5923e944fc25e6a534c05141718a73fed38eea014e233ee0d2ceb'
            '51a364e8ccd34f2e37f41b11f415269d4818b79f835ad36acdf7ef7596c566f8d874f8022e5ba9dcc9ce2638d874d994abf45f3d48ff14fa83afe933a859489c'
            '6d846a142282312c8b8f2bd5c48687c3c2f3ff54eed5a029649f5efc42342b8ad6d8c2f5dd7b0ffe23326df6cfb106d3dc6ea63d74c0a0357cd52601a297c9aa'
            '5de66b64a7dda1661e81c761119a687617f79778311c2ef77e8c3e8833bc40ae3a457968a89e50656e2284990d5948da3d0b7a0a347e61a0ff12feda03116e25'
            '3410991a8d48408c28a5f93ce73aafee6a2909f790421b3027a9f70b3368422fbc9c87a16fe43813905634f9aba5050fdc7f152fdbba32602188590f36630e28'
            '7fac939a68f7037830f547dc0bedf59dbb200b8aff960a3d2d1e6048207b3a1ff71a6fc4e1923315a68a062b27c83ce947f15c2c93207aa7a76dbcc5be6fa369'
            '9a27a7d052cb65ffb2eacef19d3b1b85aed219571188e908c071abf5fea09447c69d3d516f6dcfc5a3dc9e8ff81924988c8f78de204d7242dd0fd9457fe655f7'
            '60321d6d5a0d290ae1f802320bd798fa62bf7aea369a3acd9bc15a1fa431e362e5b88c5b15c3627a33beda2b00b751f66bc2d344c651aaf7d00c24baa35b3347'
            '0d0b01f3ad584e4b5f13fad2a7d4a6ee3d78eb4f7f2435402c9ac7da8e6f78643a4b8c2472bdfbdd86f8efba9f0df13daaa18e3d1787be7572a61f8499ae8e2d'
            '4c0aab36a02f62363696db1a78128a71b0979827b37fdbbb32424b69c83aab97889145478d2b20d175708abc652081baa86287e947af482e619d8cb6029ce29d'
            '2e35cccd3df130ef3b466f0c6f56f1b24ed460e40c70142ee759fe2951e906a67082935fb2efd20add9450ebd03044382571e723ba6c82bbee676f76de6a46dd'
            'b68eb9f94ece5d5d65c164fd5b760f817c03b86fd491b1664f54e677a1f4cbfd1e0cd735d3574988d885330a49be47cd46d628de7bffa97b0b3d1fe928ae5b03'
            '0a02aedc1e1f89ab46251976230e2814a25e5aecfac4f2c288368c0b685134278f982bdb37491349a8563e928058993e560ab07cb14c037927beba72e8ce1e1b'
            'a0349cbfe21acb1e61b13fd29075ebd8a52a1332f8875dc76870a747174583ef19a67f230e77d88623e36dc890e0e6467956f37203b864c22b39914e883b25f9'
            '2cad42a597ced92ccb336fd775c82973ffcd4d67b95585e283c7f33f3e61833fc415b1fe874fd8c80dda73a35b20862dbc2042d6cb8123f1726b7be3fa07d763'
            '069fc318236be7a217dad4317b09da798b0fbbd8edf337ccb4c2c1163645e57187c33753650b3911e97b41dad05454a263e0a95e80e6dd986acbf72f68d60f74'
            'dced43dc76b8bac4e5623cc6d6b1d45797a7e11749dc6c6f0e06df1fc839fb1fb358502aaa0de56d2d382519e643dc04ddfcc484aa1b9720f2c13044047364f1'
            'aeeb9cbc301440ac2c22c064977183a7d0b0a76929f819e99984bac33644756990cf316ce24f8ead0b263b37dcccd5960b53bb0b4e3a91c38778172066d5c36c'
            'd3982d949758f5b7db3919ba635aea9315c44984f1bd9fd581f2501a0ff2a0bdd11ddb41232e44d44e9309a8cacd2888fd6f66fe40ff22017df0add45059a76d'
            '21cb8f497c73c28bfbb2f979ad32ae7f1b0637fbc157108e06e64f45a7241d08e01a4e9ee572fb2068c109b2e90670d374188beee5a510c8e5b6aa75874cf089'
            'd8b8c91adeaf45d0f221e37bc9fe38297f0e0e2e6c92c38758c70d0c65b2563febc27aaad9a077101f370d3ed4de0dd44a6be519d4f34de5edb427f38b7b6c4b'
            'ef3b78650bb22d6e6be7bc53a4ea632cf37a8cf037a0931588721653fbbe042b30a1f989e5b95d5960529717a187908d8f79bb3e49437b41576c27bceee35dec'
            'b42a1d220af97e0c722c8c76e455e80a47a74d7f362a36183b98b660e1126a678eb05970842339209b9fb16609621c1637786dab5cbd67d9dcb518ae9a9b248a'
            '59435aff2db948635619e86ce468115b9e9fe90a3b75ccae74eab9f7c46cdc41139c6b9b1cc3e23e893832c9f348cf37c479ac486cb919e82f5bd34e527ae30e'
            '245a43d821f02477da5548a23de7466ea228ef7035bf60c68acb850424942c9f4c3c760d03a7762469747a9288e54bf692b9888843c96744844d9f1afc4d8553'
            'c3e49a957f862e77fee242b806e080587f9ae576b9704c631f160133b8fd544d950ed1a02b781184c210f8b809800f3c4278cd05ed079bda461c71f58a2ae9dd'
            '9a2c62e8eb1c7615db62a93ec836c2547f85aeced50a94e571ca66e06364ca41ae95d6945d946799529e239bf5477f49944aadc1a66de452c7b5f22e39b179fe'
            'f723c86145ef0fc0314bde09a7e1d679de74adceef3db37e12f087eaab6e1c46e9320523de88c20dfb0ef481812776e639bde2fd2b456bce65d1db5a2e3c2a05'
            '4f4507fc41282cf00ff43d202ee41343fb4025243a8f34245f8851d3ef3a7cec8c2680bfe1a5d538501da6dc59fd52a84f3f414b95b068d0f0727a249314a9d1'
            'deeaf8ed73af2e1e7070e50f2d78c1fc87893e11fb63730a2bac0ccdd1a3d04d95d9581101fe3b6d3d365ff374eb96c4a3cb4f40e2903eff2ba72f5f814fde32'
            '4d05bbca4c51cfd6fa2c76c410fbdda3cbf60419d11de149af1e10cf669433c17a32a869209315b8c9798b0b349f5dc41ee52884f2d1ca791d31d85981bc9b5c'
            '4fe183043bb5acfb1ce652d6ee00cf8a82ff187a4c0a7d2a4ae3dd77aadcbe8cf91991868939b0307fc3c7ac433b1d852e77267290fc61a6ea6e49f7333c1f84'
            'a207f6b9843722a7ca2efadfd968deea9ad8a2a7e5634d1937a8ea5984d043ad28d8d1fa292d5665252b2a247312254bc040046e23e4a3e91c854967e3494ce0'
            '678285cd7c6e671ce5f077cc50a8928842ef933cc5adbb87deaad2e54636e7b49ecab9640c03550b796b9abdbc6337fec2b6afec1af36edf546ba35f683e7a13'
            'da43e37d4a6504e3117c7557b132e77511e7e3418213851561c8b41f73fffe1e21bc952c3208a3bc388a053d259d898f03ac42b4e3c826f6b157fb4deb40e3b3'
            'c6b54af91b394c1c6e818766b24467ada8e650373bc9f9605f24fc7e26af7faabfbd24aee331947c1b0f46c8db86115d2269f7a21e20700ab70e61dd6bf5c066'
            'd9e611f0e4a40379087162244c2ce9089a42fbbebcd124ae1c737ee6618d36e33324077b43ccf155e8833a735602b16f1b813345b337df8b28359beb9a370856'
            '51225c8682536ca21a25fb2ae28de397eff8405f35d2c8d1085f66adbaa96d412db993d2244dcd09b51bfd4e3daf61d1b608253e10a1929274f0ea3ad1b95549'
            'e4b02833644ef89fb5a2afbf3120a51c49aa8b61c06274d6fba1774f265c4bd665c136b0f08f86153a47a1fc056fc8a7186864358d65d2f337dfa7fe80dad7f4'
            '7b10f5bf13c565d8b2d38ef06636defecc05a83a2e7580246093ff48c04d3f72b1233e4f3bf0ebd0415e7bc8e9fc5c0183e5daecd0c3f17a82fd41bd38c874f1'
            'be7f79cef26f60d4bc2fe669d77eac9b0d7d0b8f796ce84c3a5c634acd159ca7385a74d783f3349802ce02b58caeece601773645f565be0a24996a6294a36444'
            '29dde3b60cffac968c082ce8bb7d55605cf5f8a5d9c3241545820171e31b589443bab2b35769fc163e5fca8f0bcbb7544f6538ddc7dc1f1a76c3dad49c14e591'
            '7af73d653ace4295f0dc449bd382ea36535f085abcdf20e72e1d758b91666b515c916672006b2b9e43631f31d6c5529564305ebcb07891702ffb446fc2342349'
            'af678aae6488236624195e47093f47e5c6b470118487a8a604e4f55576f24c4749a2635a2c21b55b8dc17f590e7b2f54f2c8a8af72f13149c696df6099859590'
            '5c4763b353a7265ebfedba8a9b33c7aca766115c91c42455c9add42b737ec8668522d5c4641cad41fb3a367c8c500f84a1cf88f34f1898b909ae13ebb627a862'
            '37f4148cb1444d221bf12da10f970b48c73bf38b08a68c1b3f508cf0b43e733b3e496a66f0c34a66efa5573114bd1d07ad7176bc1a10da1cee63ce4c22e84036'
            '2e76697477a43c0109da9083fbcf7741c79032f5e7a091f1c7dedeeddd75fde45844c963c7f454d4d7ba88b81e0d6cee9574e8d79b2a0fb0154143a67a7ad05e'
            '4dbc8ec0b17853f4d85480a98b6d63c176ba848836fc245bbf973c2ca3945e9b787ad9011ef514522ede2ce4ffd36021af7dc4f9edfbd38e151641327a138af9'
            '2b9447f6904d4ab9a833750bdc08c1d5d174f4294d8ce68436ac022de5dd2aa8c50e7a97c8775b8741d136a520e1d264e24d1bc755887971b7b7ef8db1660cff')


# vim:set sw=2 et:
