# Current maintainer: Samuel Kogler <firstname.lastname at gmail.com>
# Original maintainer: Martin Weinelt <mweinelt@gmail.com>
# Contributor: Bjoern Bidar <theodorstormgrade@gmail.com>
_gui=true
pkgbase=simulationcraft-git
pkgname=simulationcraft-git
pkgver=620.02.r1.g76dbaa9
pkgrel=3
pkgdesc="A tool to explore combat mechanics in the popular MMO RPG World of Warcraft (tm). Multi-player event-driven simulator written in C++ that models raid damage."
url="http://code.google.com/p/simulationcraft"
arch=('i686' 'x86_64')
license=('GPL3')
conflicts=('simcraft' 'simcraft-data' 'simcraft-gui' 'simulationcraft' 'simulationcraft-data' 'simulationcraft-gui')
makedepends=('git')
install=simulationcraft.install
source=('simulationcraft::git+https://code.google.com/p/simulationcraft/'
        'SimulationCraft.desktop')
md5sums=('SKIP'
         '59f2d428f6c7ad8a3eee1ca615a5982a')

pkgver() {
  cd "$srcdir/simulationcraft"
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
  cd "$srcdir/simulationcraft"
  # we don't want to build engine twice
  if [ $_gui = true ] ; then
    sed -e 's|SOURCES|OBJECTS|' -e 's|\.cpp|\.o|' -i source_files/QT_engine{,_main}.pri
    qmake  INSTALLPATH=/usr/share/simulationcraft \
      SHAREDIR=/usr/share/simulationcraft \
      PREFIX=/usr \
      CONFIG+='to_install' \
      simcqt.pro -o Makefile
  fi
}

build()
{
  cd "$srcdir/simulationcraft/engine"
  make PREFIX=/usr  CFLAGS+="$CFLAGS"  CXXFLAGS+="$CXXFLAGS" LDFLAGS+="$LDFLAGS"
  if [ $_gui = true ] ; then
    cd ..
    make PREFIX=/usr CXXFLAGS+="$CXXFLAGS \$(DEFINES) -fPIC" LDFLAGS+="$LDFLAGS"
  fi
}

package_simulationcraft-data-git()
{
  pkdesc+="data"
  arch="any"
  cd "$srcdir/simulationcraft"
  for profile in $( find profiles -type f); do
    install -Dm644 $profile   "$pkgdir/usr/share/simulationcraft/$profile"
  done

  for doc in Welcome.html Welcome.png readme.txt; do
    install -Dm644 $doc $pkgdir/usr/share/doc/simulationcraft/$doc
  done
}

package_simulationcraft-git()
{
  depends=( 'openssl' "simulationcraft-data-git=$pkgver" )
  cd "$srcdir/simulationcraft"
  install -Dm755 engine/simc     "$pkgdir/usr/bin/simc"
}

if [ $_gui = true ] ; then
package_simulationcraft-gui-git()
{
  pkgdesc+="gui"
  depends=( 'qt5-base' 'qt5-webkit' "simulationcraft-git=$pkgver")
  cd "$srcdir/simulationcraft"

  install -Dm644 qt/icon/SimulationCraft.xpm "$pkgdir/usr/share/pixmaps/SimulationCraft.xpm"
  install -Dm644 "$srcdir/SimulationCraft.desktop" "$pkgdir/usr/share/applications/SimulationCraft.desktop"
  for _locale in locale/* ; do
    install -Dm644 $_locale  $pkgdir/usr/share/simulationcraft/$_locale
  done
  install -Dm755 SimulationCraft $pkgdir/usr/bin/simulationcraft
  make install INSTALL_ROOT=$pkgdir
  rm -rf $pkgdir/usr/share/simulationcraft
}
fi

if [ $_gui = true ] ; then
  makedepends+=( 'qt5-base' 'qt5-webkit')
  true && pkgname=( simulationcraft-git simulationcraft-gui-git simulationcraft-data-git )
else
  true && pkgname=( simulationcraft-git  simulationcraft-data-git )
fi
