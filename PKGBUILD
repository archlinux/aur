# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Simon Zimmermann <simon@insmo.com>

pkgname='pass-parcellite'
pkgver=1.7.3
pkgrel=1
pkgdesc='Stores, retrieves, generates, and synchronizes passwords securely (Parcellite history removal support)'
arch=('any')
url='https://www.passwordstore.org/'
license=('GPL2')
depends=('xclip' 'bash' 'gnupg' 'tree' 'parcellite-git')
checkdepends=('git')
optdepends=('git: for Git support'
            'dmenu: for passmenu'
            'qrencode: for QR code support')
replaces=('passmenu')
provides=('passmenu' 'pass')
conflicts=('passmenu' 'pass')
source=("https://git.zx2c4.com/password-store/snapshot/password-store-${pkgver}.tar.xz"
	"pass-parcellite.patch")
sha256sums=('2b6c65846ebace9a15a118503dcd31b6440949a30d3b5291dfb5b1615b99a3f4'
            'f37dcc73d214fc9435e499f4b4c153fa93e923bd9dc7fe3d8fc1821119054fb1')

prepare() {
  cd "${srcdir}/password-store-$pkgver/"
  patch --forward --strip=1 --input="${srcdir}/pass-parcellite.patch" 
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
