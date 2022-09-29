# Maintainer: solopasha <daron439 at gmail dot com>
pkgname=torrserver-git
pkgver=MatriX.118.2.r0.gb505e71
pkgrel=1
pkgdesc="Torrent stream server"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64' 'i686')
url="https://github.com/YouROK/TorrServer"
license=("GPL3")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=("glibc" "gcc-libs")
makedepends=("git" "go" "yarn")
options=(!lto)
source=("${pkgname}::git+${url}.git#branch=master"
        "torrserver.service")
install=torrserver.install  
sha512sums=('SKIP'
            '951b0f4361a668cdae8933fdcffee48ca6759b7257b2253d5d383282db4a9413c3b014f7c8dbf8c2877ac3fed52040fd0c7f181874a0432d927f43ea7ec3e61d')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
    cd "$pkgname"/web
    export YARN_CACHE_FOLDER="$srcdir"/yarn
    yarn install --no-fund
}

build() {
    export GOPATH="$srcdir"/gopath
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -tags=nosqlite"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1
    cd "$srcdir/$pkgname/web" 
    yarn run build --no-fund
    cd "$srcdir/$pkgname"
    go run gen_web.go
    cd "$srcdir/$pkgname/server"
    go build -o "${pkgname%-git}" ./cmd
}
package(){
    install -Dm755 "${pkgname}/server/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "torrserver.service" -t "${pkgdir}/usr/lib/systemd/user"
}
