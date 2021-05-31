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
        "abseil-fix.patch::https://github.com/inglor/auracle/commit/9075aabcd3eac5a058d97b871e786e9fb65bfbce.patch")
sha256sums=('SKIP'
            'ca65cb7f95c3427a5abc5e95eb69b34da6ccfc8200b0c800c42971b901e88bd4')

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
