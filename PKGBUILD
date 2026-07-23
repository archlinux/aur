# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=voicefox
pkgver=0.7
pkgrel=1
pkgdesc="A TUI music player that supports both streaming and local tracks"
arch=("x86_64")
url="https://github.com/emoeem/voicefox"
license=("MIT")
options=(!lto)
depends=(
	"glibc"
	"libgcc"
	"openssl"
	"mpv"
	"nodejs"
)
makedepends=(
	"rust"
)
source=(
	"${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz"
	"LICENSE::https://raw.githubusercontent.com/emoeem/"${pkgname}"/refs/heads/main/LICENSE"
)
sha512sums=('8da4eae39d93214ab1cebd7d9a83e2f082e4752301f7eeabb526caebb3779cbe02821559be671028dd616b4f9c80cbd707d017dd44d87be10a38c2a025d68cbf'
            'e65d0d2522762bf43fa7c79e47c4b867dc7126e8402b8981ff6357b3d7e7968b34f9058d0426d24115a90bf4165bba86ce5414bd29f2df0355ebfa349e266814')

prepare() {
	cd "${pkgname}-${pkgver}"

	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "${pkgname}-${pkgver}"

	cargo build --release --frozen
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 -t "${pkgdir}/usr/bin" target/release/voicefox
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
