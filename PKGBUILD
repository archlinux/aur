# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

_pkgname="psl1ght"
pkgname="ps3-${_pkgname}"
pkgver="20230307"
pkgrel=1
pkgdesc="PSL1GHT lightweight PS3 GameOS SDK"
arch=(x86_64 aarch64 powerpc64le powerpc64 powerpc riscv64)
url='https://github.com/ps3dev'
license=(MIT)
depends=(
	ps3-ppu-binutils
	ps3-ppu-gcc
	ps3-spu-binutils
	ps3-spu-gcc
	ps3-psl1ght-rules
)
options=(!emptydirs !strip staticlibs)
source=(
	"git+https://github.com/disc-kuraudo/PSL1GHT.git#commit=45cadf3bd523c9f26c5b0d8b536e59160ab0a54c"
)
sha256sums=(
	'SKIP'
)

# PS3DEV
export PS3DEV="/opt/ps3dev"
export PSL1GHT="${PS3DEV}"
export PATH="${PATH}:${PS3DEV}/bin"
export PATH="${PATH}:${PS3DEV}/ppu/bin"
export PATH="${PATH}:${PS3DEV}/spu/bin"

prepare() {
	cd "${srcdir}/PSL1GHT"

	# Weird different internal compiler errors with Os/O2/O3, only O1 works
	sed -e "s/-O2/-O1/g" -i ppu/librsx/Makefile
}

build() {
	cd "${srcdir}/PSL1GHT"

	make
}

package() {
	mkdir -p "${pkgdir}${PS3DEV}/ppu"
	cd "${pkgdir}${PS3DEV}/ppu"

	mkdir powerpc64-ps3-elf
	ln -s powerpc64-ps3-elf ppu

	cd "${srcdir}/PSL1GHT"

	make DESTDIR="${pkgdir}" install

	unlink "${pkgdir}${PS3DEV}/ppu/ppu"
}
