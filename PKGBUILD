# Maintainer: Harvey Tindall <hrfee@protonmail.ch>
pkgname="jfa-go"
pkgver=0.3.1
pkgrel=1
pkgdesc="A web app for managing users on Jellyfin"
arch=("x86_64")
url="https://github.com/hrfee/jfa-go"
license=('MIT')
makedepends=('go>=1.16' 'python>=3.6.0-1' 'nodejs' 'npm')
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
    go get github.com/swaggo/swag/cmd/swag
    make configuration npm email version
}

build() {
	cd jfa-go
    make typescript bundle-css 
    export GOPATH="$(go env GOPATH)"
    "${GOPATH}"/bin/swag init -g main.go
    make copy internal-files compile
}

package() {
    cd jfa-go
    mkdir -p "$pkgdir"/usr/bin
    cp build/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
    chmod 755 "$pkgdir"/usr/bin/$pkgname
    chown root "$pkgdir"/usr/bin/$pkgname
    mkdir -p "$pkgdir"/usr/share/licenses
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
