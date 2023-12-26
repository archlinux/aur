# Maintainer: Harvey Tindall <hrfee@protonmail.ch>
pkgname="jfa-go"
pkgver=0.5.1
pkgrel=1
pkgdesc="A web app for managing users on Jellyfin"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/hrfee/jfa-go"
license=('MIT')
makedepends=('go>=1.18' 'python>=3.6.0-1' 'nodejs' 'npm' 'esbuild')
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
    make configuration npm email typescript GOESBUILD=on INTERNAL=off
    go install github.com/swaggo/swag/cmd/swag@latest
}

build() {
	cd ${pkgname}
    export GOPATH="$(go env GOPATH)"
	make variants-html bundle-css inline-css GOESBUILD=on INTERNAL=off
    "${GOPATH}"/bin/swag init -g main.go
    make copy INTERNAL=off
    make compile INTERNAL=off BUILTBY="makepkg (aur)"
}

package() {
    cd ${pkgname}
    install -d "$pkgdir"/opt
    make install DESTDIR="$pkgdir"/opt
    mkdir -p "$pkgdir"/usr/bin
    chown -R root "$pkgdir"/opt/$pkgname/
    chmod 755 "$pkgdir"/opt/$pkgname/$pkgname
    ln -sf /opt/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname 
    install -Dm644 static/fonts/OFL.txt -t "$pkgdir"/usr/share/licenses/$pkgname
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
