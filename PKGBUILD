# Maintainer: Teteros <teteros -at- openmailbox -dot- org>

_pkgname=sporth
pkgname=sporth-git
pkgver=r882.7ef5ce7
pkgrel=1
pkgdesc="A small stack-based audio language."
arch=('i686' 'x86_64')
url="http://paulbatchelor.github.io/proj/sporth.html"
license=('MIT')
depends=('jack')
makedepends=('git' 'soundpipe-git')
provides=('sporth')
conflicts=('sporth')
source=("git://github.com/PaulBatchelor/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"

    # Replace hardcoded /usr/local prefixes
    find . -type f -exec sed -i "s|/usr/local|${pkgdir}/usr|g" {} \;

    # Enable JACK support
    # Comment this out and remove jack from depends if you do not need it
    sed -i '/.*BUILD_JACK=1/s/^[@#] //' config.def.mk
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"

    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/include" "$pkgdir/usr/lib" "$pkgdir/usr/share/doc"
    make install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -rp examples "$pkgdir/usr/share/doc/$pkgname"
}
