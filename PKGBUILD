# Maintainer: yingchangliu 
# Past-Maintainer: Yingchang Liu

pkgname=seisunix-git
pkgver=4426.c222c39
pkgrel=2
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
source=("git+https://github.com/JohnWStockwellJr/SeisUnix.git")
# source=("seismic_unix.tgz::https://nextcloud.seismic-unix.org/s/LZpzc8jMzbWG9BZ/download?path=%2F&files=cwp_su_all_44R28.tgz")
md5sums=("SKIP")
#install=seismic-unix.install

pkgver() {
    cd ${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${srcdir}/SeisUnix/src/
    # start fresh
    rm -rf ../bin/
    rm -rf ../lib/
    # removing all *.o files (fixes issues)
    find . -type f -iname '*.o' -exec rm {} \;
    find ./Fortran -type f -iname '*.a' -exec rm {} \;
    cp configs/Makefile.config_Linux_ARCH Makefile.config
    
    sed -i 's_read RESP_RESP=y_' chkroot.sh
    echo -ne '#!/bin/sh\ntrue\n' | tee license.sh mailhome.sh
}

build() {
    export CWPROOT="$srcdir/SeisUnix"


    #cd "$srcdir/src/SeisUnix/src"
    cd ${CWPROOT}/src/
    make -j1 install
    make -j1 xtinstall
    make -j1 xminstall
    make -j1 finstall
    # mgl can not be compiled now.
    # make -j1 mglinstall
    make -j1 utils
}

package() {
    #export CWPROOT="$srcdir/src/SeisUnix/build"
    export CWPROOT="$srcdir/SeisUnix"
    cd "$CWPROOT"
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r {,"$pkgdir/opt/$pkgname/"}bin/
    cp -r {,"$pkgdir/opt/$pkgname/"}include/
    cp -r {,"$pkgdir/opt/$pkgname/"}lib/
    cp -r {,"$pkgdir/opt/$pkgname/"}src/
    cp -r {,"$pkgdir/opt/$pkgname/"}etc/
    cp -r {,"$pkgdir/opt/$pkgname/"}info/
    chmod -R a+r "$pkgdir/opt/$pkgname"
    
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname" 
    install -m644 "$srcdir/SeisUnix/src/LEGAL_STATEMENT" "$pkgdir/usr/share/licenses/$pkgname" 
    install -m644 "$srcdir/SeisUnix/src/ACKNOWLEDGEMENTS" "$pkgdir/usr/share/licenses/$pkgname" 
    install -dm755 "$pkgdir/etc/profile.d/"
    cat > "$pkgdir/etc/profile.d/$pkgname.sh" << EOF
#!/bin/bash
export CWPROOT="/opt/$pkgname"
export PATH="\$PATH:\$CWPROOT/bin"
EOF
    cat > "$pkgdir/etc/profile.d/$pkgname.csh" << EOF
setenv CWPROOT /opt/$pkgname
setenv PATH \${PATH}:\${CWPROOT}/bin
EOF
    chmod 755 "$pkgdir/etc/profile.d/$pkgname"{.sh,.csh}
}
