# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=aomp-amdgpu
pkgdesc='Clang/LLVM based compiler with added support for the OpenMP API on Radeon GPUs'
_pkgver=11.6-2
pkgver=11.6.2
pkgrel=1
arch=('x86_64')
url='https://github.com/ROCm-Developer-Tools/aomp'
license=('Apache')
depends=(z3 numactl pciutils libelf libffi)
makedepends=(git cmake python)
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/rel_$_pkgver.tar.gz"
        'disable_ocl_tests.patch'
        'adjust_rpath.patch')
sha256sums=('e4623ecfbe743676d068b17b113aadce4524a79be31b0540a216f9597cbd9fe5'
            'bf3aab8fc2c828554ba76ab1876179130704f1c35906228fcf7e94239f5e4170'
            '94c670cd991c95a7b6312feb77d32a11c1ac1b839218bcd251042563b7af1a44')
options=(staticlibs !strip)
_dirname="$(basename "$url")-$(basename ${source[0]} .tar.gz)"

prepare() {
    mv "$_dirname" aomp
    cd aomp/bin

    AOMP_REPOS="$srcdir" \
    ./clone_aomp.sh

    cd "$srcdir/opencl-on-vdi"
    patch -Np1 -i "$srcdir/disable_ocl_tests.patch"

    cd "$srcdir/aomp"
    patch -Np1 -i "$srcdir/adjust_rpath.patch"
}

package() {
    cd aomp/bin

    #FORTIFY_SOURCE breaks flang-runtime
    export CPPFLAGS="$(sed -e 's/-D_FORTIFY_SOURCE=2//' <<< "$CPPFLAGS")"
    AOMP="$pkgdir/opt/rocm/aomp" \
    AOMP_REPOS="$srcdir" \
    ./build_aomp.sh

    #Fix symlink created by the build script
    ln -fs "/opt/rocm/aomp_$_pkgver" "$pkgdir/opt/rocm/aomp"

    #Export AOMP variable for rocminfo
    install -Dm777 /dev/stdin "$pkgdir/etc/profile.d/aomp-amdgpu.sh" <<EOF
export AOMP=/opt/rocm/aomp
EOF
}
