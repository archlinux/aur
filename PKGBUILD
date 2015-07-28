# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: max.bra <max dot bra at alice dot it>
# Contributor: Shanto <shanto at hotmail>

_pkgname=cardapio
pkgname=${_pkgname}-bzr
pkgver=886
pkgrel=1
pkgdesc="An alternative Gnome menu, launcher, and much more!"
arch=('i686' 'x86_64')
url="https://launchpad.net/cardapio"
license=('GPL3')
conflicts=('cardapio')
provides=('cardapio')
depends=('python2-xdg' 'xdg-user-dirs' 'python2-dbus' 'python2-gnomedesktop' 'python2-keybinder2' 'python2-simplejson' 'gnome-control-center' 'tk')
makedepends=('bzr')
optdepends=('tracker: search capability')
source=(arch_and_python_stuff.patch)

_bzrmod=cardapio
_bzrtrunk=https://launchpad.net/cardapio/trunk

build() {
  cd "${srcdir}"
  msg "Connecting to Bazaar server...."

  if [ -d $_bzrmod ] ; then
    cd ${_bzrmod} && bzr --no-plugins pull ${_bzrtrunk} -r ${pkgver}
    msg "The local files are updated."
  else
    bzr --no-plugins branch ${_bzrtrunk} ${_bzrmod} -q -r ${pkgver}
  fi

  msg "Bazaar checkout done or server timeout"

  msg "Removing old build directory..."
  rm -rf $srcdir/$_bzrmod-build
  msg "Creating build directory..."
  cp -r $srcdir/$_bzrmod $srcdir/$_bzrmod-build
  
  msg "Arch and Python2 adjustments..."
  cd "${srcdir}/$_bzrmod-build"
  patch -uNp2 -r- -i ../arch_and_python_stuff.patch || return 1
  make
}

package() {
  msg "Building cardapio...."
  cd "${srcdir}/${_pkgname}-build/"
  make DESTDIR="'${pkgdir}'" install || return 1
  ln -s "/usr/lib/cardapio/cardapio" "$pkgdir/usr/bin/"
  ln -s "/usr/lib/cardapio/cardapio-gnome-panel-applet" "$pkgdir/usr/bin/"
  ln -s "/usr/lib/cardapio/cardapio-gnome3-panel-applet" "$pkgdir/usr/bin/"
  ln -s "/usr/lib/cardapio/cardapio-mate-panel-applet" "$pkgdir/usr/bin/"

  #msg "Building cardapio-docky...."
  #cd "${srcdir}/${_pkgname}-build/src/docky"
  #make DESTDIR="'${pkgdir}'" install || return 1

  #msg "Building cardapio-awn...."
  #cd "${srcdir}/${_pkgname}-build/src/awn"
  #make DESTDIR="'${pkgdir}'" install || return 1

  msg "Cleaning package...."
  rm "${pkgdir}"/usr/share/locale/cardapio.pot || return 1
}

sha256sums=('3fdaae9f4248c10d665492fb85f018d22d1a7120c65a1491efe58a2437bb98d0')
