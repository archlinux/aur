# Maintainer: Benjamin Chretien <chretien@lirmm.fr>
# Contributor: Daniel Fiser <danfis@danfis.cz>

pkgname=coin-or-ipopt-svn
pkgver=3.12.0.r2534
pkgrel=1
pkgdesc="Ipopt (Interior Point OPTimizer) is a software package for large-scale  nonlinear optimization."
arch=(i686 x86_64)
url="https://projects.coin-or.org/Ipopt"
license=('GPL')
depends=(blas lapack metis4)
optdepends=('libcoinhsl: user-provided COIN-HSL libraries')
makedepends=(svn gcc-fortran)
conflicts=(coin-or-ipopt)
provides=(coin-or-ipopt)

source=("Ipopt-svn::svn+https://projects.coin-or.org/svn/Ipopt/trunk")
md5sums=('SKIP')

# Boolean flags
_use_mumps=1
_use_asl=1
_has_hsl=1

pkgver() {
    cd "$srcdir/Ipopt-svn"
    local date_regex="[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\} releases\/"
    local last_rel="$(sed -ne "1,/${date_regex}/s/${date_regex}\([0-9.]\+\)/\1/p" ChangeLog)"
    local ver="$(svnversion)"
    msg "Last release: ${last_rel}"
    printf "%s.r%s" "$last_rel" "${ver//[[:alpha:]]}"
}

# For detailed information on Ipopt installation procedure:
# http://www.coin-or.org/Ipopt/documentation/node211.html#ExpertInstall
build() {
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$srcdir/Ipopt-svn/Ipopt
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$pkgdir/usr/lib/pkgconfig

    cd $srcdir/Ipopt-svn/ThirdParty

    # If we already installed libcoinhsl
    if [ ${_has_hsl} -eq 0 ] ; then
        export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$srcdir/Ipopt-svn/ThirdParty/HSL/
    else
        export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig/
    fi

    # If we want to use MUMPS
    if [ ${_use_mumps} -eq 1 ] ; then
        export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$srcdir/Ipopt-svn/ThirdParty/Mumps/
        msg "Getting MUMPS..."
        cd Mumps
        ./get.Mumps
        cd ..
    fi

    # If we want to use ASL
    if [ ${_use_asl} -eq 1 ] ; then
        export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$srcdir/Ipopt-svn/ThirdParty/ASL/
        msg "Getting ASL..."
        cd ASL
        ./get.ASL
        cd ..
    fi

    cd ..

    mkdir -p build && cd build

    # Configure the install
    msg "Configuring..."

    # Quick and dirty fix for linker errors
    export LDFLAGS="$LDFLAGS,-ldl,-lpthread"

    if [ ${_has_hsl} -eq 1 ] ; then
        # Ipopt requires some external fortran files to compile correctly
        ../configure --prefix=/usr \
                     --with-metis-lib="-lmetis-4" \
                     --with-metis-incdir="/usr/include/metis-4" \
                     --with-hsl-incdir=/usr/share/coin/libcoinhsl \
                     --with-hsl-lib="$(pkg-config coinhsl --libs)"
    else
        ../configure --prefix=/usr \
                     --with-metis-lib="-lmetis-4" \
                     --with-metis-incdir="/usr/include/metis-4"
    fi

    # Build
    msg "Building Ipopt..."
    make
}

check() {
    msg "Running tests..."
    cd $srcdir/Ipopt-svn/build;
    make test
}

package() {
    msg "Installing Ipopt..."
    cd $srcdir/Ipopt-svn/build

    make DESTDIR=$pkgdir install

    mkdir -p $pkgdir/etc/ld.so.conf.d/
    cd $pkgdir/etc/ld.so.conf.d/
    echo "/usr/lib/coin" >ipopt.conf
    echo "/usr/lib/coin/ThirdParty" >>ipopt.conf
}
