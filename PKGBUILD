# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>

pkgname=auracle-git
_pkgname=auracle
pkgver=r366.8739929
pkgrel=1
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
        "abseil-fix.patch::https://github.com/inglor/auracle/commit/bcd5ceef60bce3e463cc8a2c93f6750d6dd49f4e.patch")
sha256sums=('SKIP'
            'bd0fbc1020a51bf24176221586935a59ee5dbc4b2b9e5d9c2d37f79626b7ad2b')

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "$_pkgname"

  patch -Np1 < "$srcdir/abseil-fix.patch"
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
