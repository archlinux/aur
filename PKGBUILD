pkgname=('tini-git')
srcname='tini'
pkgdesc='A tiny but valid `init` for containers'
pkgver='r1'
pkgrel='1'
arch=('i686' 'x86_64')
url="https://github.com/krallin/${srcname}"
license=('MIT')

depends=('glibc')
makedepends=('git' 'cmake' 'gcc')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=("${srcname}::git+https://github.com/krallin/${srcname}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${srcname}"

    printf 'r%s.%s\n' \
        "$( git rev-list HEAD | wc --lines )" \
        "$( git describe --always | sed 's/-/./g' )"
}

build() {
    cd "${srcdir}/${srcname}"

    cmake -DCMAKE_INSTALL_PREFIX='/usr' .
    make
}

package() {
    cd "${srcdir}/${srcname}"

    make DESTDIR="${pkgdir}" install
    rm "${pkgdir}/usr/bin/tini-static"
}
