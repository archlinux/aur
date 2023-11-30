# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Simon Zimmermann <simon@insmo.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=pass-parcellite
pkgver=1.7.4
pkgrel=5
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
            'gcr: for pinentry-gnome3 support'
            'git: for Git support'
            'gtk2: for pinentry-gtk-2 support'
            'kwayland5: for pinentry-qt support'
            'parcellite: compatible clipboard'
            'pinentry: for passphrase entry dialogs'
            'qrencode: for QR code support'
            'qt5-x11extras: for pinentry-qt support'
            'vim-plugin-runtime: for redact_pass.vim'
            'wl-clipboard: for clipboard support on Wayland'
            'xclip: for clipboard support on X11'
            'xdotool: for typing support')
replaces=('passmenu')
provides=('passmenu'
          'pass')
conflicts=('passmenu'
           'pass')
source=("git+https://git.zx2c4.com/password-store?signed#tag=${pkgver}"
        'pass-parcellite.patch')
sha512sums=('SKIP'
            '3aa8b727899c3830564f8f45aa6b2d171145cc422a5210b1f4887661fb49720c242aabcf4a4eaf8987118b36d0a1d82387b990f2d882bef9c8ca1c69d299ad53')
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
