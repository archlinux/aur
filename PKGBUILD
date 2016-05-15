# Maintainer: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Original maintainer: Martin Weinelt <mweinelt@gmail.com>
# Contributor: Samuel Kogler <firstname.lastname at gmail.com>
# Contributor: Bjoern Bidar <theodorstormgrade@gmail.com>

_gui=true
pkgbase=simulationcraft
pkgname=simulationcraft
_pkgname=simc
_simver=623
_simrel=02
pkgver=${_simver}_${_simrel}
pkgrel=1
srcdirectory="${startdir}/src/${_pkgname}-release-${_simver}-${_simrel}"
pkgdesc="A tool to explore combat mechanics in the popular MMO RPG World of Warcraft (tm). Multi-player event-driven simulator written in C++ that models raid damage."
url="http://code.google.com/p/simulationcraft"
arch=('i686' 'x86_64')
license=('GPL3')
replaces=('simcraft' 'simcraft-data' 'simcraft-gui')
conflicts=('simcraft' 'simcraft-data' 'simcraft-gui' 'simulationcraft-git' 'simulationcraft-data-git' 'simulationcraft-gui-git')
install=$pkgname.install
source=("https://github.com/simulationcraft/simc/archive/release-${_simver}-${_simrel}.tar.gz"
        'SimulationCraft.desktop')

md5sums=('7f39c91bf412a59daccdd2aa1b3061fa'
         '9e52edb48f39888bc13a0b9bd5f8d758')

prepare() {
    cd "${srcdir}/${_pkgname}-release-${_simver}-${_simrel}"
    #dos2unix ${_pkgname}-${_simver}-${_simrel}-source/engine/sc_main.cpp
    # we don't want to build engine twice
    
    if [ ${_gui} = true ] ; then
        #cd ${_pkgname}-${_simver}-${_simrel}-source
        sed -e 's|SOURCES|OBJECTS|' -e 's|\.cpp|\.o|' -i source_files/QT_engine{,_main}.pri
        qmake  INSTALLPATH=/usr/share/simulationcraft \
          SHAREDIR=/usr/share/simulationcraft \
          PREFIX=/usr \
          CONFIG+='to_install' \
          simcqt.pro -o Makefile
    fi
}

build() {
    cd "${srcdirectory}/engine"
    make PREFIX=/usr  CFLAGS+="$CFLAGS"  CXXFLAGS+="$CXXFLAGS" LDFLAGS+="$LDFLAGS"
    
    if [ ${_gui} = true ] ; then
        cd ..
        make PREFIX=/usr CXXFLAGS+="$CXXFLAGS \$(DEFINES) -fPIC" LDFLAGS+="$LDFLAGS"
    fi
}

package_simulationcraft-data() {
    pkgdesc+=" Data"
    arch=("any")
    
    cd ${srcdirectory}
    
    for profile in $( find profiles -type f); do
        install -Dm644 ${profile}   "${pkgdir}/usr/share/simulationcraft/${profile}"
    done

    install -Dm644 "Welcome.html" "${pkgdir}/usr/share/doc/simulationcraft/Welcome.html"
    install -Dm644 "Welcome.png" "${pkgdir}/usr/share/doc/simulationcraft/Welcome.png"
}

package_simulationcraft() {
    depends=( 'openssl' "simulationcraft-data=$pkgver" )
    
    cd ${srcdirectory}
    
    install -Dm755 engine/simc     "${pkgdir}/usr/bin/simc"
}

if [ ${_gui} = true ] ; then
    package_simulationcraft-gui() {
        pkgdesc+=" GUI"
        depends=( 'qt5-base' 'qt5-webkit' "simulationcraft=$pkgver")
        
        cd ${srcdirectory}

        install -Dm644 qt/icon/SimulationCraft.xpm "${pkgdir}/usr/share/pixmaps/SimulationCraft.xpm"
        install -Dm644 "${srcdir}/SimulationCraft.desktop" "${pkgdir}/usr/share/applications/SimulationCraft.desktop"
        for _locale in locale/* ; do
            install -Dm644 ${_locale}  ${pkgdir}/usr/share/simulationcraft/${_locale}
        done
        install -Dm755 SimulationCraft ${pkgdir}/usr/bin/simulationcraft
        make install INSTALL_ROOT=${pkgdir}
        rm -rf ${pkgdir}/usr/share/simulationcraft
    }
fi

if [ ${_gui} = true ] ; then
    makedepends+=( 'qt5-base' 'qt5-webkit')
    true && pkgname=( simulationcraft simulationcraft-gui simulationcraft-data )
else
    true && pkgname=( simulationcraft  simulationcraft-data )
fi
