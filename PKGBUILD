# Maintainer: Alex Szczuczko <alex@szc.ca>
# Contributor: Marcelo Alaniz <malaniz@code4life.com.ar>
# Contributor: Peter Wu <peter@lekensteyn.nl>

pkgname=nusmv
_pkgname=NuSMV
pkgver=2.6.0
pkgrel=4
pkgdesc="A new symbolic model checker"
arch=('i686' 'x86_64')
url="http://nusmv.fbk.eu/index.html"
license=('LGPL2.1')
depends=('libxml2')
makedepends=('cmake' 'python2' 'ghostscript' 'texlive-latexextra' 'doxygen' 'flex' 'bison')
optdepends=('perl: for scripts in /usr/share/nusmv/contrib/')
source=("http://nusmv.fbk.eu/distrib/${_pkgname}-${pkgver}.tar.gz"
        "cmake.patch"
        "cudd-waitstatus.patch")
sha256sums=('dba953ed6e69965a68cd4992f9cdac6c449a3d15bf60d200f704d3a02e4bbcbb'
            '7bc96f6a87b2c8a8b931d4ce17a5d49a5decf468b612165d4385753906fc1103'
            '0abb360d7856809461f75d4e4ba7ba34bc62b40efed256acbca67b0757d66e77')


prepare() {
    cd "$srcdir/$_pkgname-$pkgver"

    # Have to expose HAVE_UNISTD_H and others to avoid implicit func warnings.
    patch -Np1 -i "${srcdir}/cmake.patch"

    # "union wait" (BSD compat?) was removed in cudd 2.5.0
    patch -Np1 -i "${srcdir}/cudd-waitstatus.patch"

    # Fix "error: expected unqualified-id before user-defined string literal"
    sed 's/extern "C"void/extern "C" void/' MiniSat/MiniSat_v*.patch -i

    # Fix format-security "error: format not a string literal"
    sed s'/fprintf(file, SIGREF_HEADER)/fprintf(file, "%s", SIGREF_HEADER)/' NuSMV/code/nusmv/addons_core/compass/sigref/sigrefWrite.c -i
    sed s'/sprintf(preps_tmp, preps_fmt)/sprintf(preps_tmp, "%s", preps_fmt)/' NuSMV/code/nusmv/core/cinit/cinitData.c -i
    sed s'/fprintf(self->fout, x)/fprintf(self->fout, "%s", x)/' NuSMV/code/nusmv/core/hrc/dumpers/*.h -i
}

build() {
    cd "$srcdir/$_pkgname-$pkgver/$_pkgname"

    mkdir -p build
    cd build
    cmake .. -DPYTHON_EXECUTABLE=/bin/python2 -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
    make

    # For some reason the cmake makefiles don't call this, leading to an error
    # at install time.
    pushd doc/prog-man
    doxygen doxygen_nusmv_html.conf
    popd
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/$_pkgname/build"

    make DESTDIR="$pkgdir/" install
    find "$pkgdir" -type f -name "*.a" -print0 | xargs -0 rm

    # Lowercase symlink
    ln -s "/usr/bin/NuSMV" "$pkgdir/usr/bin/$pkgname"
}
