# Maintainer: Harvey Tindall <hrfee@protonmail.ch>
pkgname="jfa-go"
pkgver=0.6.0
pkgrel=2
pkgdesc="A web app for managing users on Jellyfin"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/hrfee/jfa-go"
license=('MIT')
makedepends=('go>=1.24' 'nodejs' 'npm' 'esbuild' 'swag')
depends=('libayatana-appindicator' 'libolm')
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
    npm i
    export GOPATH="$(go env GOPATH)"
    make precompile GOESBUILD=on INTERNAL=off E2EE=on TRAY=on
}

build() {
	cd ${pkgname}
    export GOPATH="$(go env GOPATH)"
    make INTERNAL=off E2EE=on TRAY=on BUILTBY="makepkg (aur)"
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
