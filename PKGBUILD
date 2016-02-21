# Maintainer: Gao xiang<hughgao01@gmail.com>

pkgname='gamess'
pkgver=2014R1
pkgrel=1
pkgdesc="A general ab initio quantum chemistry package. For single machine use only."
arch=('x86_64')
url="http://www.msg.ameslab.gov/GAMESS/GAMESS.html"
license=('custom')
depends=('gcc-fortran' 'tcsh' 'atlas-lapack-base')
install=${pkgname}.install

# You MUST download the package from http://www.msg.ameslab.gov/GAMESS/GAMESS.html and put it in the PKGBUILD folder!
source=('gamess-current.tar.gz::file://gamess-current.tar.gz' "rungms.patch")

[ "$CARCH" = "x86_64" ] && md5sums=('6403592eaa885cb3691505964d684516' 'b3cce1982df9672b2a1aace1aa0b4177')

prepare() {
	cd "$pkgname"

    _GMS_PATH=$(pwd)
    _GMS_BUILD_DIR=$(pwd)
    mkdir -p $_GMS_BUILD_DIR/{object,tools,ddi,tests}

    # generate install.info
    cat > $_GMS_BUILD_DIR/install.info <<EOF
# install path
setenv GMS_PATH            $_GMS_PATH
# build path
setenv GMS_BUILD_DIR       $_GMS_BUILD_DIR
# machine type
setenv GMS_TARGET          linux64
# FORTRAN compiler setup
setenv GMS_FORTRAN         gfortran
# gamess does not support gfortran 5.x, using 4.9 instead
setenv GMS_GFORTRAN_VERNO  4.9
# mathematical library setup
setenv GMS_MATHLIB         atlas
setenv GMS_MATHLIB_PATH    /usr/lib
# parallel message passing model setup
setenv GMS_DDI_COMM        sockets
# LIBCCHEM CPU/GPU code interface
setenv GMS_LIBCCHEM        false
EOF

    # test the compiler setup by creating actvte.x
    sed -e "s/^\*UNX/    /" tools/actvte.code > actvte.f
    gfortran -o $_GMS_BUILD_DIR/tools/actvte.x actvte.f
    rm actvte.f

    # patch
    patch -p1 -i $srcdir/rungms.patch 
}

build() {
	cd "$pkgname"/ddi
    ./compddi
    mv ddikick.x ..

	cd ..
    ./compall

    ./lked gamess 01
}

package() {
	cd "$pkgname"
    mkdir -p $pkgdir/opt/gamess $pkgdir/usr/bin
    cp -r * $pkgdir/opt/gamess/
    ln -s $pkgdir/opt/gamess/rungms $pkgdir/usr/bin/
}
