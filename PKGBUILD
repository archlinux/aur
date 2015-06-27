# Maintainer: Daniel Landau <daniel.landau@iki.fi>

pkgname=thunderbird-conversations-git
pkgver=r1307.45ebc59
pkgrel=1
pkgdesc="GMail-like conversation view for Thunderbird"
arch=('any')
url="https://github.com/protz/GMail-Conversation-View"
license=('MPL' 'GPL2' 'LGPL2.1')
depends=('thunderbird-nightly=29.0a1')
_thunderbird_extensions_dir="/opt/thunderbird-nightly-29.0a1/extensions"
makedepends=('git' 'nodejs' 'zip')
source=("$pkgname"::'git://github.com/protz/GMail-Conversation-View.git')
md5sums=('SKIP')
pkgver() {
        cd "$srcdir/$pkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
        cd "$srcdir/$pkgname"
        git submodule init
        git submodule update
}

build() {
        cd "$srcdir/$pkgname"
        pushd content/pdfjs
        node make generic
        popd
        ./build.sh
}

package() {
        cd "$srcdir/$pkgname"
        emid="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)"

        install -d -m755 "${pkgdir}/${_thunderbird_extensions_dir}/${emid}"
        cd "${pkgdir}/${_thunderbird_extensions_dir}/${emid}"

        unzip "$srcdir/$pkgname/conversations.xpi"
}
