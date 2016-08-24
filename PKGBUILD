pkgname=('tini-git')
_srcname='tini'
pkgdesc='A tiny but valid `init` for containers'
pkgver='r1'
pkgrel='1'
arch=('i686' 'x86_64')
url="https://github.com/krallin/${_srcname}"
license=('MIT')

depends=('glibc')
makedepends=('git' 'cmake' 'gcc' 'vim')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=("${_srcname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

build() {
    cd "${srcdir}/${_srcname}"

    cmake -DCMAKE_INSTALL_PREFIX='/usr' .
    make
}

package() {
    cd "${srcdir}/${_srcname}"

    make DESTDIR="${pkgdir}" install
    rm "${pkgdir}/usr/bin/tini-static"
}
