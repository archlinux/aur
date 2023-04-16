# Maintainer: zer0-x < Matrix: "@zer0-x:kde.org" >

pkgname="fish-tide-git"
_pkgname=${pkgname%-git}
pkgver=5
pkgrel=1
pkgdesc="Flexible and asynchronous Fish prompt"
arch=("any")
url="https://github.com/IlanCosman/tide"
license=("MIT")
depends=("fish")
makedepends=("git")
provides=(${_pkgname})
conflicts=(${_pkgname})
install="${pkgname}.install"
source=("${pkgname}::git+${url}#branch=main")
sha512sums=("SKIP")

prepare() {
    cd "${pkgname}"

    git reset --hard "$(git describe --tags --abbrev=0 --match 'v*')"
}

pkgver() {
    cd "${pkgname}"

    git describe --tags --abbrev=0 --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${pkgname}"

    find conf.d functions -type f -exec install -Dm 755 '{}' "${pkgdir}/etc/fish/{}" \;

    install -Dm644 completions/* -t "${pkgdir}/usr/share/fish/vendor_completions.d/"

    install -Dm755 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
