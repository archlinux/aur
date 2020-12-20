# Maintainer: Eric Toombs

pkgname='armpl'
pkgver='20.3'
pkgrel='1'
pkgdesc='ARM'\''s closed-source high-performance numerical programming library. Includes BLAS, CBLAS, and LAPACK implementations.'
url='https://developer.arm.com/tools-and-software/server-and-hpc/downloads/arm-performance-libraries'
depends=()
arch=('aarch64')
depends=('gcc-fortran')
provides=('blas' 'lapack' 'cblas')
license=('custom')
source=(
    "https://developer.arm.com/-/media/Files/downloads/hpc/arm-performance-libraries/20-3-0/Ubuntu16.04/arm-performance-libraries_20.3_Ubuntu-16.04_gcc-9.3.tar"
)
sha256sums=('8fc078d78443894bdde71a49f7b39d513cf1f5e02db723eb833370d0cb2d635a')

package() {
    cd "$srcdir/arm-performance-libraries_20.3_Ubuntu-16.04"
    ./arm-performance-libraries_20.3_Ubuntu-16.04.sh -a -f -s .
    bsdtar xvf 'armpl_20.3_gcc-9.3.deb'
    cd "$pkgdir"
    tar xvf "$srcdir/arm-performance-libraries_20.3_Ubuntu-16.04/data.tar.gz"

    install_lib_dir='/opt/arm/armpl_20.3_gcc-9.3/lib'

    # Provide compatibility to binaries expecting any of these generic BLAS
    # and LAPACK so names.
    mkdir -p 'usr/lib'
    cd "$pkgdir/usr/lib"
    ln -s "$install_lib_dir/libarmpl.so" 'liblapack.so.3'
    ln -s 'liblapack.so.3' 'liblapack.so'
    ln -s "$install_lib_dir/libarmpl.so" 'libblas.so.3'
    ln -s 'libblas.so.3' 'libblas.so'
    ln -s "$install_lib_dir/libarmpl.so" 'libcblas.so.3'
    ln -s 'libcblas.so.3' 'libcblas.so'

    # Provide compatibility to binaries specifically expecting armpl.
    mkdir -p "$pkgdir/etc/ld.so.conf.d"
    echo "$install_lib_dir" >"$pkgdir/etc/ld.so.conf.d/armpl.conf"
}
