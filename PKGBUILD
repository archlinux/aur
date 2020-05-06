# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Simon Zimmermann <simon@insmo.com>

pkgname='pass-parcellite'
pkgver=1.7.3
pkgrel=3
pkgdesc='Stores, retrieves, generates, and synchronizes passwords securely (Parcellite and extended typing support)'
arch=('any')
url='https://www.passwordstore.org/'
license=('GPL2')
depends=('xclip' 'bash' 'gnupg' 'tree' 'parcellite-git')
checkdepends=('git')
optdepends=('git: for Git support'
            'dmenu: for passmenu'
            'qrencode: for QR code support'
            'xdotool: for typing support')
replaces=('passmenu')
provides=('passmenu' 'pass')
conflicts=('passmenu' 'pass')
source=("https://git.zx2c4.com/password-store/snapshot/password-store-${pkgver}.tar.xz"
	"pass-parcellite.patch"
	"passmenu-extended-typing.patch")
sha256sums=('2b6c65846ebace9a15a118503dcd31b6440949a30d3b5291dfb5b1615b99a3f4'
            '451a0e4b09cb56fa57382a6ee30f646fe7734658c709dbe6e2411cafe75af155'
            'b65c1f501096b7df74a69d67d7fc5460b53d34bf0bb89c8504b92ac92f5ec2d6')

prepare() {
  cd "${srcdir}/password-store-$pkgver/"
  # Parcellite history removal support
  # https://github.com/rickyrockrat/parcellite/commit/fa54161d0ea83357d817d3d16b6ef3f503bafc09
  patch --forward --strip=1 --input="${srcdir}/pass-parcellite.patch"
  # Extend "passmenu" to allow username and password typing
  # https://lists.zx2c4.com/pipermail/password-store/2015-December/001834.html
  patch --forward --strip=1 --input="${srcdir}/passmenu-extended-typing.patch"
}

check() {
  cd "${srcdir}/password-store-$pkgver/"
  make test
}

package() {
  cd "${srcdir}/password-store-$pkgver/"
  make DESTDIR="${pkgdir}" WITH_ALLCOMP=yes install

  cd contrib/dmenu
  install -Dm0755 passmenu "${pkgdir}/usr/bin/passmenu"
}
