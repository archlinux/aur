# Maintainer: erikfrish
pkgname=network-manager-amneziawg
pkgver=0.9.12
pkgrel=1
pkgdesc="NetworkManager VPN plugin for AmneziaWG"
arch=('x86_64')
url="https://github.com/vovochka404/network-manager-amneziawg"
license=('GPL-2.0-or-later')
depends=('glib2' 'gtk4' 'libnm' 'libnma-gtk4' 'networkmanager')
makedepends=('cmake' 'gettext' 'git' 'intltool' 'pkgconf')
optdepends=(
  'amneziawg-tools: userspace awg-quick backend'
  'amneziawg-dkms: direct kernel netlink backend'
)
source=("$pkgname::git+https://github.com/vovochka404/network-manager-amneziawg.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  export CFLAGS="${CFLAGS} -ffile-prefix-map=${srcdir}=/usr/src/debug/${pkgname}"

  cmake -S "$srcdir/$pkgname" -B "$srcdir/build" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/NetworkManager \
    -DDIST_VERSION="$pkgver" \
    -DWITH_GTK3=OFF \
    -DWITH_GTK4=ON
  cmake --build "$srcdir/build" --parallel
}

check() {
  ctest --test-dir "$srcdir/build" --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
  install -Dm644 "$srcdir/$pkgname/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
