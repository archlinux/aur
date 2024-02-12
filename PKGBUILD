# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Luna Jernberg <droidbittin@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon+m2x+dev>
# Contributor: Figue <ffigue@gmail.com>
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

_pkgname=firefox-esr
pkgbase=firefox-esr-appmenu
pkgname=(firefox-esr-appmenu)
pkgver=115.7.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release. (With appmenu patch from Ubuntu)"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/en-US/firefox/enterprise/"
depends=(gtk3 libxt mime-types dbus-glib ffmpeg nss ttf-font libpulse)
makedepends=(unzip zip diffutils yasm mesa imake inetutils xorg-server-xvfb
             autoconf2.13 rust clang llvm jack nodejs cbindgen nasm
             python lld dump_syms
             wasi-compiler-rt wasi-libc wasi-libc++ wasi-libc++abi)
options=(!emptydirs !makeflags !strip !lto !debug)
source=("https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz"{,.asc}
        "$_pkgname.desktop" identity-icons-brand.svg assert.patch unity-menubar.patch fix_csd_window_buttons.patch)
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

  # actual appmenu patch from ubuntu repos
  # http://archive.ubuntu.com/ubuntu/pool/main/f/firefox/firefox_80.0+build2-0ubuntu0.16.04.1.debian.tar.xz
  patch -Np1 -i ../assert.patch
  patch -Np1 -i ../unity-menubar.patch
  # fix csd window buttons patch
  patch -Np1 -i ../fix_csd_window_buttons.patch

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
ac_add_options --with-app-name=$_pkgname
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=$_pkgname
export MOZ_APP_PROFILE="mozilla/$_pkgname"

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

  MOZ_BUILD_DATE=$(head -1 sourcestamp.txt)
  export MOZ_BUILD_DATE
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

package_firefox-esr-appmenu() {
  provides=("$_pkgname=$pkgver")
  conflicts=("$_pkgname")
  optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English'
            'xdg-desktop-portal: Screensharing with Wayland')

  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);

// Default use system title bar
pref("browser.tabs.inTitlebar", 0);
pref("browser.theme.dark-private-windows", false);

// Remove firefox-view button and default homepage to firefox view
pref("browser.tabs.firefox-view", false);
pref("browser.startup.homepage", "about:firefoxview");
END

  local distini="$pkgdir/usr/lib/$_pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox ESR for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$_pkgname
app.partner.archlinux=archlinux
END

  local i theme=official
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done
  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$_pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$_pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
  install -Dvm644 ../identity-icons-brand.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$_pkgname-symbolic.svg"

  install -Dvm644 "../$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<END
#!/bin/sh
exec /usr/lib/$_pkgname/firefox-esr "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$_pkgname" "$pkgdir/usr/lib/$_pkgname/firefox-bin"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$_pkgname/libnssckbi.so"
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
    "$pkgdir/usr/lib/firefox-esr/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
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
  __pkgname=firefox-esr-i18n-${_locale,,}

  pkgname+=("$__pkgname")
  source+=("firefox-esr-i18n-$pkgver-$_locale.xpi::$_url/$_locale.xpi")
  eval "package_$__pkgname() {
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

sha512sums=('d468d8ef117d76e0660c5359c3becf0502354c61bdaaeb4137d86f52b50143abec2ac4578af69afa5670700b57efff1c7323ca23e3339a9eaaa888dee7e8e922'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '7c9b126992bd5010a6c038c015eb0114d72e061e023de2a80adeded53f2db40115ebad2ed48394b1be3d5734cd3a244bc4c359cb7f44ab026c564424e3a5e5cb'
            '485c6396c7100d0f2b9d7dc327dc9ffd86199b15420b6bde556f90dfcbd34b29e35b669462031c15cac0b530bff0d06af42602aceb161a5fe1867ecacb54fef6'
            '75125582ae38a1925d885bf4e633bfdf596576b9dd32101584fc4aa347c9710b2b02a68090257453c7d6829e7fe054706e18e26cb866b5d8df8d8958bbf22947'
            'c987b74ead477ec8ee633949f05cba52865df54082b2c56e801a1152b9748b4d732784bfe47fce03d2030af8aa8eb4711c35efa66882c8448b835002d4204c73'
            '16887b8671bcc11009d46a8726fbd6d39c69162cd98dcbd8694c921ad4259baa5ecf9113ed89cec649ca3fa77fcb2252687c0d89a11248c765a1cad7f3eadf8c'
            '3b2112d381c94900236e01d83779f4a4fe75e9ce599933da6a000318f2a75edd17c992f4a75d4aadb8ffa40f43e71e81f63b03e0968614969d0e8b651f540735'
            '4ddb0098c09afde994f29a57880e55dd9725b56ad3828204f12131271d5da94565e30c1146eb648c0cad10bcb511be04509d8b513168966dee6e2424c2cc1f59'
            '3cb6d9f0236dd0fa5bee18c48d42881dfe480a3c0308ce495a98f7d2c25eb75c99dc8175d39268e676b235ca686de948da23efb26663551b29dbbc228656e28c'
            '4dc1309446821e0cfee92c227c70978a74a6b1a4aa7f36d6a9fe8c606a0d6993dfba0a5f90ea95dd1d67600883b1510175deedd478749037c172c2273468c357'
            '9f64203075de511d250e3f4a6b9cf2f3d87ea0170d8139014f7c428cd34d4fa1c81d586289e47b5f6462e13a5df5aa9024bb962f41b084a69cf813f547243c73'
            'd1a433be80e3af745d2dc33b9e9c332811299f14fbefdf28282e16d80bc980a6365a717ecf36b0517588a4c091299e3be572f0b621842035e7623ab04a7d3691'
            '855e7e175ae03c553bd90fa5bbd7806e671f758055c45015c15bf9c974ab806f41390ed87a0c1020962030db302e6e2bfd6dcb44312603eb29b4dc71c8ff1b98'
            '545a74e3bbe9048e3c0eb8ca202b2b2617bd4aa5a9480e6d1a13a1e155e34f162756bd0bd26fe198375f0d38f565bc07e1307291b8ba3a456b82967d3d413185'
            'b963236abc046caea57a422a7df565d2c8585262c26096f83bdb895f2a7471dec297c41f9b66b0106af15fd399a25ee70eb19f10e726ef35a1cb21a0a0907dad'
            'cdbff863f3c3c6d61911a0369212a3f31f618ca39bc5b0567f2a777c2ea5290b798e893802e057327a2bb20987432f6ca855f124073cbb603cac0fb5e2c7da31'
            '1cd414c89fd5a4f51183ba26c4c183949cba8d86e2104dcdf312eb42916945006a3fb063e54384182e5ceb7646afa6d9884f25002ba8da4788c3436792e2bd8d'
            '375022f656c78f285de704087e9dd7b5ef720485b2b71748631470513a56e85908ea24798b3dd6be7f44ff0a9fc0f973fe07891a8b02ee14d50d6bedb0692f85'
            'e83d3a2e001f241d442e215f75f8b6ce75269c5c14abb069c36337fe2c83d6e2b2693f2d266911c4a0c663e4fcb1b32bdc21e8a8ec5e5c7fe0d02d6362006d3b'
            '2b7f500f4342bf0bf84877e9aa7520d9eaa9e0ce7cfa6c6b6f5638d9a12793b6c28cf7d9d2353a498665e9cd403ee55c8cb9c3fcf3ae0cc68f3989f0de47b90d'
            '80d274f49d97747e6ffbe0226381238994cdfbd5e730ee264e95fcdf073463246eae953e8554f800aaeab0f00c615b3cbe952fb8a8e90d18b2005248728cf62c'
            '3bd83c05417bc903335e033a73ecdfefafe5e55de377fec47480c8940cb00d972cda0835f08f2ab0c0457d40de6ed23a7a6d877a7880b2a48d95cd64a9eba638'
            '6b93661936aeb78cc37134ff723e634c878a594f87957ceec6493eb7f42b8ffbac540b634b0e7067410e799ea1cbebd1a547f4d6b354d01ad01bef1e9753d3e0'
            'f827e969ec36e6ca1cb5713068192d3fb43055b8d70d1b3c95283bdd5d55349334d0caa3ef307c45591219a5e4b4ca941bebc730539d77fa70b4ba920ff87374'
            'cb4326b05a199e414d3a4dd6de57f86c6bcacd02a62c1e214524809e781f8d5949c5537779082ed542aca7ee2eeb08fdf78723ebef595f1eee6230ced980b5e1'
            'de43379216ff04691ea981337febddc1402c0ce9a3e7a294f99dc26488d71cf8c04fc2edabe9c4529769e7b2b7b8b93dd80862b4e703089f2d54c3d27ac76994'
            '0692ced5affb231b84a35a8f24211654e333bf8de63379b54d44c9cac9c651570670287efce3819433eb1a23347932544eb028e2e40c30536e5440111db39a03'
            'e152d63283ec402bc39fb283a134cfee8276550e9b44efd53b21884c834f7a765d40ada30e9078efa37dcecdceecf8d0d00c9978472c30af847ef3acace437df'
            '7510e04a820ee0080ead5f9e7b1ecd160fed19c3e463444028bcbb62be49709012198577eddf34236d22cdd57504f9e8e1c38d75eca52148a05128b649ac0504'
            'd60b2b3e0426a5ab22143beaae071d1f331eea68658c0f7761ef049ab861e7b520e90ba137175add22eb780ccb22575f4e602799968b2213cfe47894b1615ef3'
            'f47e51669e61efe2c58ed44a882aa2cbc7bbea88a8ca3345e1ba525f96cd9036cbef33c6674b48c363448c2c70e9766808f28e844c74cf9d59e1554370f7265c'
            '843c118a1c8cd5d4530d706b5e508606a4301e4e8b0a0e5e64fbd68dcdafec58c3ec041f569623b377a8f03fb32f27be21908e66cd9a89c480c324535105ccf3'
            '6578e46991db85ccb9b7e78ef258fbbd073636b12ac83ab17fbcbac26e9c8428ca399250ca678ca4cbd0b149e13229e79cb2947c49034287431a339dc12fb8df'
            '88db3ed8dae3fb7a5b2e3f5364484cea1216c27d1917de8f81c57566e8dfa5b2dc9bc394aabaf4a10f15432b4efc28aaa1df192f0ab964f330e82e3a03bb4b94'
            'c9f1f3eb81615d63e7f1221e4630bfc16a7566966311dceb7399806f79260bba2ab7504c78cea05a701fd324e7b99202a246c588b732e685b8d9201e98c1ef29'
            'f99c5c6f65fc292aa7bef3ccb1130fedc88c66883cf87399ccbcad43ca84fdc91106c08a633f8a6a204fb3fcc656aad1c5c6631feb8b3993e822d8f3af566dcb'
            '0fd103b8dac5bea6daf589fdf5608d4bd81c5d79c249e2f7796157601fd6a5b1f2e334b662ad6dd9fd10b74bb331377802ba25b2f447a4e860a48bedc7ad37c7'
            '719c95381b8d4c33b44ad8a7241d286f0bad69044db12ac93335e6594545b070d8498e3f86c49d027e2abb27c43da9a53693603251c1f0a80f32d122dbe9c3fd'
            '88e1a836244cbd6534706864a080737365b5d52ebe9226169809904e589cde01833fb96bc3994cbc9127ddff8039ecc66811f71c44020d0cc768d2af0a05850b'
            'cba2e9979070b1971fcaa740f3c40d6a866d2b4931783594399c2a4a5bc84db4fafd6d6953f6b5fca4a2f8a1b2c3275080670a35d7184f2015992b6ef5e45c9f'
            'ce708b20973d3dce0e66ebe61ce4bc8eb5c2b4fa1a88e8a80c48989c278f9cbce1eabc0fe4beca792477c2d33d9a7b07c8d250935abb726becae825727eef126'
            'ab173871fba77f388d63e9c02aab665e69c84bdc034dce7c47a13a2ea02305411ea95466687888da8e048003f5bfa699a030c797bf178da1ed3ddfda3c701da8'
            'cfcbfb3bb8df6c8387d550774239277e19e1a04a00dafc0786edc45779ab1030ad2242403839af8d5c09b5d391f6ff5398208aa4fc5b44686cf23d5722f7fa7c'
            'd9c16d96365ec19ffc79ffdba6bf23df7de97882c356443277f4b8cc331cc36f3444cac9b1a1527d3a8f218a4a2d85f1a61ae3cca372a905c07597b87d07cdd1'
            '8f1d31bf6823903129b7b5b121b0a79b8353f70c3827a12aee679bbb7e08541ef6a1fd591bfc14623d6243c83dd8bc776287f18882c1f952f918271aed7f5cc7'
            '7d379f12ea6ec75d25957319cad4618f2ba24a18578aea4a0c981d61cd3d6f78edfa84abd203ce1b128901cc7c613810f6d7a3de831b9ec6cc290a4cfb1482a4'
            '1833aec5af0f012afec32d130cee1eae90c9435030659fb3b4183935924ea855a61eee5977ae3635c4f22ea5511a72e2cb42f042db6c63835952387ee77e1f5e'
            'a841b1ead782ccbd5d400510da68c5670ca0b7ca71388e1055d41779164b84cb96e9e3bb52eb9998b1e092ed4f18bb7219c0c0bd7be0fc4e68681d5f37e434f1'
            '6cfd84b0257fa0f7e2f67bad84b1e4b804c7ac9491bbf5822ea42be543c6580fa71485d6456920cfb0c59f488e239ffee281d35e77f1127878c4b89eea3bdcde'
            'd745edab3cf15ec0d55f95075ad2192df228288311ab0e0160a4023a18d8f9a528318e6811a6758b2aa98f8c1eaffd7a27ed38864da173cdac885a1b92be9300'
            '5932b0e5e32ff5d4425cb4c2f3185605366b66de9f889e425cf49bb7616e05a9adcea548f682776ce421c8f2fc8ca24a82e359021d0167a7eccef9b53159ee23'
            '7dcff90b9aa320770fe770c74b33e4cef68a7e171dba3cf458d3f23e544451aebbe0b33ca536e81e02e6aae0c848c3e17744fedd39b3260ac5559e760185c27d'
            '226f8d0160658bceb50b72bf3687a1f142cd9a7dccd84cbb14dee610364095ee090c505eb32aa09505d18c03fea7ea0b7905b3c23eb935f2ec7b2fb48dd4499b'
            '423b8d56b641b905e2e669f3b448a8671944098b3d52760dc596624c527084931af2cb02623661340bf0604b0a8c2d33ec0bffa2075a5ee6ef135fd9c3581127'
            '69da6bd2de90aa1d04e2d24c3b6fd11df491e08d8ff16084b4575ceac5951fe52a9399c4b4e1be2c5085b437108cee91f01e30f7b6b37b1538f05672a8180c30'
            'd88272b6832180615b0256e067879c1995cc5148cce0da3d96b75e9f2847b1a7b7203ac1cca8c55f7c7ca837dd866b9d31ae398aa20f1ccbd3e1c7e4785671f9'
            'aec58c5f1a22cd79b005205cd35f69ce1ad4bf3cdadc971acea265f797181009040897a2445a30ca43c9a2f865de19c63588fa8c0c51f9f6d1f1117d820e83d6'
            '5ad47abe2d02222332a01417c4f9faa3939a5fb84a977a9b511c65f62e257a77919f07c8f2270d8688c64d4e0da7385e380323718a2f7f7d26fbb62b0500e8b6'
            'c25f500335880935f4f1206102c6b5498ce2cb7ddacc9a2c6fbda86bb42a70aaa3197b7ada6410921486c65e9ac6f69f59b2dd0138e800218451a3a9771a66af'
            'b17dddc695ebe6a8fd2920dc70786d535fb0b5d2eaa8fd2fa0e21d953f1387a74a3ada719a41bd57a6f729b998e736cf7d70be099abccaec7afad25d6b6a700b'
            'e10ad26ac07b5cddfc7a5d566ae8aee20d593ee1ec8f2d9b0bda47c9fb69c7c3ec53282e362af8af47025970cd98192244a45d09396585cad12e374899727579'
            'fa1881189e43edc0de3c10d83169e9166b3cf02e9b3ca8d331d849f154d9227e90de4952f79850f834ec4fce87eb2fbab8e01f3d0874e23f95dbfe4cc417e7b9'
            'ddefe43a2ef9f18855199cb6d135c6f3b7d708c1f8a6772705c0b1a35663c5f25ee12fbbb8447595dd7efaeaed24ffd8691b2361e035be29c624c8f63366beda'
            '9bacba418316869ad24c71f63a52ca065e8d0a0a3cd960474f4044e7d3d1153aef07a36dcd9528a5d458e830fd94ecef706a45b38098a6dfdaadb2da5d51f206'
            'f6f915412a2f684cc6b002eaa27b315d409730528cad53896ba35c5b4e73ed8888d8e6e2f985a0109e09cd17cbe8894276c0c576908cb7baf10e81f76f1f9f29'
            'a3027fc5491b63b11686aaea199c421706e576044ef4999ef8b3a6b6e71a73b7dbddd77397fc06afb7185d61b2f38c3b0ed3066bd94d9a85d3aa8a140b5c10b9'
            'a806a4bc9af9f27963c03c4b5e7e165f04877f7f9c051bcadfa22a4e2701dd8b8f6db65003dc638c335040e71033bd72b085c55520357e1176686568298be572'
            '43f92ea8d42b9df3d45e8279a7754ba2fdd95c9fef30230fcd43036a8bcf626aaaae9351f8b7795d523af82930a52be6bfc865f41fe392b82dffc815c005b5e8'
            '86aa8787692dd2cb9e9b837f315c002b67ec7f0848d4b5cfe06a404844f59679c962ff82916bf70cb4eba9d19993602967ac76d1547bc899f971a624e338c017'
            'af62899365d18b7c9a457b2670a1940bbd197e06fdde89e424a8ccd3a76a1a8bbdba594b4b410c30e68ac08a98fb5f7e6dcded99e271884a439de739b20df055'
            'f50a70416890a04dc04075c5e42ccdf356c5420f88f5c7ba65af731f9e3572f919027630633c38b4a47a52793b7a62cccba18a4fb3fba17ddd0a68016420c378'
            '15e5cc1dab35bf5913c5a201deaafcc716845036a0bb32b7f6b6a1f7528f3d7546be93a6af9b6f3cdb263b52c19dcf1bfbe5087b040c982434a88a78ec6cfb5a'
            '3a376cdb41774db5f250e500b0897dc392a681cb06fe37a172e9a1f7ea909a39b20cdfab01f4f7d164d939c398e019225239211c70baecabf0a3c874161bf081'
            'a75d32a748c357ff40b74a4501e45a09d2ca5d9b7ae6cf564ed493198900d51a65fe2b1fe4b75dbd0c22261fe98f84f972bb9299a340dbc07e22e58c4419df7f'
            '0e2f5bacff6496bd0e6aa6c364debd499ff88e431d1d1ca619d55211bc876090f7b72eeced0971f862142a6988d5a9e2a23ba17fafe5566db67a7d2e38c19279'
            '32e98054f9ab1a4f8757db04403ba6f835467651ba5d013bc3ea8cf884d26e19b8dfc368ecc4640df8eb978f453be394f75a9c60f0030ed04c34ea1de4d1fd4c'
            'dc25f817419d8510a71b0680154d119da17409f5ef86a9d0666ff10ff63bfc5cc24b3912a46f10cc5c61836454a307956afb4aa5e950fc916927173e664026ed'
            'c9edde477e9b15503539deeb39606479006fc043a0fb651e186b55c1afb99700f4f73dffec10bfdd86be5ae47043e786c48f1bf81ff11d67d337472efc8f95ea'
            '47fe61a807e9bbd4093a83f44232606c5094070831d379ac95d0a5ff61a832e332c46bc5af8c8ed8347a4dc3ce14a54f03e5b8c5cd8a4b46bff13f30f881a8b7'
            '69dabf2ac5f859ffa93144061a1c2a68d1c171577b6d058a29ccac710155b6a80869f4eebff56c2c767e451db56f4698bd1482a69a39699cdcd6ea2b4c75571c'
            'abfb4e2be0345bf485fc541d4426ab7a9a4a128acf906c5b8da991157fcda7ed32705649a3c4b3e1df3b836c23f9e8e1ec3877075e57d9dbc91eb2b1cb68370e'
            'f5b1aa7aff43466444a15e8f81f6d70865162342a273dd40dfa722eadaf4a1891889a52c400ccee40190f5ed4f305f7be97187a8413d38d25d3b4c398c0530ed'
            '5d7055409a8cecc935afe5bbbbeaeb2b2e826681e670fa145f96e8d127f873237d2008b3d8376b73d730cf8b278f92b2cd8a7f148216c66995a23f5457902ff6'
            '454d1afd15543a71576b98649a5d18bdd360ae279f9f75328330161610a04370431b9345af37c353318d351912bb417990c434b660634624a37c6a2c76e00fb4'
            'd880813460817c5126678412276a204b4287b58f5b1e2d8f69c4224b337c21d6c775dfc47a61d76db8ad313e922db8e5d09e786fa646b1885ce5b79ff05f3956'
            'bb48d8203a8e305d7f8568d2fba0afcad87c71e84ed632bf1c2e40f243952efc917683ef34de3c8425efa0d8962282d46035b87ee2e9beeb2ebd68190425fc70'
            '0c3ef1106b1bf277e1e0c6a606038e3170621985d4e61fdb6c1e19e4f65a12226691f7ef1028e38f42a3303a903f09c2bb35851d12169b6a8a4612950fa25b6d'
            'adeb14634628c64cfdc9cb4b4bd7f6107d82cabc796461cd59c4f688eb08e22211b8e7aa39132b5013471270d2f624f6eaa80bc26c59d357c05593500d10ca8d'
            '3b28e25db7c264f35f04ef629af9cf1ad030fe09d1ba3cf1723530b213e4fa15f4702308b1049715660f8f15ce25ceed3f99a32ece11e93212ce9a26f8e8d8b6'
            '77e15bdbefafba481841e21066b93d075c0e0223757f9a3965c7e4ed2b07aaf1f9ac048af9f1209c0cd25e32caa02a9c5526919d559b4a58da806f0447d536c9'
            'eac4d76c692e695f2a08f253b9d920560bf49e44866eddf3301e1086b7c0701a3c66484adb925ec891c354e4403192e2877edeceda9d231c40928c3221c9b541'
            '560fb90750cf7cf1f574133c6614bd7ff1d834c2abb4b350f8683a6c863f7e3ca297a5d93b6faa5373fcb1cab88e583e2f393867cdf6bf6469cba49877bf9ee3'
            '22571697883db27cd3c267f0167d4eec75274d89c4484b8069cbae57a84c53621824ca8749d59b028a0d3098d6b00edd37bc289f1ace341559373fe8231a03ec'
            'ed1b38a94ab1a835f2871e153d8291f6b51a308fb357e351dd4401519a9dc6b65431595ac9bd90cd969427a7e22cbb920c354140342a198bfc22090173a1a51f'
            'c6c4202789d4a8a4ce2006a589304cccb4a8d7b330057083c953a88d812a74ef3ef6b0b8087d0229dd779321a3fa467e0ed5432719b1aca9125d374b8f65c0d3'
            'eed056fbcd145634fe169a32f202170e8057c6a8fadabfa31693d69a888477dd5e159f35a80bc3e668fccc8a928f0e57d3e1fc56c66e3f969ddf6fc4ef335aa6'
            '9eab7f890589677bea2b853d68f235a004d22e8d88e34811de84cb88c4daeea19f0df9e678e9b8b49a8511442270ef865943c8e0a14ba2b95ec150c1b14d6d61'
            '245b0c73706934f67a5868909cfc02759042a04b767b829465442138fb7df70081f7afbe6e874579d46cb3ff9dedbca7bb4566517619a5b46ed2302d7611ab7f'
            '56cf7b780da0d3e93dd87bddfe8011e28920581dbb59432a4878aa241a3560ab89c66b6398e9d40a60099117e876eb216ab73fa2d9119f5543396118c837489c'
            '3f2d7e5acfe47aadbaedabadb097659bddeb664dee066ac88b1e54602cddc91d54bc34eaf2bbbff5da6d20072ad2803e2e3520db79a45be3c9d46010e84fbfaf')


# vim:set sw=2 et:
