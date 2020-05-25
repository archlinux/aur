# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Jannick Hemelhof <mister dot jannick at gmail dot com>

pkgname=node-prune
pkgver=1.1.0
pkgrel=2
pkgdesc='Remove unnecessary files from node_modules'
arch=('x86_64')
url="https://github.com/tj/$pkgname"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('77739f945de5157efc3bafa7affb7b88dcc64bae42495158dabc2673c417192c')

prepare() {
    # Patch because some AUR projects that use this actually _use_ the images (electron stuff)
    cd "$pkgname-$pkgver"
    sed -i -e '/"images",/d' internal/prune/prune.go
}

build() {
    cd "$pkgname-$pkgver"
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-extldflags ${LDFLAGS}" \
        .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" {History,Readme}.md
}
