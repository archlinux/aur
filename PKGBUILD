# Maintainer: Prurigro

_pkgname=gitsync
pkgname=${_pkgname}-git
pkgver=20131011.r35.296e001
pkgrel=2
pkgdesc="Git repository syncronisation daemon"
url="https://github.com/raybejjani/${_pkgname}"
license=('BSD')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
depends=('glibc')
makedepends=('git' 'go' 'make' 'python2')
source=("${_pkgname}.1"
        "git://github.com/raybejjani/${_pkgname}.git"
        "git://github.com/ngmoco/timber.git"
        "hg+https://code.google.com/p/go.net/")
sha512sums=('9e292631ed38bc81c48b67294236da9e41e7a4e5839290973c76c53128f1c080635c92518452fa5410891037d312508002ced0d92b7dad6921ad63b7e3790ae2'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd $_pkgname
    printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    sed -i 's|/usr/bin/env python|/usr/bin/env python2|g' ${_pkgname}/util/make_code_fs.py

    install -d ${_pkgname}/src/code.google.com/p/
    ln -s "${srcdir}/go.net" "${_pkgname}/src/code.google.com/p/go.net"

    install -d ${_pkgname}/src/github.com/ngmoco/
    ln -s "${srcdir}/timber" "${_pkgname}/src/github.com/ngmoco/timber"
}

build() {
    cd $_pkgname
    make
}

package() {
    install -Dm644 ${_pkgname}.1 "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
    install -Dm644 ${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 ${_pkgname}/bin/${_pkgname}d "${pkgdir}/usr/bin/${_pkgname}d"
}
