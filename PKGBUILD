# Maintainer: yingchangliu 
# Past-Maintainer: Yingchang Liu

pkgname=seismic-unix-git
pkgver=r301.fa256ad1
pkgrel=1
pkgdesc='A seismic processing and research environment developed
at the Center for Wave Phenomena, Colorado School of Mines'
arch=('i686' 'x86_64')
license=('custom')
url="https://wiki.seismic-unix.org/start"
depends=('libtirpc' 'libxaw' 'openmotif' 'python' 'lib32-glibc')
optdepends=(
    'tcsh: some scripts'
    'gcc-fortran: Fortran support')
makedepends=('git' 'gcc-fortran' 'libtirpc' 'openmotif' 'glu' 'libxaw' 'freeglut' 'python' 'lib32-glibc' )
_pkgname=${pkgname%-git}
source=("$_pkgname::git+https://github.com/JohnWStockwellJr/SeisUnix.git")
# source=("seismic_unix.tgz::https://nextcloud.seismic-unix.org/s/LZpzc8jMzbWG9BZ/download?path=%2F&files=cwp_su_all_44R28.tgz")
md5sums=("SKIP")
#install=seismic-unix.install
provides=('seismic-unix')
conflicts=('seismic-unix')

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD --)" "$(git rev-parse --short HEAD --)"
}

prepare() {
    cd ${srcdir}/$_pkgname/src/
    # start fresh
    rm -rf ../bin/
    rm -rf ../lib/
    # removing all *.o files (fixes issues)
    find . -type f -iname '*.o' -exec rm {} \;
    find ./Fortran -type f -iname '*.a' -exec rm {} \;

    # fix mglinstall script
    echo "MGLCFLAGS += -fcommon" >> configs/Makefile.config_Linux_ARCH

    cp configs/Makefile.config_Linux_ARCH Makefile.config

    sed -i 's_read RESP_RESP=y_' chkroot.sh
    echo -ne '#!/bin/sh\ntrue\n' | tee license.sh mailhome.sh
}

build() {
    export CWPROOT="$srcdir/$_pkgname"


    #cd "$srcdir/src/$_pkgname/src"
    cd ${CWPROOT}/src/
    make -j1 install
    make -j1 xtinstall
    make -j1 xminstall
    make -j1 finstall
    # mgl can not be compiled if -fcommon is not added to MGLCFLAGS
    make -j1 mglinstall
    make -j1 utils
}

package() {
    #export CWPROOT="$srcdir/src/$_pkgname/build"
    export CWPROOT="$srcdir/$_pkgname"
    cd "$CWPROOT"
    install -dm755 "$pkgdir/opt/$_pkgname"
    cp -r {,"$pkgdir/opt/$_pkgname/"}bin/
    cp -r {,"$pkgdir/opt/$_pkgname/"}include/
    cp -r {,"$pkgdir/opt/$_pkgname/"}lib/
    cp -r {,"$pkgdir/opt/$_pkgname/"}src/
    cp -r {,"$pkgdir/opt/$_pkgname/"}etc/
    cp -r {,"$pkgdir/opt/$_pkgname/"}info/
    # chmod -R a+r "$pkgdir/opt/$_pkgname"
    
    install -dm755 "$pkgdir/usr/share/licenses/$_pkgname" 
    install -m644 "$srcdir/$_pkgname/src/LEGAL_STATEMENT" "$pkgdir/usr/share/licenses/$_pkgname" 
    install -m644 "$srcdir/$_pkgname/src/ACKNOWLEDGEMENTS" "$pkgdir/usr/share/licenses/$_pkgname" 
    install -dm755 "$pkgdir/etc/profile.d/"
    cat > "$pkgdir/etc/profile.d/$_pkgname.sh" << EOF
#!/bin/bash
export CWPROOT="/opt/$_pkgname"
export PATH="\$PATH:\$CWPROOT/bin"
EOF
    cat > "$pkgdir/etc/profile.d/$_pkgname.csh" << EOF
setenv CWPROOT /opt/$_pkgname
setenv PATH \${PATH}:\${CWPROOT}/bin
EOF
    chmod 644 "$pkgdir/etc/profile.d/$_pkgname"{.sh,.csh}
}
