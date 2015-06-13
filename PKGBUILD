## Maintainer: Thaodan <theodorstormgrade@gmail.com>
_qt4=true # which gui build
_qt5=true
pkgname='virt-manager-qt'
_pkgname='qt-virt-manager'
pkgbase='virt-manager-qt'
url='https://github.com/F1ash/qt-virt-manager'
makedepends=('cmake')
depends=('libvirt' 'scrub')
arch=('i686' 'x86_64')
license=('GPL2')
pkgrel=1
pkgver=0.10.21
source=("git+https://github.com/F1ash/qt-virt-manager.git#tag=$pkgver")
if [ $_qt4 ] ; then
    makedepends+=('qt4' 'qtermwidget-q4')
fi
if [ $_qt5 ] ; then
    makedepends+=('qt5-base' 'qt5-svg' 'qtermwidget')
fi

pkgdesc="Qt Virtual Machine Manager provides a graphical tool for administering virtual machines for QEMU/KVM, Xen, and LXC and other Virtual Entities.
Uses libvirt as the backend management API.
"

prepare()
{
  mkdir -p "$srcdir"/$_pkgname/cmake
}
build()
{
  export CXXFLAGS="$CXXFLAGS -std=c++11"
  cd "$srcdir"
  if [ $_qt4 = true ] ; then
      mkdir -p "$srcdir"/build-qt4
      cd "$srcdir"/build-qt4
      cmake -DBUILD_QT_VERSION=4 \
	    -DCMAKE_INSTALL_PREFIX=/usr \
	    -DCMAKE_BUILD_TYPE=Release \
	    ../$_pkgname

      make
  fi

  if [ $_qt5 = true ] ; then
      mkdir -p "$srcdir"/build-qt5
      cd "$srcdir"/build-qt5
      cmake -DBUILD_QT_VERSION=5 \
	    -DCMAKE_INSTALL_PREFIX=/usr \
	    -DCMAKE_BUILD_TYPE=Release \
	    ../$_pkgname

      make

  fi
}

if [ $_qt4 = true ] ; then
package_virt-manager-qt4()
{
  depends+=('qt4' 'qtermwidget-q4')
  pkgdesc+=" qt4"
  pkgname='virt-manager-qt4'
  conflicts=${pkgname}5
  cd "$srcdir"/build-qt4

  make install DESTDIR=$pkgdir
}
fi

if [ $_qt5 = true ] ; then
package_virt-manager-qt5()
{
  depends+=('qt5-base' 'qt5-svg' 'qtermwidget')
  pkgname='virt-manager-qt5'
  conflicts=${pkgname}4
  replaces=${pkgname}4
  pkgdesc+=" qt5"
  cd "$srcdir"/build-qt5

  make install DESTDIR=$pkgdir

}
fi

if [ $_qt4 = true ] ; then
   true && pkgname=( ${pkgbase}4 )
fi

if [ $_qt5 = true  ] ; then
    if [ $pkgname = $pkgbase ] ; then
	true && pkgname=( ${pkgbase}5 )
    else
      true && pkgname+=( ${pkgbase}5 )
    fi
fi



md5sums=('SKIP')
