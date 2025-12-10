# Maintainer: Harvey Tindall <hrfee@protonmail.ch>
pkgname=jfa-go-git
_pkgname=jfa-go
pkgver=r2200.1c75530
pkgrel=1
pkgdesc="A web app for managing users on Jellyfin"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/hrfee/jfa-go"
license=('MIT')
makedepends=('go>=1.24' 'nodejs' 'npm' 'git' 'esbuild' 'swag')
checkdepends=()
optdepends=()
provides=("jfa-go")
conflicts=("jfa-go")
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/hrfee/jfa-go.git")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

pkgver() {
    cd $pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${pkgname}
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
    chown -R root "$pkgdir"/opt/$_pkgname/
    chmod 755 "$pkgdir"/opt/$_pkgname/$_pkgname
    ln -sf /opt/$_pkgname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
    install -Dm644 static/fonts/OFL.txt -t "$pkgdir"/usr/share/licenses/$_pkgname
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname
}
