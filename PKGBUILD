# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Jannick Hemelhof <mister dot jannick at gmail dot com>

pkgname=node-prune
pkgver=1.2.0
pkgrel=1
pkgdesc='Remove unnecessary files from node_modules'
arch=('x86_64')
url="https://github.com/tj/$pkgname"
license=(MIT)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9f1ad75fc637b4a77b7082ed090b99e5da860afffc096e4d2b90961b4a7caec3')

prepare() {
    # Patch because some AUR projects that use this actually _use_ the images (electron stuff)
    cd "$_archive"
    sed -i -e '/"images",/d' internal/prune/prune.go
}

build() {
    cd "$_archive"
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-extldflags \"$LDFLAGS\"" \
        .
}

package() {
    cd "$_archive"
    install -Dm755 -t "$pkgdir/usr/bin/" "$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" {History,Readme}.md
}
