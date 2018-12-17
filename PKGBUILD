# Maintainer: krypt.co <aur@>
pkgname=kr
pkgver=2.4.14
pkgrel=1
pkgdesc="SSH using a key stored in Krypton"
arch=('i686' 'x86_64')
url="https://github.com/kryptco/kr"
license=('custom')
groups=()
depends=('gcc-libs-multilib')
makedepends=('rustup' 'go' 'rsync' 'nodejs' 'git')
checkdepends=()
optdepends=()
provides=('kr')
conflicts=('kr')
backup=()
options=()
install=kr.install
changelog=()
source=("git+https://github.com/kryptco/kr#tag=$pkgver")
md5sums=('SKIP') 
validpgpkeys=()

pkgver() {
  echo "2.4.14"
}

prepare() {
    cd ${srcdir}/kr && git submodule update --init --recursive && cd -
    # ensure a toolchain is selected if rustup was used to install rust
    (which rustup 2>/dev/null && (rustup which cargo || rustup default stable)) || true
    rustup target add wasm32-unknown-emscripten
    # cargo web 0.6.10 required to build dashboard frontend
    cargo web --version || cargo install --debug cargo-web
    mkdir -p "${srcdir}/src/github.com/kryptco/"
    rm -rf "${srcdir}/src/github.com/kryptco/kr"
    mv "${srcdir}/kr" "${srcdir}/src/github.com/kryptco/kr"
}

build() {
	cd "${srcdir}/src/github.com/kryptco/kr"
	GOPATH=${srcdir} make
}

check() {
	cd "${srcdir}/src/github.com/kryptco/kr"
	GOPATH=${srcdir} make check
}

package() {
	cd "${srcdir}/src/github.com/kryptco/kr"
	export PREFIX=${pkgdir}/usr
	install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/kr/LICENSE"
	SUDO="" GOPATH=${srcdir} make install
}
