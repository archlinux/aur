# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Jannick Hemelhof <mister dot jannick at gmail dot com>

pkgname=node-prune
pkgver=1.2.0
pkgrel=2
pkgdesc='Remove unnecessary files from node_modules'
arch=(x86_64)
url="https://github.com/tj/$pkgname"
license=(MIT)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('9f1ad75fc637b4a77b7082ed090b99e5da860afffc096e4d2b90961b4a7caec3')

prepare() {
    cd "$_archive"
    # Patch because some AUR projects dependent on this actually _use_ image assets (notably Electron stuff)
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
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" {History,Readme}.md
}
