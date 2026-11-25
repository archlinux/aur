# Maintainer: nVjhNFGQWoBQEthk

_pkgname_base=pixivfe
pkgname=$_pkgname_base-git
pkgver=v3.1.0.r149.gf68854e
pkgrel=1
pkgdesc='An open source alternative frontend for Pixiv'
arch=('any')
url='https://gitlab.com/pixivfe/PixivFE'
license=('AGPL-3.0-only')
makedepends=('go' 'git')
provides=($_pkgname_base)
conflicts=($_pkgname_base $pkgname)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"
    export GOPATH="$srcdir"/gopath
    export CGO_ENABLED=0
    go mod download
}

build() {
    cd "$srcdir/$pkgname"
	go tool templ generate
    go build -v \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-extldflags=-static \
      -X gitlab.com/pixivfe/pixivfe/config.revision=$pkgver" \
      -o $_pkgname_base \
      .
}

package() {
	cd  "$pkgname"
	install -vDm755 "$srcdir/$pkgname/$_pkgname_base" "$pkgdir/usr/bin/$_pkgname_base"
}
