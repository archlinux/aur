# Maintainer: Harvey Tindall <hrfee@protonmail.ch>
pkgname=jfa-go-git
_pkgname=jfa-go
pkgver=r1118.a8daa2c
pkgrel=1
pkgdesc="A web app for managing users on Jellyfin"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/hrfee/jfa-go"
license=('MIT')
makedepends=('go>=1.16' 'python>=3.6.0-1' 'nodejs' 'npm' 'git')
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
    make configuration npm email typescript GOESBUILD=off INTERNAL=OFF
    go get github.com/swaggo/swag/cmd/swag
}

build() {
	cd ${pkgname}
    export GOPATH="$(go env GOPATH)"
	make variants-html bundle-css inline-css GOESBUILD=off INTERNAL=off
    "${GOPATH}"/bin/swag init -g main.go
    make copy INTERNAL=off
    make compile INTERNAL=off
}

package() {
    cd ${pkgname}
    install -d "$pkgdir"/opt
    make install DESTDIR="$pkgdir"/opt
    mkdir -p "$pkgdir"/usr/bin
    chown -R root "$pkgdir"/opt/$_pkgname/
    chmod 755 "$pkgdir"/opt/$_pkgname/$_pkgname
    ln -sf /opt/$_pkgname/$_pkgname "$pkgdir"/usr/bin/$_pkgname 
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname
}
