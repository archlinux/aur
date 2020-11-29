# Maintainer: Aleksander Mietinen <aleksander at mietinen dot net>

pkgname=seclists
pkgver=2020.4
pkgrel=1
pkgdesc="A collection of multiple types of lists used during security assessments, collected in one place."
arch=('any')
url="https://github.com/danielmiessler/SecLists"
license=('MIT')
makedepends=('findutils' 'coreutils' 'tar')

source=($pkgname-$pkgver.tar.gz::"https://github.com/danielmiessler/SecLists/archive/${pkgver}.tar.gz")
sha256sums=('eeec19a2596e0d0ed6f8d81e2feec828641ba6e66fc614e3e60bb5b30219fd86')

prepare() {
    cd "$srcdir/SecLists-$pkgver"
    find . -iname "rockyou*.tar.gz" -exec sh -c 'tar zxf {} -C $(dirname {}); rm {}' \;
}

package() {
    cd "$srcdir/SecLists-$pkgver"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    find . \( ! -iname "*.md" -a ! -iname ".git*" -a ! -name "LICENSE"  \) -type f -print0 | \
	    xargs -I{} -0 install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/{}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
