# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=(aursec-git aursec-tui-git)
pkgver=v0.11.r0.15ea0e9
pkgrel=1
pkgdesc='Verify AUR package sources against hashes stored in a blockchain.'
arch=(any)
url="https://github.com/clawoflight/${pkgbase%-git}"
license=('custom:MPL2')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

depends=(firejail geth vim bc)
makedepends=(pandoc git)
checkdepends=(shellcheck)

source=("git+https://github.com/clawoflight/${pkgname%-git}.git")
sha256sums=('SKIP')
validpgpkeys=('871F10477DB3DDED5FC447B226C7E577EF967808')

pkgver() {
    cd "${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "${pkgname%-git}/aursec"
    make
    cd "../tui"
    make
}

check() {
    cd "${pkgname%-git}/aursec"
    make -k check
}

package_aursec-git() {
    install=aursec-git.install
    optdepends=("aursec-tui: to manually inspect the blockchain.")

    cd "${pkgname%-git}/aursec"
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
}

package_aursec-tui-git() {
    pkgdesc='Inspect the aursec blockchain'
    depends=(python python-requests python-urwid aursec)
    provides=(aursec-tui)
    conflicts=(aursec-tui)

    echo $PWD
    cd "aursec/tui"
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
