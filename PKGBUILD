# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

_pkgname="psl1ght"
pkgname="ps3-${_pkgname}"
pkgver="20230214"
pkgrel=2
pkgdesc="PSL1GHT lightweight PS3 GameOS SDK"
arch=(x86_64 aarch64 powerpc64le powerpc64 powerpc riscv64)
url='https://github.com/ps3dev'
license=(MIT)
depends=(
	ps3-ppu-binutils
	ps3-ppu-gcc
	ps3-spu-binutils
	ps3-spu-gcc
)
options=(!emptydirs !strip staticlibs)
source=(
	"git+https://github.com/ps3dev/PSL1GHT.git#commit=0f7ab5e4967ef0df877dd10f080b0ca771eac023"
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

	# Fake PSL1GHT variable to source to make it find *_rules files,
	# this skips a separate '-rules' package with 'make install-ctrl'
	# that would put them in /opt/ps3dev
	PSL1GHT="${PWD}" make
}

package() {
	mkdir -p "${pkgdir}${PS3DEV}/ppu"
	cd "${pkgdir}${PS3DEV}/ppu"

	mkdir powerpc64-ps3-elf
	ln -s powerpc64-ps3-elf ppu
	mkdir -p ppu/lib # ppu/crt/Makefile install rule doesn't create this

	cd "${srcdir}/PSL1GHT"

	# Special needs Makefile with no support for DESTDIR.
	# Need to play around with both PSL1GHT and PS3DEV variables,
	make PS3DEV="${pkgdir}${PS3DEV}" PSL1GHT="${pkgdir}${PSL1GHT}" install-ctrl install

	unlink "${pkgdir}${PS3DEV}/ppu/ppu"
}
