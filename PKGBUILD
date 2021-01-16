# Maintainer: Harvey Tindall <hrfee@protonmail.ch>
pkgname="jfa-go"
pkgver=0.2.7
pkgrel=2
pkgdesc="A web app for managing users on Jellyfin"
arch=("x86_64")
url="https://github.com/hrfee/jfa-go"
license=('MIT')
makedepends=('go>=1.14' 'python>=3.6.0-1' 'nodejs' 'npm')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("jfa-go::git+https://github.com/hrfee/jfa-go.git#tag=v$pkgver")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

prepare() {
    cd jfa-go
    make configuration npm email version
    export GOPATH="$(go env GOPATH)"
    go get github.com/swaggo/swag/cmd/swag
    "${GOPATH}"/bin/swag init -g main.go
}

build() {
	cd jfa-go
	make typescript compile
}

package() {
    cd jfa-go
    make copy
    install -d "$pkgdir"/opt
    make install DESTDIR="$pkgdir"/opt
    mkdir -p "$pkgdir"/usr/bin
    chown -R root "$pkgdir"/opt/$pkgname/
    chmod 755 "$pkgdir"/opt/$pkgname/$pkgname
    ln -sf /opt/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname 
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
