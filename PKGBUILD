# Maintainer: Josh Hoffer <hoffer.joshua@gmail.com>
# Past-Maintainer: CUI Hao <cuihao.leo@gmail.com>

pkgname=seismic-unix
pkgver=44.14
pkgrel=3
pkgdesc='A seismic processing and research environment developed \
at the Center for Wave Phenomena, Colorado School of Mines'
arch=('i686' 'x86_64')
license=('custom')
url="http://www.cwp.mines.edu/cwpcodes/"
depends=('libtirpc' 'libxi' 'libglvnd' 'libxmu')
#depends=('freeglut' 'glu' 'libxmu' 'lesstif' 'libtirpc' 'libtirpc-compat')
#depends=('freeglut' 'glu' 'libxmu' 'openmotif')
#depends=('freeglut' 'glu' 'libxmu')
optdepends=(
    'tcsh: some scripts'
    'gcc-fortran: Fortran support')
makedepends=('git' 'gcc-fortran' 'libtirpc' 'libtirpc-compat' 'lesstif' 'glu' 'libxmu' 'freeglut')
#source=("ftp://ftp.cwp.mines.edu/pub/cwpcodes/cwp_su_all_$pkgver.tgz")
#sha1sums=('2456bfa4145ba5e8c03d9ffe85173b6657972bb3')
source=("git+https://github.com/JohnWStockwellJr/SeisUnix.git")
md5sums=("SKIP")
install=seismic-unix.install

prepare() {
    cd ${srcdir}/SeisUnix/src
    # start fresh
    rm -rf ../bin/
    rm -rf ../lib/
    # removing all *.o files (fixes issues)
    find . -type f -iname '*.o' -exec rm {} \;
    sed -i 's_/usr/X11[^/]*/_/usr/_' Makefile.config
    sed -i 's/BSD_SOURCE/DEFAULT_SOURCE/' Makefile.config
    sed -i 's/-O/-O2/' Makefile.config
    sed -i '/^OPTC/ s/$/-ltirpc -no-pie/' Makefile.config
    sed -i '/^POSTLFLAGS/ s/$/ -no-pie/' Makefile.config
    sed -i '/^FOPTS/ s/$/-std=legacy -no-pie/' Makefile.config
    sed -i 's_read RESP_RESP=y_' chkroot.sh
    echo -ne '#!/bin/sh\ntrue\n' | tee license.sh mailhome.sh
}

build() {
    export CWPROOT="$srcdir/SeisUnix/build"
    #export CWPROOT="$srcdir/SeisUnix"

    mkdir -p "$CWPROOT"
    cd "$CWPROOT"
    ln -sf "$srcdir/SeisUnix/src" src
    #ln -sf "$srcdir/seismic-unix/src" src

    cd "$srcdir/SeisUnix/src"
    make -j1 install
    make -j1 xtinstall
    make -j1 xminstall
    make -j1 finstall
    make -j1 mglinstall
    make -j1 utils
}

package() {
    export CWPROOT="$srcdir/SeisUnix/build"
    cd "$CWPROOT"
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r {,"$pkgdir/opt/$pkgname/"}bin/
    cp -r {,"$pkgdir/opt/$pkgname/"}include/
    cp -r {,"$pkgdir/opt/$pkgname/"}lib/
    cp -r {,"$pkgdir/opt/$pkgname/"}src/
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
