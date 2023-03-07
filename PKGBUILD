# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

_target="powerpc64-ps3-elf"
_target_alias="ppu"
_pkgname="binutils"
pkgname="ps3-${_target_alias}-${_pkgname}"
pkgver="2.40"
pkgrel=1
pkgdesc="GNU Binutils for cross-compiling to ${_target_alias} (PS3 GameOS)"
arch=(x86_64 aarch64 powerpc64le powerpc64 powerpc riscv64)
url='https://gcc.gnu.org/'
license=(GPL LGPL)
depends=()
checkdepends=(dejagnu)
options=(!emptydirs !strip staticlibs !lto)
source=(
	"https://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2"
	"${_pkgname}-${pkgver}-ps3-${_target_alias}.patch"
	"https://git.savannah.gnu.org/cgit/config.git/plain/config.guess"
	"https://git.savannah.gnu.org/cgit/config.git/plain/config.sub"
)
sha256sums=(
	'f8298eb153a4b37d112e945aa5cb2850040bcf26a3ea65b5a715c83afe05e48a'
	'add06582020e8c497074a3c45fc7e8033fdea2be0f32a361ac183ba99684d788'
	'SKIP'
	'SKIP'
)

# PS3DEV
export PS3DEV="/opt/ps3dev"
export PSL1GHT="${PS3DEV}"
export PATH="${PATH}:${PS3DEV}/bin"
export PATH="${PATH}:${PS3DEV}/ppu/bin"
export PATH="${PATH}:${PS3DEV}/spu/bin"

_prefix="${PS3DEV}/${_target_alias}"

prepare() {
	cd "${_pkgname}-${pkgver}"

	patch -p1 < "${srcdir}/${_pkgname}-${pkgver}-ps3-${_target_alias}.patch"
}

build() {
	cd "${_pkgname}-${pkgver}"

	mkdir "build-${_target_alias}"
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
