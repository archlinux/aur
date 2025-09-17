# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

_target="powerpc64-ps3-elf"
_target_alias="ppu"
_pkgname="binutils"
pkgname="ps3-${_target_alias}-${_pkgname}"
pkgver="2.45"
pkgrel=1
pkgdesc="GNU Binutils for cross-compiling to ${_target_alias} (PS3 GameOS)"
arch=(x86_64 aarch64 powerpc64le powerpc64 powerpc riscv64)
url='https://www.gnu.org/software/binutils/'
license=('GPL3' 'GPL' 'FDL1.3' 'custom:FSFAP')
depends=(ps3-env glibc jansson libelf zlib zstd)
makedepends=(patch)
checkdepends=(dejagnu debuginfod bc)
options=(!emptydirs !strip staticlibs !lto)
source=(
	"https://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"
	"${_pkgname}-${pkgver}-ps3-${_target_alias}.patch"
	"https://git.savannah.gnu.org/cgit/config.git/plain/config.guess"
	"https://git.savannah.gnu.org/cgit/config.git/plain/config.sub"
)
sha256sums=(
	'c50c0e7f9cb188980e2cc97e4537626b1672441815587f1eab69d2a1bfbef5d2'
	'add06582020e8c497074a3c45fc7e8033fdea2be0f32a361ac183ba99684d788'
	'SKIP'
	'SKIP'
)

source /opt/ps3dev/ps3toolchain.sh

_prefix="${PS3DEV}/${_target_alias}"

prepare() {
	cd "${_pkgname}-${pkgver}"

	patch -p1 < "${srcdir}/${_pkgname}-${pkgver}-ps3-${_target_alias}.patch"
}

build() {
	cd "${_pkgname}-${pkgver}"

	mkdir -p "build-${_target_alias}"
	cd "build-${_target_alias}"

	local _configure_flags=(
		--prefix="${_prefix}"
		#--libdir="${_prefix}/host-libs/lib"
		#--with-lib-path="${_prefix}/lib"
		--target="${_target}"

		--with-gcc
		--with-gnu-as
		--with-gnu-ld

		--enable-64-bit-bfd
		--enable-lto

		--disable-nls
		--disable-shared
		--disable-debug
		--disable-dependency-tracking
		--disable-werror
	)
	../configure "${_configure_flags[@]}"

	make
}

check() {
	cd "${_pkgname}-${pkgver}/build-${_target_alias}"

	LDFLAGS="" make --keep-going check |& tee -a "ps3-${_target_alias}-${_pkgname}-check.log" || true
}

package() {
	cd "${_pkgname}-${pkgver}/build-${_target_alias}"

	make DESTDIR="${pkgdir}" install

	if [ -f "ps3-${_target_alias}-${_pkgname}-check.log" ]; then
		cp "ps3-${_target_alias}-${_pkgname}-check.log" "${pkgdir}/${_prefix}/"
	fi

	rm -f "${pkgdir}/${_prefix}/share/info/dir"

	cd "${pkgdir}/${_prefix}"
	ln -s "${_target}" "${_target_alias}"

	cd "${pkgdir}/${_prefix}/bin"
	for b in ${_target}-*; do
		ln -s "${b}" "${b/${_target}/${_target_alias}}"
	done
}
