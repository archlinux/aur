# Maintainer: Emil Lundberg <lundberg.emil@gmail.com>
#
# core/community package:
# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Simon Zimmermann <simon@insmo.com>

pkgname='pass-patched-passmenu-notify-git'
pkgver=latest
pkgrel=2
pkgdesc='Stores, retrieves, generates, and synchronizes passwords securely'
arch=('any')
url='http://zx2c4.com/projects/password-store/'
license=('GPL2')
depends=('xclip' 'bash' 'gnupg' 'pwgen' 'tree')
optdepends=('git: for Git support'
            'dmenu: for passmenu'
            'libnotify: for passmenu desktop notifications')
replaces=('passmenu')
provides=('pass' 'passmenu')
conflicts=('passmenu')
source=(
  'passmenu-notify.patch'
  "https://git.zx2c4.com/password-store/snapshot/password-store-master.tar.xz"
)
md5sums=('c12e88d852175da95af85958ed83a59b'
         'SKIP')

pkgver() {
  "${srcdir}"/password-store-master/src/password-store.sh --version | grep -oE '[0-9]+\.[0-9]+\.[0-9]+'
}

prepare() {
  cd "${srcdir}"/password-store-master/
  patch -u -p1 < "${srcdir}"/passmenu-notify.patch
}

package() {
  cd "${srcdir}"/password-store-master/
  ls -la
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install

  install -Dm0755 contrib/dmenu/passmenu "${pkgdir}"/usr/bin/passmenu
}
