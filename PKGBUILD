# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: max.bra <max dot bra at alice dot it>
# Contributor: Shanto <shanto at hotmail>

_pkgname=cardapio
pkgname=${_pkgname}-bzr
pkgver=996
pkgrel=1
pkgdesc="An alternative Gnome menu, launcher, and much more!"
arch=('i686' 'x86_64')
url="https://launchpad.net/cardapio"
license=('GPL3')
conflicts=('cardapio')
provides=('cardapio')
depends=('python2-xdg' 'xdg-user-dirs' 'python2-dbus' 'gnome-python-desktop' 'python2-keybinder2')
makedepends=('git')
optdepends=('tracker: search capability')
source=('cardapio::git+https://git.launchpad.net/cardapio'
        'xdg_fix.patch'
        'xfce_cinnamon_better_support.patch')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git rev-list --count HEAD
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  # All the python2 fixes
  sed -i 's:python\([ \t$]\):python2\1:g' Makefile
  find ./src -type f -exec sed -i 's:\(#!.*python\):&2:' '{}' \;
  # Doesn't like concatting NoneType + str
  patch -uNp2 -r- -i ../xdg_fix.patch
  # Add some cinnamon and xfce specifics
  patch -uNp2 -r- -i ../xfce_cinnamon_better_support.patch
  # We're not Ubuntu
  rm src/plugins/software_center.py
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}"/usr/share/locale/cardapio.pot
}

sha256sums=('SKIP'
            'da05e1f24399ae3dc401ab3a89e05eb1a610c7777bbb45c723444f0c782fa5d9'
            '8b3b22b9ee5e3d26b1f9c09f49b70f35f7a3ffb7e6579e87a7a78183482ec856')
