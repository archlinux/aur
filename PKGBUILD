# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=clickrouter-git
pkgver=2.0.1.r952.g260e4f0a6
pkgrel=1
pkgdesc='Fast modular packet processing and analysis'
depends=('glibc' 'libpcap')
optdepends=()
makedepends=('git')
arch=('x86_64')
url='https://github.com/kohler/click'
license=('custom')
provides=('clickrouter')
conflicts=('clickrouter' 'click' 'click-git')
replaces=('clickrouter')
source=("$pkgname"::'git+https://github.com/kohler/click'
        'fix-linux_true.patch')
sha256sums=('SKIP'
            '0293dd4c4233684574c175ba831dbe7a039b5bf059a06b2bec86b76a4e3cc083')

pkgver() {
    cd "$srcdir/$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

prepare() {
    cd "$srcdir/$pkgname"
    FILES=$(grep -r 'gzcat' ./* | grep -v '^Binary' | cut -d ':' -f 1 | uniq)
    sed -i -e 's/\<gzcat\>/zcat/g' ${FILES}

    # https://github.com/kohler/click/issues/493
    # https://github.com/kohler/click/pull/504
    patch -Np1 -i "$srcdir/fix-linux_true.patch"
}

build() {
    cd "$srcdir/$pkgname"
    ./configure --prefix=/usr --sbindir=/usr/bin --enable-all-elements
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="${pkgdir}" install
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/clickrouter/LICENSE"
}

# vim: set sw=4 ts=4 et:
