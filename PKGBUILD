# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Simon Zimmermann <simon@insmo.com>

pkgname=pass-parcellite
pkgver=1.7.4
pkgrel=2
pkgdesc='Stores, retrieves, generates, and synchronizes passwords securely (Parcellite support)'
arch=('any')
url="https://www.passwordstore.org/"
license=('GPL2')
depends=('bash' 
		 'gnupg' 
		 'tree')
checkdepends=('git')
optdepends=('dmenu: for passmenu'
		    'git: for Git support'
			'parcellite-git: for Parcellite support [AUR]'
			'qrencode: for QR code support'
			'vim-plugin-runtime: for redact_pass.vim'
			'xclip: for clipboard support on X11'
			'xdotool: for typing support'
			'wl-clipboard: for clipboard support on Wayland')
replaces=('passmenu')
provides=('passmenu'
		  'pass')
conflicts=('passmenu' 
		   'pass')
source=("https://git.zx2c4.com/password-store/snapshot/password-store-${pkgver}.tar.xz"
		'pass-parcellite.patch')
sha256sums=('cfa9faf659f2ed6b38e7a7c3fb43e177d00edbacc6265e6e32215ff40e3793c0'
            '111ec13bdcbc691bdfca7134dfba3e01672d0900cdc9810bec5a5da487cb5d6f')

prepare() {
  cd "${srcdir}/password-store-$pkgver/"
  # Parcellite history removal support
  # https://github.com/rickyrockrat/parcellite/commit/fa54161d0ea83357d817d3d16b6ef3f503bafc09
  patch --forward --strip=1 --input="${srcdir}/pass-parcellite.patch"
}

check() {
  cd "${srcdir}/password-store-$pkgver/"
  make test
}

package() {
  cd "${srcdir}/password-store-$pkgver/"
  make DESTDIR="${pkgdir}" WITH_ALLCOMP=yes install

  install -Dm0755 -t "${pkgdir}/usr/bin" contrib/dmenu/passmenu
  install -Dm0644 -t "${pkgdir}/usr/share/vim/vimfiles/plugin" \
    contrib/vim/redact_pass.vim
}
