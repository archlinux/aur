# Maintainer: rilian-la-te <ria.freelander@gmail.com>

_pkgname=unity-gtk-module
pkgname=${_pkgname}-standalone-bzr
pkgver=r335
_distrover=15.04
pkgrel=7
pkgdesc="Unity GTK+ Module (Hacked for work with normal gtk2)"
arch=(i686 x86_64)
url="https://launchpad.net/unity-gtk-module"
license=(GPL)
groups=(unity)
install=unity-gtk-module.install
depends=(gtk2 gtk3)
makedepends=(gtk-doc bzr)
provides=(appmenu-gtk2 appmenu-gtk3 unity-gtk-module)
replaces=(appmenu-gtk2 appmenu-gtk3 unity-gtk-module)
conflicts=(appmenu-gtk2 appmenu-gtk3 unity-gtk-module)
source=("bzr+http://bazaar.launchpad.net/~indicator-applet-developers/unity-gtk-module/trunk.${_distrover}"
        80unity-gtk-module
        unity-gtk-module-gsettings.patch)
sha512sums=('SKIP'
            'e30db7e3e1aba0abf100e619c667bac16d0a25ee3d9c67f65af532ab1a512dce5966e3c94f5d938c378dc30d9ed766fc2c9fa62e96235f29d923be5bad7f3a45'
            'b23cd28f6082ee06be1b374ea5078968a098055af7d6a97f3f357c618c64706ac73eac533f2f7d0447d5e4f2baac82755f23f9dfc4ec46b59499ab407cc87807')
pkgver() {
  cd "trunk.${_distrover}"
  printf "r%s" "$(bzr revno)"
}

build() {
  cd "trunk.${_distrover}"

  patch -p0 -i "${srcdir}/unity-gtk-module-gsettings.patch"
  
  autoreconf -vfi

  [ -d build-gtk2 ] || mkdir build-gtk2
  pushd build-gtk2
  ../configure --prefix=/usr --sysconfdir=/etc --with-gtk=2 --enable-gtk-doc \
               --disable-static
  make
  popd

  [ -d build-gtk3 ] || mkdir build-gtk3
  pushd build-gtk3
  ../configure --prefix=/usr --sysconfdir=/etc --with-gtk=3 --enable-gtk-doc \
               --disable-static
  make
  popd
}

package() {
  cd "trunk.${_distrover}"

  pushd build-gtk2
  make DESTDIR="${pkgdir}/" install
  popd

  pushd build-gtk3
  make DESTDIR="${pkgdir}/" install
  popd

  install -dm755 "${pkgdir}/etc/X11/xinit/xinitrc.d/"
  install -m755  "${srcdir}/80unity-gtk-module" \
                 "${pkgdir}/etc/X11/xinit/xinitrc.d/"
  rm -rvf "${pkgdir}/usr/share/upstart/"
}
