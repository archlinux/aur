# Maintainer: Wayback Archiver <wabarc@tuta.io>

pkgname=wayback
pkgver=0.13.0
pkgrel=1
pkgdesc="A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
arch=('x86_64')
url="https://github.com/wabarc/wayback"
license=('GPL3')
makedepends=('git' 'go')
source=('git+https://github.com/wabarc/wayback.git')
sha256sums=('SKIP')

prepare() {
	rm -rf "${pkgdir}/*"
}

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --tags `git rev-list --tags --max-count=1` | sed -e 's/v//g'
}

build() {
    cd "${srcdir}/${pkgname}"
    make linux-amd64
    cp -f "build/binary/${pkgname}-linux-amd64" "build/binary/${pkgname}"
}

check() {
    cd "${srcdir}/${pkgname}"
    sha256sum "build/binary/${pkgname}"
    bash -c "build/binary/${pkgname}"
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm 755 "build/binary/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/wayback"
    install -Dm 644 build/systemd/wayback.service -t "${pkgdir}/usr/lib/systemd/system/"
}
