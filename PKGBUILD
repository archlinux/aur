# Maintainer: arachnid92 <manuel@niclabs.cl>
# Based on mareex's <marcus [dot] behrendt [dot] 86 [at] gmail [dot] com> PKGBUILD for SUMO.

pkgname=('sumo-git' 'sumo-doc-git')
pkgbase=sumo-git
pkgver=0.25.0_git
pkgrel=1
pkgdesc="SUMO is an open source, highly portable, microscopic and continuous road traffic simulation package designed to handle large road networks"
arch=('i686' 'x86_64')
url="http://${_basename}-sim.org"
license=('GPL')
depends=('gcc-libs' 'glibc' 'fox' 'xerces-c-2' 'glu' 'libgl')
makedepends=('make' 'gcc' 'help2man' 'libtool' 'autoconf' 'automake')

_gitname='sumo/sumo'
_basename=sumo

source=(git://github.com/planetsumo/sumo
        "${_basename}.desktop"
        "${_basename}.sh"
        "${_basename}.install")
sha256sums=( 'SKIP'
            '0500ba9cdf827cceae9a9bce66094bdb077300c94b0040bdd710afb92d0d4849'
            '16db32dbba617f8a38f5d103ce3af7cc70ab4cbf5b50e30be5d7f13ee6ea2f4f'
            'eeb0e9f85d72f06937462ceac90cc7f5bb55b56022472c476c137ee95b9fa56b')


             
prepare() {
    cd ${srcdir}/${_gitname}
    # replace python with python2 in shebangs
    find . -iname \*.py -exec sed -i 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/' {} \;
    find . -iname \*.py -exec sed -i 's/#!\/usr\/bin\/python/#!\/usr\/bin\/python2/' {} \;

    # test if there are still py-files without shebangs
    for f in $(find . -iname \*.py)
    do
        if [ -z "$(grep -l '^#!/.*python' "$f")" ]; then
			sed -i "1i #!/bin/env python2" $f
        fi
    done
	
	#autoconf
	autoreconf -i

    # remove odd build flags
    sed -i 's/-O2//g' configure
    sed -i 's/-D_FORTIFY_SOURCE=2//g' configure
    sed -i 's/-DNDEBUG//g' configure
    sed -i 's/-I\/usr\/local\/include//g' configure
}

build() {
    cd ${srcdir}/${_gitname}
    ./configure --prefix=/usr
    make
    make man
}

package_sumo-git() {
backup=("etc/profile.d/sumo.sh")
optdepends=('java-runtime-common: for executing Jar files like TraCI4J'
	    'python2: for executing various python scripts in $SUMO_HOME/tools'
            'perl: for executing various perl scripts in $SUMO_HOME/tools')
install=${_basename}.install
    
    mkdir -p ${pkgdir}/etc/profile.d/
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/lib/${_basename}/data
    mkdir -p ${pkgdir}/usr/lib/${_basename}/tools
    mkdir -p ${pkgdir}/usr/share/applications
    mkdir -p ${pkgdir}/usr/share/doc/${_basename}
    mkdir -p ${pkgdir}/usr/share/man/man1
    mkdir -p ${pkgdir}/usr/share/pixmaps
    
    install -m0755 ${srcdir}/${_basename}.sh ${pkgdir}/etc/profile.d/

    install -m0755 ${srcdir}/${_gitname}/bin/activitygen ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${_gitname}/bin/dfrouter ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${_gitname}/bin/duarouter ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${_gitname}/bin/emissionsDrivingCycle ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${_gitname}/bin/emissionsMap ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${_gitname}/bin/jtrrouter ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${_gitname}/bin/marouter ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${_gitname}/bin/netconvert ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${_gitname}/bin/netgenerate ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${_gitname}/bin/od2trips ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${_gitname}/bin/polyconvert ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${_gitname}/bin/${_basename} ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${_gitname}/bin/${_basename}-gui ${pkgdir}/usr/bin/
    install -m0755 ${srcdir}/${_gitname}/bin/TraCITestClient ${pkgdir}/usr/bin/


    SAVEIFS=$IFS
    IFS=$(echo -en "\n\b")

    #ln -s /usr/bin ${pkgdir}/usr/lib/${_basename}/bin
    ln -s /usr/share/doc/${_basename}/doxygen ${pkgdir}/usr/lib/${_basename}/doxygen
    ln -s /usr/share/doc/${_basename}/examples ${pkgdir}/usr/lib/${_basename}/examples
    ln -s /usr/share/doc/${_basename}/pydoc ${pkgdir}/usr/lib/${_basename}/pydoc
    ln -s /usr/share/doc/${_basename}/tutorial ${pkgdir}/usr/lib/${_basename}/tutorial
    ln -s /usr/share/doc/${_basename}/userdoc ${pkgdir}/usr/lib/${_basename}/userdoc
########### DATA
    cd ${srcdir}/${_gitname}/data
    for d in $(find . -type d)
    do
        mkdir -p ${pkgdir}/usr/lib/${_basename}/data/$d
    done
    for f in $(find . -type f)
    do
        install -m0644 $f ${pkgdir}/usr/lib/${_basename}/data/$f
    done
    for l in $(find . -type l)
    do
	ln -s $(readlink $l) ${pkgdir}/usr/lib/${_basename}/data/$l
    done
########### TOOLS
    cd ${srcdir}/${_gitname}/tools
    for d in $(find . -type d)
    do
        mkdir -p ${pkgdir}/usr/lib/${_basename}/tools/$d
    done
    for f in $(find . -type f)
    do
        install -m0644 $f ${pkgdir}/usr/lib/${_basename}/tools/$f
    done
    for l in $(find . -type l)
    do
	ln -s $(readlink $l) ${pkgdir}/usr/lib/${_basename}/tools/$l
    done

    # make all scripts executable
    find ${pkgdir}/usr/lib/${_basename}/tools/ -iname \*.sh -exec chmod +x {} \;
    find ${pkgdir}/usr/lib/${_basename}/tools/ -iname \*.py -exec chmod +x {} \;
    find ${pkgdir}/usr/lib/${_basename}/tools/ -iname \*.pl -exec chmod +x {} \;
########### PIXMAP
    install -m0644 ${srcdir}/${_gitname}/docs/logo/256x256.png ${pkgdir}/usr/share/pixmaps/${_basename}.png
########### .DESKTOP FILE
    install -m0644 ${srcdir}/${_basename}.desktop ${pkgdir}/usr/share/applications
########### MAN
    cd ${srcdir}/${_gitname}/docs/man
    for d in $(find . -type d)
    do
        mkdir -p ${pkgdir}/usr/share/man/man1/$d
    done
    for f in $(find . -type f)
    do
        install -m0644 $f ${pkgdir}/usr/share/man/man1/$f
    done
    for l in $(find . -type l)
    do
	ln -s $(readlink $l) ${pkgdir}/usr/share/man/man1/$l
    done
}

package_sumo-doc-git() {
########### DOCS
    cd ${srcdir}/${_gitname}/docs
    for d in $(find . -type d)
    do
        mkdir -p ${pkgdir}/usr/share/doc/${_basename}/$d
    done
    for f in $(find . -type f)
    do
        install -m0644 $f ${pkgdir}/usr/share/doc/${_basename}/$f
    done
    for l in $(find . -type l)
    do
	ln -s $(readlink $l) ${pkgdir}/usr/share/doc/${_basename}/$l
    done
    install -m0644 ${srcdir}/${_gitname}/AUTHORS ${pkgdir}/usr/share/doc/${_basename}
    install -m0644 ${srcdir}/${_gitname}/ChangeLog ${pkgdir}/usr/share/doc/${_basename}
    install -m0644 ${srcdir}/${_gitname}/COPYING ${pkgdir}/usr/share/doc/${_basename}
    install -m0644 ${srcdir}/${_gitname}/README ${pkgdir}/usr/share/doc/${_basename}

    rm -rf ${pkgdir}/usr/share/doc/${_basename}/man
}
