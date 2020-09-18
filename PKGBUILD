# Maintainer: Ysblokje <ysblokje at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gamemode
pkgver=1.6
pkgrel=1
pkgdesc="A daemon/lib combo that allows games to request a set of optimisations be temporarily applied to the host OS"
arch=('x86_64')
url="https://github.com/FeralInteractive/gamemode"
license=('BSD')
depends=('polkit')
makedepends=('meson')
checkdepends=('appstream')
optdepends=('systemd')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('ede17eb042c1c87f7b35bfe96a00560afaea086f685d25bb3964d794b0af9c80')

build() {
  meson "$pkgname-$pkgver" build \
    --prefix /usr \
    --libexecdir lib/gamemode \
    -Dwith-pam-group=gamemode \
    -Dwith-systemd-user-unit-dir=/usr/lib/systemd/user
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR=$pkgdir meson install -C build
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" \
    ${pkgname}-${pkgver}/LICENSE.txt
  install -m644 -Dt "${pkgdir}/usr/share/doc/${pkgname}/example" \
    ${pkgname}-${pkgver}/example/gamemode.ini
}

