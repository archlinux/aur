# Maintainer: CUI Hao <cuihao.leo@gmail.com>

pkgname=seismic-unix
pkgver=44R4
pkgrel=1
pkgdesc="A seismic processing and research environment developed at the Center for Wave Phenomena, Colorado School of Mines"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.cwp.mines.edu/cwpcodes/"
depends=('freeglut' 'glu' 'libxmu' 'lesstif')
optdepends=(
    'tcsh: some scripts'
    'gcc-fortran: Fortran support')
makedepends=('gcc-fortran')
source=("ftp://ftp.cwp.mines.edu/pub/cwpcodes/cwp_su_all_$pkgver.tgz")
sha1sums=('2456bfa4145ba5e8c03d9ffe85173b6657972bb3')
install=seismic-unix.install

prepare() {
    cd ${srcdir}/src
    sed -i 's_/usr/X11[^/]*/_/usr/_' Makefile.config
    sed -i 's_read RESP_RESP=y_' chkroot.sh
    echo -ne '#!/bin/sh\ntrue\n' | tee license.sh mailhome.sh
}

build() {
    export CWPROOT="$srcdir/build"

    mkdir -p "$CWPROOT"
    cd "$CWPROOT"
    ln -sf "$srcdir/src" src

    cd "$srcdir/src"
    make -j1 install
    make -j1 xtinstall
    make -j1 xminstall
    make -j1 finstall
    make -j1 mglinstall
    make -j1 utils
}

package() {
    local CWPROOT="$srcdir/build"
    cd "$CWPROOT"

    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r {,"$pkgdir/opt/$pkgname/"}bin/
    cp -r {,"$pkgdir/opt/$pkgname/"}include/
    cp -r {,"$pkgdir/opt/$pkgname/"}lib/
    cp -r {,"$pkgdir/opt/$pkgname/"}src/
    chmod -R a+r "$pkgdir/opt/$pkgname"
    
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname" 
    install -m644 "$srcdir/src/LEGAL_STATEMENT" "$pkgdir/usr/share/licenses/$pkgname" 
    install -m644 "$srcdir/src/ACKNOWLEDGEMENTS" "$pkgdir/usr/share/licenses/$pkgname" 

    install -dm755 "$pkgdir/etc/profile.d" 
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
