# Contributor: Dirk <spam@0x7be.de>
# Maintainer: Dirk <spam@0x7be.de>

_name='invo'
pkgrel=1

pkgdesc='A barebones tool to get screen width and height on the command line using GTK 3'
url='https://git.0x7be.net/dirk/invo'

arch=('any')
license=('MIT')
depends=('gtk3')
makedepends=('gcc' 'pkgconf')

source=("git+https://git.0x7be.net/dirk/${_name}")
sha256sums=('SKIP')

pkgname="${_name}-git"
pkgbase="${_name}"
pkgver=d1534b9

pkgver() {
    cd "${srcdir}/${_name}"
    echo "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_name}"
    gcc -std=c99 -Dversion_string=\""Git#${pkgver}"\" $(pkg-config --cflags gtk+-3.0) -o ${_name} ${_name}.c $(pkg-config --libs gtk+-3.0)
    sed -i s/'\$DATE\$'/"$(date +%Y-%m-%d)"/g man/invo.1
    sed -i s/'\$VERSION\$'/"Git#${pkgver}"/g man/invo.1
}

package() {
    cd "$srcdir/${_name}"
    install -Dm 755 "${_name}" "${pkgdir}/usr/bin/${_name}"
    install -Dm 644 "man/${_name}.1" "${pkgdir}/usr/share/man/man1/${_name}.1"
    install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
