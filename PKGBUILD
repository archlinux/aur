# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>

pkgname=auracle-git
_pkgname="${pkgname%-git}"
pkgver=r366.8739929
pkgrel=3
pkgdesc='A flexible client for the AUR'
arch=('x86_64' 'i686')
url="https://github.com/falconindy/auracle.git"
license=('MIT')
depends=('pacman' 'libcurl.so' 'libsystemd')
makedepends=('meson' 'git' 'perl' 'systemd')
checkdepends=('python' 'fakechroot' 'gtest')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/falconindy/auracle.git"
        "abseil-fix.patch::https://github.com/inglor/auracle/commit/587880dce84f47b9a01e3d53ccaeee11ba580d64.patch"
        "static-fmt.patch::https://github.com/inglor/auracle/commit/18ab2549a8a656a670bdc17233abd5a7708c50ee.patch")
b2sums=('SKIP'
        '060a16cb5e3f8c244cfb12203ae0b356596fe255e0a56aee2fc6a140ac6ba7a28ed4da5e16fa43eb248ecedd577c29ab19b9455b657c3a039cbdd276c78aaec9'
        'f735c89485d8682b9dee25c1b96152d44005b8bf78f683015c65dd93cc3802177fbf8a4fa94587958157ec175260417da101a1436f7e1c4106bc2e4c21974a70')

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"

  patch -Np1 < "$srcdir/abseil-fix.patch"
  patch -Np1 < "$srcdir/static-fmt.patch"
}

build() {
  cd "$_pkgname"

  local meson_args=(
    --prefix=/usr
    --buildtype=plain
    --default-library=static
  )

  [[ -d build ]] && meson_args+=(--wipe)

  # Some tests fail with these enabled
  CFLAGS=${CFLAGS/,-D_GLIBCXX_ASSERTIONS/}
  CXXFLAGS="${CFLAGS}"
  meson build "${meson_args[@]}"

  meson compile -C build
}

check() {
  cd "$_pkgname"

  meson test -C build
}

package () {
  cd "$_pkgname"

  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: et ts=2 sw=2
