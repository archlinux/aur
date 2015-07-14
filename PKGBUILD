# Current maintainer: Samuel Kogler <firstname.lastname at gmail.com>
# Original maintainer: Martin Weinelt <mweinelt@gmail.com>
# Contributor: Bjoern Bidar <theodorstormgrade@gmail.com>
_gui=true
pkgbase=simcraft
pkgname=simcraft
_pkgname=simc
_simver=620
_simrel=02
pkgver=${_simver}_${_simrel}
pkgrel=1
pkgdesc="SimulationCraft is a tool to explore combat mechanics in the popular MMO RPG World of Warcraft (tm)"
url="http://code.google.com/p/simulationcraft"
arch=('i686' 'x86_64')
license=('GPL3')

install=$pkgname.install
source=("http://downloads.simulationcraft.org/$_pkgname-${_simver}-${_simrel}-source.zip"
        'SimulationCraft.desktop'
)
md5sums=('d1155ac12510ae0344d742ee86d8ba6d'
         '527f78bab42ec0a524388da12e3ce9e0')

prepare()
{
  cd $srcdir/${_pkgname}-${_simver}-${_simrel}-source
  #dos2unix ${_pkgname}-${_simver}-${_simrel}-source/engine/sc_main.cpp
  # we don't want to build engine twice
  if [ $_gui = true ] ; then
    #cd ${_pkgname}-${_simver}-${_simrel}-source
    sed -e 's|SOURCES|OBJECTS|' -e 's|\.cpp|\.o|' -i source_files/QT_engine{,_main}.pri
    qmake  INSTALLPATH=/usr/share/simcraft \
      SHAREDIR=/usr/share/simcraft \
      PREFIX=/usr \
      CONFIG+='to_install' \
      simcqt.pro -o Makefile
  fi

}

build()
{
  cd $srcdir/${_pkgname}-${_simver}-${_simrel}-source/engine
  make PREFIX=/usr  CFLAGS+="$CFLAGS"  CXXFLAGS+="$CXXFLAGS" LDFLAGS+="$LDFLAGS"
  if [ $_gui = true ] ; then
    cd ..
    make PREFIX=/usr CXXFLAGS+="$CXXFLAGS \$(DEFINES) -fPIC" LDFLAGS+="$LDFLAGS"
  fi
}

package_simcraft-data()
{
  pkdesc+="data"
  arch="any"
  cd $srcdir/$_pkgname-${_simver}-${_simrel}-source
  for profile in $( find profiles -type f); do
    install -Dm644 $profile   "$pkgdir/usr/share/simcraft/$profile"
  done

  for doc in Welcome.html Welcome.png readme.txt; do
    install -Dm644 $doc $pkgdir/usr/share/doc/simcraft/$doc
  done

}

package_simcraft()
{
  depends=( 'openssl' "simcraft-data=$pkgver" )
  cd $srcdir/$_pkgname-${_simver}-${_simrel}-source
  install -Dm755 engine/simc     "$pkgdir/usr/bin/simc"
}

if [ $_gui = true ] ; then
package_simcraft-gui()
{
  pkgdesc+="gui"
  depends=( 'qt5-base' 'qt5-webkit' "simcraft=$pkgver")
  cd $srcdir/$_pkgname-${_simver}-${_simrel}-source

    install -Dm644 qt/icon/SimulationCraft.xpm "$pkgdir/usr/share/pixmaps/SimulationCraft.xpm"
    install -Dm644 "$srcdir/SimulationCraft.desktop" "$pkgdir/usr/share/applications/SimulationCraft.desktop"
    for _locale in locale/* ; do
      install -Dm644 $_locale  $pkgdir/usr/share/simcraft/$_locale
    done
    install -Dm755 SimulationCraft $pkgdir/usr/bin/simcraft
    make install INSTALL_ROOT=$pkgdir
    rm -rf $pkgdir/usr/share/simcraft

}
fi

if [ $_gui = true ] ; then
  makedepends+=( 'qt5-base' 'qt5-webkit')
  true && pkgname=( simcraft simcraft-gui simcraft-data )
else
  true && pkgname=( simcraft  simcraft-data )
fi
