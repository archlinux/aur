# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Simon Zimmermann <simon@insmo.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=pass-parcellite
pkgver=1.7.4
pkgrel=3
pkgdesc='Stores, retrieves, generates, and synchronizes passwords securely (Parcellite support)'
arch=('any')
url="https://www.passwordstore.org/"
license=('GPL2')
depends=('bash' 
		 'gnupg' 
		 'tree')
checkdepends=('git')
makedepends=('git')
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
source=("git+https://git.zx2c4.com/password-store?signed#tag=${pkgver}"
		'pass-parcellite.patch')
sha256sums=('SKIP'
            '111ec13bdcbc691bdfca7134dfba3e01672d0900cdc9810bec5a5da487cb5d6f')
validpgpkeys=('AB9942E6D4A4CFC3412620A749FC7012A5DE03AE') # Jason A. Donenfeld

prepare() {
  cd "${srcdir}/password-store"
  # Parcellite history removal support
  # https://github.com/rickyrockrat/parcellite/commit/fa54161d0ea83357d817d3d16b6ef3f503bafc09
  patch --forward --strip=1 --input="${srcdir}/pass-parcellite.patch"
}

check() {
  cd "${srcdir}/password-store"
  make test
}

package() {
  cd "${srcdir}/password-store"
  make DESTDIR="${pkgdir}" WITH_ALLCOMP=yes install

  install -vDm0755 -t "${pkgdir}/usr/bin" contrib/dmenu/passmenu
  install -vDm0644 -t "${pkgdir}/usr/share/vim/vimfiles/plugin" \
    contrib/vim/redact_pass.vim
}
