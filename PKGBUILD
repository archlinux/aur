# Maintainer: hiruocha <hiruocha[at]outlook[dot]com>
pkgbase=zen-browser-i18n
pkgver=1.23b
pkgrel=1

_languages=(
  'ar Arabic'
  'bg Bulgarian'
  'bs Bosnian'
  'ca Catalan'
  'cs Czech'
  'cy Welsh'
  'da Danish'
  'de German'
  'el Greek'
  'en-GB English (British)'
  'es-ES Spanish (Spain)'
  'et Estonian'
  'fa Persian'
  'fi Finnish'
  'fr French'
  'ga-IE Irish'
  'he Hebrew'
  'hu Hungarian'
  'id Indonesian'
  'is Icelandic'
  'it Italian'
  'ja Japanese'
  'ko Korean'
  'lt Lithuanian'
  'nb-NO Norwegian (Bokmål)'
  'nl Dutch'
  'nn-NO Norwegian (Nynorsk)'
  'pl Polish'
  'pt-BR Portuguese (Brazilian)'
  'pt-PT Portuguese (Portugal)'
  'ro Romanian'
  'ru Russian'
  'sk Slovak'
  'sv-SE Swedish'
  'th Thai'
  'tr Turkish'
  'uk Ukrainian'
  'vi Vietnamese'
  'zh-CN Chinese (Simplified)'
  'zh-TW Chinese (Traditional)'
)

pkgname=()
for _lang in "${_languages[@]}"; do
  read -r _locale _name <<< "$_lang"
  _pkgname="zen-browser-i18n-${_locale,,}"
  pkgname+=("$_pkgname")
  eval "package_$_pkgname() {
  pkgdesc='$_name language pack for Zen Browser'
  depends=('zen-browser>=$pkgver')
  provides=('zen-browser-i18n=$pkgver-$pkgrel')
  _package_i18n '$_locale'
}"
done

url='https://zen-browser.app'
arch=('any')
license=('MPL-2.0')
makedepends=(
  cargo
  cbindgen
  clang
  dbus
  diffutils
  ffmpeg
  gtk3
  libpulse
  libxss
  libxt
  lld
  llvm
  mesa
  nasm
  nodejs
  python
  wasi-compiler-rt
  wasi-libc
  wasi-libc++
  wasi-libc++abi
  yasm
)

source=(
  "zen-source-$pkgver.tar.zst::https://github.com/zen-browser/desktop/releases/download/$pkgver/zen.source.tar.zst"
  '0004-Use-wasm32-wasip1-target.patch'
  'Use-Zen-langpack-EID.patch'
)
sha256sums=('c2a2f7853f939f1a5f510c885d450564e5bcf6957453c1ff3adb0ea595b872aa'
            '28b086f5492d8e6731fe0dfe34a2e4c6d4d502a9eefa15a31e44b5788cf4df89'
            '90ee92d93beeeeb8d0838f51312d9a2ece17631cdf0a2d2fdc96a5e6be898018')

prepare() {
  cd "$srcdir"
  rm -f "$srcdir/.mozconfig"

  patch -Np1 -i "$srcdir/0004-Use-wasm32-wasip1-target.patch"
  patch -Np1 -i "$srcdir/Use-Zen-langpack-EID.patch"

  cat >"$srcdir/mozconfig" <<EOF
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-linker=lld
ac_add_options --disable-install-strip
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot
ac_add_options --with-l10n-base=${PWD@Q}/browser/locales

ac_add_options --with-app-name=zen
ac_add_options --with-app-basename=Zen
ac_add_options --with-branding=browser/branding/release
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZILLA_OFFICIAL=1

ac_add_options --enable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
EOF
}

build() {
  cd "$srcdir"

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1

  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  ulimit -n 4096

  ./mach build config/host

  local _lang
  for _lang in "${_languages[@]}"; do
    ./mach build "langpack-${_lang%% *}"
  done
}

_package_i18n() {
  local _xpi
  _xpi=("$srcdir/obj/dist/"*/xpi/*."$1".langpack.xpi)
  install -Dm644 "${_xpi[0]}" \
    "$pkgdir/usr/lib/zen-browser/browser/extensions/langpack-$1@zen-browser.app.xpi"
}
