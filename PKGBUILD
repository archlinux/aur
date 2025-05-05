# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

_pkgname="psl1ght"
_commit="eca3f990a6691c896129439b95ca1f7bdd6abaf0"
pkgname="ps3-${_pkgname}"
pkgver="20241020"
pkgrel=2
pkgdesc="PSL1GHT lightweight PS3 GameOS SDK"
arch=(x86_64 aarch64 powerpc64le powerpc64 powerpc riscv64)
url='https://github.com/ps3dev'
license=(MIT)
depends=(
	"ps3-env"
	"ps3-ppu-binutils>=2.44"
	"ps3-ppu-gcc>=15.1.0"
	"ps3-spu-binutils>=2.22"
	"ps3-spu-gcc>=9.5.0"
)
options=(!emptydirs !strip staticlibs)
source=(
	"git+https://github.com/ps3dev/PSL1GHT.git#commit=${_commit}"
)
sha256sums=(
	'SKIP'
)

source /opt/ps3dev/ps3toolchain.sh

prepare() {
	cd "${srcdir}/PSL1GHT"

	# Weird different internal compiler errors with Os/O2/O3, only O1 works
	sed -e "s/-O2/-O1/g" -i ppu/librsx/Makefile

	# ppu-gcc 15 fix
	sed -e "s/gcmGetControlRegister()/gcmGetControlRegister(gcmContextData *context)/g" -i ppu/include/rsx/gcm_sys.h

	# gcc 15 fix
	sed -e "/typedef enum.*bool/d" -i tools/ps3load/source/main.c
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
