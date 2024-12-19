# Maintainer: Alex Szczuczko <alex@szc.ca>
# Contributor: Marcelo Alaniz <malaniz@code4life.com.ar>
# Contributor: Peter Wu <peter@lekensteyn.nl>

pkgname=nusmv
_pkgname=NuSMV
pkgver=2.7.0
pkgrel=1
pkgdesc="A new symbolic model checker"
arch=('i686' 'x86_64')
url="http://nusmv.fbk.eu/index.html"
license=('LGPL2.1')
depends=('libxml2' 'libedit')
makedepends=('python' 'flex' 'bison' 'meson')
optdepends=('perl: for scripts in /usr/share/nusmv/contrib/')
source=("http://nusmv.fbk.eu/distrib/${pkgver}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('bf5b14c4e2ca1f5e8404c8ce75825183d8f5842063cb1e58e073d92bb1234828')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver/"

    # Fix format-security "error: format not a string literal"
    sed s'/fprintf(file, SIGREF_HEADER)/fprintf(file, "%s", SIGREF_HEADER)/' code/nusmv/addons_core/compass/sigref/sigrefWrite.c -i
    sed s'/sprintf(preps_tmp, preps_fmt)/sprintf(preps_tmp, "%s", preps_fmt)/' code/nusmv/core/cinit/cinitData.c -i
    sed s'/fprintf(self->fout, x)/fprintf(self->fout, "%s", x)/' code/nusmv/core/hrc/dumpers/*.h -i
}

build() {
    cd "$srcdir/$_pkgname-$pkgver/"

    meson setup build
    meson compile -C build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/"

    meson install --destdir "$pkgdir" -C build
    find "$pkgdir" -type f -name "*.a" -print0 | xargs -0 rm
    for d in bin share include lib
    do
        mv "$pkgdir/usr/local/$d" "$pkgdir/usr/"
    done
    rmdir "$pkgdir/usr/local"

    # Lowercase symlink
    ln -s "/usr/bin/NuSMV" "$pkgdir/usr/bin/$pkgname"
}
