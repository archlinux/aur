# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Mik Mueller <imse335@gmail.com>
pkgname=smarthome-cli
pkgver=2.7.0
pkgrel=1
epoch=
pkgdesc="Terminal client for the smarthome-go/smarthome server."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/smarthome-go/cli"
license=('GPL2')
groups=()
depends=()
makedepends=('go')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/smarthome-go/cli/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
b2sums=('SKIP')
validpgpkeys=()

prepare() {
    cd "$srcdir/cli-$pkgver"
   # go mod init "${url#https://}" # strip https:// from canonical URL
    go mod tidy
    mkdir -p build/
}

build() {
    cd "$srcdir/cli-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-w -s -linkmode external -extldflags \"-static -Wl,-z,now,-z,relro ${LDFLAGS}\"" \
        -v \
        -o build/smarthome-cli \
        .
}

package() {
    cd "$srcdir/cli-$pkgver"
    install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
