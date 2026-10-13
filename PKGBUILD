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
pkgver=153.5.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release"
arch=(x86_64)
license=(MPL-2.0)
url="https://www.mozilla.org/en-US/firefox/enterprise/"
depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  dbus
  ffmpeg
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libgcc
  libpulse
  libstdc++
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  mime-types
  nspr
  nss
  pango
  ttf-font
)
makedepends=(
  cbindgen
  clang
  diffutils
  dump_syms
  imake
  jack
  lld
  llvm
  mesa
  nasm
  nodejs
  python
  rust
  unzip
  wasi-compiler-rt
  wasi-libc
  wasi-libc++
  wasi-libc++abi
  xorg-server-xvfb
  yasm
  zip
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=(
  !debug
  !emptydirs
  !lto
  !makeflags
)
source=(
  https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz{,.asc}
  $pkgname.desktop
  identity-icons-brand.svg
  # Make different channels installable in parallel
  0001-Install-under-remoting-name.patch
)
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

prepare() {
  mkdir -p mozbuild
  cd firefox-$pkgver

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "${noextract[@]}"

  echo -n "$_google_api_key" >google-api-key

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=esr
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
ac_add_options --with-app-name=$pkgname
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=$pkgname

# Keys
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key

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

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
  ./mach build --priority normal

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
  ./mach clobber objdir

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build --priority normal

  echo "Building symbol archive..."
  ./mach buildsymbols
}

package_firefox-esr() {
  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install

  local appdir="$pkgdir/usr/lib/$pkgname"
  touch "$appdir/is-packaged-app"

  install -Dvm644 /dev/stdin "$appdir/browser/defaults/preferences/vendor.js" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);

// Enable GNOME Shell search provider
pref("browser.gnome-search-provider.enabled", true);
END

  install -Dvm644 /dev/stdin "$appdir/distribution/distribution.ini" <<END
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
  if [[ -e $appdir/libnss3.so ]]; then
    ln -sfv ../libnssckbi.so -t "$appdir"
  fi

  # Register GNOME search provider
  install -Dvm644 /dev/stdin "$pkgdir/usr/share/gnome-shell/search-providers/$pkgname.search-provider.ini" <<END
[Shell Search Provider]
DesktopId=$pkgname.desktop
BusName=org.mozilla.${pkgname//-/_}.SearchProvider
ObjectPath=/org/mozilla/${pkgname//-/_}/SearchProvider
Version=2
END
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

sha512sums=('9acb8d1a4b241767e39da36d6f520d4edaae0f237f311496beeed10e2383cf399b0af11cac6984d425b620af0ecba3e67808637ec74733c7d23186d0dd2bd5d4'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '2b06a2398e862fa4e61ee5e41971930a9c50a90fad4ee99231fa9f8d94d07e3f31a044d2a306a73e28367f654ad5568bf4a64ea42898a5001969022e3bc8e992'
            'ad535bbe306957f698e7fa8317a3c9d979963b29c96a9e62a0c2b1acee70bd36bdf8c8b9343b44f41749e09d53ff7d53defa591eff1f910280815ce463b9bd49'
            'd8cb5aafc4b54eebcd39a68291a34df4fc04390791c80cb70741fbc4e20895aa2c229fa6bc5d70ced0bc020668a87747736236dea40477926bb420c4cff72cea'
            '3825a53013a08b296d69ad8fa85e778ddcbd69087736c46e818cae2f73b39a0550972d6b045aeb8a2a0ca152cdafaf6c18a694ff9db5fa602582305da663ed47'
            '0ec26686c8214658eb825e0f8096009f1ddcb936c65b3dccb72c1e61cd1ebe511e6e9927f51e152ed8460d48e80194f38ea9dc86ce4b27ac8371a639e6675f52'
            '9db501f37e6607d3fb98623222b9f3e2d11906f20aae880ae8e86de14a32dbc61903aaeded5c89ac6dc19f8a4884d1da9c4b042c45550d58a4c962b191146497'
            'ad8ec473f1f63743ab728829ac88a96d069a3a1efe2c204270cfbc97a1ef139ea0e82a9e2220181dcea232a20b707d4091b3a0ee4bc2165ac3ef43a97356795b'
            '619204fb71c81d5b28de3605244f30e4a5d055782c506e42a18c103879fe788536009f0303158f5c8ea7ac94da47025c984d116b408d81855e60fa99b19dfd12'
            'fd21ebef66434099c028d3ee901c6de94dbdc0e27b619580e6858372e9e722b3c35c58501e697659417c6d753c089d89608b2a9b886dd9ce66a246c6702c5f70'
            '89d814ee55fdf007f511d805740322d0c7694e1c520bb4e881cbcd8134c1e33ac1a21adbec04e017fcb5f92163e7654b44db27ba056e0564e731a1ef9e44107a'
            'b0445facb0033f488975ccd84ee6f2c8ea32ea47da28eb2e7d6ba406dad5597dd9431065dc80522f4b5384b1cccdf00a4a0d6cebc9295aafb4926f184e3cabf9'
            '2fc05fa30cd97a3353a851b65acfdd10f71dad069a207818e1f5379bc8f551ad3b9be3de3657d34811ef3b82689756970c8ae1d4c2d26fc3653167ba600cfea3'
            '1de5e584d8b096388eb9a11df4cff79cc10cb03b43bbcae9c6be9a877cf3232ddc84b3d811a635d6774f03e5b79ea919dad685722a198fbbd589cf78188af5bb'
            '662a5a195e374a6ba3a6c7bc887c60d6907efe3b80fbed1d574b78cb40b186407eb8814c42da74e304d514c9534ae53b035586293c35216b268c9cb4f161f6e3'
            'd6f1f7dd9558156250417b1bb0a623582d4abda5a2c46bd3568d481b9328d585acd640d73f554d785f2036e7055e173af6baf6a7f0a1cf5bc347bb1b818a97b2'
            '7a4fb283617475eecafd86ef4b9379af5e1b9cfb9e8b955db256b813681743a0c3e55f0c6b3b8f47a246be01e21e0b3cc8226707fb8988dc2e7d97d541b8fda5'
            'a059e3e5db0115c451558d8e3eb7f852981b12f95dac8cc33906f2cc6c416c972c404b56ef6bf11a5c265edb917aa5d97628f4b64891c3964e0dd7ffa022f415'
            '6497553620c4e18b20d3092ae2d316125348b64bdffddba04ebd018f1fbf64b2711b83cf7552174c6e2ba49617c5173bd4134c546d604eb3acb7a8a871f8d0aa'
            'a7ae909bff96a9b0f3276e0e354f584315ef3d79a3119da4748b706d26e5e08750699ce8cc344f65952816b1777459d9adfcaa66c16fadf157b4fb82246f08e8'
            '0f22ec1916f594e5e72e922a783521c9fb9b62f8d3666163973326944ff1a2e1248e647a208e7c6bd34b0cd5312edf039816e16f9e5c37bb8414e49c9c209595'
            '91896b3b19891f33d93cc4c964eef05ca6af9096459ed9a8fa2264a50e77b93c5da1c32b3247164423669af717f51b9fea7a165a24cad7069cb42f415d2334f3'
            '8712c6146ee03c2e1845f79caa2d2d65a699c13a9042c2c85b4ec842fd8982ab9af3a310bd35152c6276d343711361b218b31390ef83e890a84b2698312750fe'
            '4eba8d730eb8d6949c82d8110e35a270b6d486edbd89aeb9d6edcece0e6f090e4bcab333c78b6b9b4b83e83e0e03ab2a1fe3b8ddf0c69a47ecb33c4a76b6af4b'
            '3121f57fe818136ed1aa95f478773067ea2b8f62c09dcfd15625b186b596695215686ad1aa7e1b1133e97bf45de69fbd8bafbd85d2afb9b2b9b4984d2c60578f'
            '09d9ef42f48fca3c624846822f8835e9fca6540cbf4fc7a16935a3493b016f518c4af3302968078754c06c8f19dd4b3afbbb9a8955e9e725b8b42b15c7d6db3c'
            '5ec7042ae41f290f9b6e2419527c19e09914092cd4c07ddcf9e1e61751da424a85d6f3a02693aa4b2eecd1ea5fb0175687a902b369b143df87dcc682ba5ce574'
            'c570f56cb2d89cc9b4c4ab47dcd3c7237828be564233d21448433cc6c3cf19c3e4bb79a2e22ee4f601eea976e7b648dc9569528f5d00fd6917986a475a3f1d67'
            '565655a41d05dc725d9d5586f5adc8497eddbd602c70c5075f1f1bfe3a7d9e796e716e18f0154cbb9ef79607c6a3a98bdb04a50ec16ca0a8ae8381af430e5994'
            '8dd0e0fbc882be85fb7bebd862702095c68e35561f6c7eb5fde171034275f31d21b2bf6bdde696d05bdb5d9e5c3640297c0e669c3d1b401739d5b2e7e1f6b53a'
            '1bba9cc14ba6f545389097a32cfd7149113bf6833bb57af541eed061858a7012cd2bb483a3ba2fb4d72e4062974b2985d8a4aca8f905de8c019aa6d838834129'
            'c1af38b81e49ef92afaa011f37c5d8500283f0c2521c03227ca883958003ce6269f5bdad6cb9febb9e5717e7f6780d93e6ef92d7ff310c8cc457876b79822046'
            '28614da8f87905c7c0fbd43987646834f6a91ec49658ff6552dd47d9a89238be4da09e3fa763d082d9a746ef1605c487c445c2fea6f09d46f3298e7a4db3b49d'
            '5de448b789a5ca2d42b194806c3509e557d9f2b45d64dcee086743843a358f9de0404f57ef4ef543a623fe59decdb12fd949b3eca85ae777bd3b70d4c72989e5'
            '91cfca64b162bf4a670b064299d2fb0c5d0fbb23ae714391d4b44b1b7fc896b97a362554990db4ccb278b0e50b18501572ac6ed01dbe752f7fcc2b7665686f76'
            'c8f0b0fd1069365bcf8d69c28e694943463781be0e098680a71d301654e822d744a8e3c79f5658a015e82e2e897f55424f3fe5d73708ecc4e8746b6fcf98085f'
            'e651d6f83a361d73839a618f4478591568ad0cb2294cf5402dc2a29f0bbb2d1c382d3511001583bd1180b117e5a892ae7778960d98d917295d5bd773ba05c00f'
            '647fcc35758839c34847dd989bc2d9aa4334d91a434b31ddea772b0d2b7fff99108c87470e2eebeb252c4ad77e98cdf38aad919b7caf20f2fbab946c7d58192d'
            'e5b6d5b2ca577e180f9b6949ef48d5e5a2939c98ec4ad0a7c40b419550a0367330b0120b6fa43cf4df5eefa026a4247e64e053f31c0efc15354f82766b220eb1'
            'a97522f974b1b6283612538b2331115c1cc392c160eed8ada4a3ece45ccb11212a6df7298ed69395c926358fcf020efd66adf36bd18fbd61408f145c52fb2de8'
            'fcf7446551e5dd7e397892ba8a29f59ff0533d8320aa461cd0368277e8540014611e756b95d8840a10f1f8d290239717b0448d3ece9d61f4ac4ad2332b406019'
            '77d1c09a3de21e0ba704097c11f8a662698e31605ea2a4048d437a16dbcf98b5ad38fba2cb40eed24998b42e5532ca7b0a4b4d268a3665f9ff36c7fe1783ec18'
            '346d91a8beff4d231765f18781b239390d0d579c9019d0add472a9484c7413f6b7154e656156facfb3112734c0ff6340f005fe7109d5fd9a3bd4aa2be24d1b4e'
            '6f16896c8c6c1b3dd74810d755595b6dda872fd315aa86346cc59b96d3e8c739dcab3abc429f6621bff3de95263a59c896a0c05723db709e1adfa6857777a859'
            '68dc719851740be6a5d20a0ea47609f9e67eddf955db01eb5c2d20185250a1ab3817ce21d5afd42e26936c9afff06e17af20dabee6ba737639ec9cfa63c49008'
            '284b61a87c3498517b6aae413b6e59a6fd133b9f2a3ac5d937f2bcb5f942133bcb3c31f1a8b875498cea2da8e881c8e413dd2165705ad87a7bca2ebdef67d219'
            '45192c695afe4d9141073a95cf50d2ac9da1d7a22521d237d1e123715d15feeb3279f52c2656ed969327afa51b68aa2b5d8e9d9f2435c164b6181601236ff0cd'
            '9016bb0239b66e937f3c7b373570e2ff14b228c14f62e1fd5ba38b647b6edf42ff7b559b856d26da181848769055dea499a472e684250e664e9acd1fb249284e'
            '6e3d7d58579ddc56fae9539d6678ded6bc42971ae33c8e835fd6870d50c48e3742d7592eece1823936826704412018199993b5d2f85acd4254c5a9ed94a719ef'
            '34844cd901ebb07a1e42c250d068d6773a413ddf22ab7425ce714a7cbb00c68edc343b1dfc58f87d95ead630738ca385995ccb9dc282390b6cb4c9cee512dd17'
            'bf4c3334e0c95202c669e90467759474dc401f92d4c49f68fcee7832c35cbdc80fac76221927c8083d53b26da39106432e73d09434e10961e16755e7df9f0139'
            'caa022cc13a2e718385e6c047e2a6a87ab7a68aa876b918a45ff9d77c6be96d8d5e91cb84f95eb23f41f261ec8f639341ea4df34dbe1a7e4ca4cefaf3c4c969e'
            'd16db5cc4e4d4eb58dc0a33688ec10713a3b5c5c4a3818092aaf2b29224e57cb06bf29e995693c9a98028219806e0a07a0250d1804869d2fd84b90ee7344364b'
            '8220b0ae602e7dca52cb3a36e40fb168d78d2972a8ae36b0e19469e008543e473b6a687565e34f1cd3b69a74bf0507f3ad444c2fc5d2d7bf58d7c2cdbee455ac'
            '5dbdcc99d8d460627edd10dbba9818a604fd24c7288fdfcc808f4bc63a1ec2773e7162e23cd59e098e64f035fc6c9ce10b47939a930f2b3fa480a47034445b7d'
            '32b52fdb03bdc2281b13b6f7b276ee4090181495c413fcd08e7a57e139f3d14e10878095f2bfcbccf19be5a0009ef5948d377bcd2c90d2d62332538f2fd3f0b8'
            '374226175dd1a12f38f1ef980d86dbe815d64ff654ee1d3b1adb0ab0610a4b50c3d4ccf587dd348b3ad49cabd0c871df725695d35567d84b5643fb6530d5cc57'
            'cd73f400803fd9bb5004d05d4e01a203d016f03fc3b8151f7b7030f47095ee7521558c50e88df0baa717c26023c8c435d61077c2c56ac50e2f53645459a865a4'
            'cb349af3e76e39a450c55dac1326642e7dd8a28f511e9cad200ebf4384c83c079b68e44dd14bfb0f349f031339a0c3af51a57d16c0ded74e15920b494a6c726e'
            'c66ec09d2ba94088665aa7923cddb0fdab1e9a2473bc57430fd2e2f67503d77582439d8e605db6b45caa61e24974d660e89f0af6d9879286bcfaf7cbd236d09a'
            '32a34129dfb61b556d8c27f428c1246fee2f2b04ca31a96e35d5d84b58a6b32a77bada5356afed1780df4ed3ff7f2b83f76e030091771d821f7ee4aa8d27b2ac'
            '898286c8687537e35c3916af7ac3283dcbf076272f0862c1d02054286ea15a0cd506ecdd26e98f065040c245d042345f59c3c6cfd5acd9ad3689efade7499a94'
            'fa5d47f7bdfde652f6160f88ec304716990e988921290da64ed36c04d83577e9716de103c1aab58fb42f4814cc5a68594445aca27ccd30499ac897de1c833687'
            'ad58ac3f5d9e3dcacf79e882d2826cad10d54122a56e3ec83378265f8dbba765e0a47a7b2824d28bbbb0cd988cba5f09bdcd58a45f2855709ca386740a245948'
            '13d08519f5505d6855287d2258e49b847175414cf9557ed74b30853447d3fdf84637931a57839df5e3749e2f9dd2ec3574896ab3e2df8ce74abb048262dfe302'
            '12669e2bd174f4b2f03792fcac84b5991acd84519a62f51bd2b8b5cd8e3bedc8564ebd69aa637739757599bfc52ec7218ad1a0ef4aafe549506440d8c2a38958'
            '97a25343d116f49f845956d8594d2691632580b32792e07c3580e8cd49c89ec1a848d76432d81f6cb6e8ced627f21cecadc356ba0f6a73304f9b33721a3c3165'
            '1c99898de09c5d86ad1ac70afc0e9d94beb628ea8b66d9ad9bd1e868b8818f64d3128f7e756690e733da6e642fa87ab1fc69f72e719a0f58d49726c927adffb1'
            'a1dd3d5849ff618bbb9c9b3b4d4e0e7a03dc62704d3d9f469fbe69d3ada1dfeda8789177830c4f48934b232bcf5939a5a7bc12b3aefd779037d129b7302b572b'
            'af763da81b6175a6f8701d7276cc5a4a1d6b4f0a9d0183f08e464bb96231b53afc6ff05d85986c1e1ec7cbca0e761194e9ebe0ab2a037df27607540d46891d8b'
            '7a8a1623cf1a32e3813396a3046e56521398c8112fd66ceef2fcbf0fff8ff29deb9506f4f1ed0a340cc72d4dc68860f9f5de4410ff768c3d9755828af8c16bb3'
            '25c61f62faa89a60d0a162955724cb51f746c3592948d5ea9b9fa1c1b497eb103a34b38ec156375c35993519682adfaa93bd54ed4e0ec2499c70c58e1440ffe9'
            '78daadd5377e4a61a3bb83aed9537b269a3c7e8ef624b90f80fda003ed0b1552da330aaa3863a114a86f69ca78639761eb7dcf418063646bc20016428a303f2a'
            '94c4f25ffdc03fc6d50ea07ac026d398e7b164a222d9d636fe0fe28f61d4ab79d9857a20feed2c0d5b7a8ce6194d274222b99e89555d2b82e1bef017c3ac58c9'
            '5791d378b90d2f3ec570c22d9b3b7f35127d790a01d138a94058d10d768a6d4ab395636493060430a19b1df313db3144a22b053eb38d893b20bf83b3d6d3946e'
            '0239989ba97248a0b80230259b62efc3699a72f134ec938eb7244657ccdc584d46f903f667a4b7282b0618a55ea9f55640c299d4dc1030e7009f3f32addb9b04'
            'f336810ba065864b6e7c8652f183ea76b415b25e86d6c182ee251a001f9cad577993bf788c7f4291977b45368c657635f2b9269c644e33c2a3a4d116f43bb83a'
            '732bb0faf1652cec1272221c215f26be2c7b4cefdec446dde7409e2cd28719b77393a4c2e3bad81e5e71137a06288c7006810dcb79306bbd4a1c041534d387cc'
            '0719bf19436c0a7a35a0a5c7490d8d7824d041db3b2a4cacd96de221051d9afb50f9a11a8427aa6087899745def6f45e6cbfd7c08d239501bfac936b45866516'
            '1bf5b28e008364318d9521a53c77d82628f999eb58fb6a087819fca39c228fb487879f73fb056591ebdeadc17ea9f29b5e5e4f90d67070bd8fe4fafa3ad24216'
            '917cccdeb9edabd1f9900f9d05177aeee42dfda3a80d07169098a31d4ca8bdf00b8eac7cb268c8ec3828cf557cf5e89f0811cca45d917e02e487f4f1e42aa284'
            '771c757d0d2d4bac2f9ffad8495464c7f15e06f8a8ae0a6c34bd6549f0c14f68b121746f8a59383810ed0f6b662fe937e3abe7d250251600cbfc550df54e2472'
            '12fa115b328cf9b6a8823773beed5957e76834904d2541bb80ae4d3f336af11f3abed4224e0016b5433e5ab8407af9d9aa66c9103d656390743e65730c49b607'
            '3c8d6bdcf71fb916054d0a6875a1158fb59b986a60c8bd7e6128724a69ae21dc62456d9b0889ac5a6921c4612ea7bc1b9993038993e917fa72511055537938a4'
            'a59b6ac94a7142cc495075bdb556ed1857a83187c088e04a90ef1f8c98760f32be080c83c259057913689f15c2ea8f8598403818918a31b96a3b84fe1b3fbeba'
            'c000453d55b7707459062dee8fbf010d4ec129654c19586b4dd69d070d926a09fd7c3780e2cf746bebb332c3c0f7c2d0f59eef2c05d6d7ceb6aca1cd49254051'
            '2a7f9cb391f883e6bceb8273d993dfa0dd3ed3e46da3fbada556a4fc805fd6efc7f2dd3c38c6589c908a367c948b25badcf2e604647dca37b139f64e9dd98722'
            '11555c38c00ecc023253d790e22d785309d9cdc240a52390a6d695ce76d29a499707a741b0ea741fbfcf8393f7729e85d02263852b5d586d29b16d165b836f24'
            '62a164623e6201e7012d393e9dcd6e45403ff9817e0a2e36667741d5fd2250c6869ca9e25ec8721511508fa72ed0bf095181a02b66c950bf07b9767fc929aeca'
            '10831c0ba798bd9f2ca3a568a0a4e349cf4a42d88ab261591667fba05682d0af6c79dc1f208299b7c462bd91a1a4ba2c9ec0c2b231c877f249ce8e0daadd037f'
            'f3516febde184651c6dfe3914f29e126c3e76900f5113ffd90bdf3bca5830237d2ff62b93a0c7ebc0bce0d655ca378736a1df46334a74f766ee6b2094548425d'
            'eb6cebd24490eb5e6e9c793c478aa7fc2452b172913213830b0e4a4f934790c7523de807974456ef745078dbceede85428fcc7d4ec6d69afabe2e13bb8b50836'
            '65ad9a48b3fc39bec3d9b8fd49a4249631a69cf663a7d23ad184b69230433df9392d1ef1f5f7d91dc7f71b6fafe151fd23075e7b0bbdbb8caed460a271b3cd34'
            'ab5170ad2045c0ed417c17f7ed1c745f3063ab1c3b588f4873fb331345007dc75781e373f612d4d1d33ee4f58a5a16e709e7bdc7249b53d3f645016b7e4f841a'
            '1c0d5c38ac552060cab231a19c777512a1207e49c82e7108b71832ae7c3fe82e71a5ca29a3fe3cf96d65655bc245c5ff086e518070b517c2722b55d4228d223c'
            '3d7a7e0fe8aa1cbb5837ddca1b7b0d9a39279dd82bc8e61148b1adaf5df0aeb03b1fbcaa5a77e7cd11b400355f217c417cb6b1c9cf3269ebf61933cc45661b86'
            '6643b9bb16c883c9cdc709d1bc34866f0da9f5a9abc36cbb4a07ef12c2241aff9d542149e6eeefc61c4662949b1360031d49d778ad8d14f1990dacb3a596f4bc'
            '12cce46ccbb6616bb18888a69dae0e16d6566d5d428741fb45148099008d4dde956f88715efe5e2a3f4fc46b4f677cf84f1f22ee05c22bddd8858f68377744cc')


# vim:set sw=2 et:
