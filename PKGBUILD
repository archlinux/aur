# Maintainer: Julia DeMille <me@jdemille.com>
pkgname=softethervpn-git
pkgver=5.02.5180.r310.g82ce34f
pkgrel=1
pkgdesc="Multi-protocol VPN Program from University of Tsukuba (Developer Edition / git version)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://www.softether.org/"
license=('Apache')
depends=('bash' 'openssl' 'zlib' 'ncurses' 'libsodium' 'readline' 'glibc')
makedepends=('git' 'cmake')
source=("softethervpn::git+https://github.com/SoftEtherVPN/SoftEtherVPN.git")
conflicts=('softethervpn' 'softethervpn-beta')
provides=('softethervpn')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/-/.r/;s/-/./'
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  git submodule update --init --recursive
}

build() {
  cmake -B build -S "${srcdir}/${pkgname%-git}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSTEMD_UNITDIR=/usr/lib/systemd/system \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/softethervpn \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
