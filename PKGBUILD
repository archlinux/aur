# Maintainer:  Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Chiu-Hsiang Hsu <wdv4758h@gmail.com>

pkgname=musl-git
pkgver=1.2.0.r0.g040c1d16
pkgrel=1
pkgdesc='Lightweight implementation of C standard library'
arch=('i686' 'x86_64')
url='https://www.musl-libc.org/'
license=('MIT')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('staticlibs' '!buildflags')
source=("git://git.musl-libc.org/musl")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}"/musl

    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}"/musl

    ./configure --prefix=/usr/lib/musl \
        --exec-prefix=/usr \
        --enable-wrapper=all
    make
}

package() {
    cd "${srcdir}"/musl

    make DESTDIR="${pkgdir}" install

    # configure syslibdir with /lib for PT_INTERP compat, but install to /usr/lib
    mv "${pkgdir}"/lib/ld-musl*.so* "${pkgdir}"/usr/lib/
    rmdir "${pkgdir}"/lib

    install -Dm0644 README "${pkgdir}"/usr/share/doc/musl/README
    install -Dm0644 COPYRIGHT "${pkgdir}"/usr/share/licenses/musl/COPYRIGHT
}
