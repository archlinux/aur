# Maintainer: Jianfeng Zhang <swordfeng123@gmail.com>

pkgname=mighttpd2-git
_pkgname=mighttpd2
pkgver=3.3.4.0.gefd30f7
pkgrel=1
pkgdesc="File/CGI web server on warp"
arch=('x86_64')
url="http://http://mew.org/~kazu/proj/mighttpd/en/"
license=('custom:BSD')
makedepends=('cabal-install' 'ghc')
provides=("${_pkgname}" "mighty")
conflicts=("${_pkgname}")
source=("git+https://github.com/kazu-yamamoto/mighttpd2.git")
sha1sums=('SKIP')
#options=('upx')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags --long | sed 's/^v//;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    cabal sandbox init
}

build() {
    cd "${srcdir}/${_pkgname}"
    cabal update
    cabal install
}

package() {
    cd "${srcdir}/${_pkgname}/.cabal-sandbox/"

    find bin/ -name mighty* -exec install -Dm755 "{}" "${pkgdir}/usr/{}" \;
    mkdir -p "${pkgdir}/etc/mighty"
    find share/ -name example.conf -exec install -Dm644 "{}" "${pkgdir}/etc/mighty/example.conf" \;
    find share/ -name example.route -exec install -Dm644 "{}" "${pkgdir}/etc/mighty/example.route" \;

    cd "${srcdir}/${_pkgname}"

    mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
