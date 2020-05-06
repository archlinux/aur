# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Simon Zimmermann <simon@insmo.com>

pkgname='pass-parcellite'
pkgver=1.7.3
pkgrel=4
pkgdesc='Stores, retrieves, generates, and synchronizes passwords securely (Parcellite and extended passmenu support)'
arch=('any')
url='https://www.passwordstore.org/'
license=('GPL2')
depends=('xclip' 'bash' 'gnupg' 'tree')
checkdepends=('git')
optdepends=('parcellite-git: for Parcellite support'
            'git: for Git support'
            'dmenu: for passmenu'
            'qrencode: for QR code support'
            'xdotool: for typing support'
            'pass-otp: for OTP support')
replaces=('passmenu')
provides=('passmenu' 'pass')
conflicts=('passmenu' 'pass')
source=("https://git.zx2c4.com/password-store/snapshot/password-store-${pkgver}.tar.xz"
	"pass-parcellite.patch"
	"passmenu-extended.patch")
sha256sums=('2b6c65846ebace9a15a118503dcd31b6440949a30d3b5291dfb5b1615b99a3f4'
            '451a0e4b09cb56fa57382a6ee30f646fe7734658c709dbe6e2411cafe75af155'
            'f714cf5edebc5971eaa8d81111d5ebf20e738af18e7a9047434c1290ed548114')

prepare() {
  cd "${srcdir}/password-store-$pkgver/"
  # Parcellite history removal support
  # https://github.com/rickyrockrat/parcellite/commit/fa54161d0ea83357d817d3d16b6ef3f503bafc09
  patch --forward --strip=1 --input="${srcdir}/pass-parcellite.patch"
  # Extend "passmenu" (typing and OTP)
  # https://lists.zx2c4.com/pipermail/password-store/2015-December/001834.html
  # https://github.com/tadfisher/pass-otp
  patch --forward --strip=1 --input="${srcdir}/passmenu-extended.patch"
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
