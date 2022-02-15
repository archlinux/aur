# Maintainer: Fabian Brosda <fabi3141@gmx.de>
#
# The patches 1 to 10 are from the corresponding debian package

pkgname=gauche-c-wrapper
_pkgname=${pkgname#gauche-}
pkgver=0.6.1
pkgrel=3
pkgdesc='Gauche foreign function interface for C and Objective-C libraries.'
url='http://www.koguro.net/prog/c-wrapper/'
arch=('x86_64')
depends=('gauche')
makedepends=('make' 'autoconf')
license=('MIT')

# include any patches you want to have applied here
source=('http://www.koguro.net/prog/c-wrapper/c-wrapper-0.6.1.tgz'
	'01_use_installed_libffi.patch'
	'02_multilib.patch'
	'04_build_with_gcc5.patch'
	'05_cflags.patch'
	'06___glibc_macro_warning.patch'
	'08-gen-gpd-fix.patch'
	'09-cpp-c-ldflags.patch'
	'10-fix-closure-alloc.patch'
	'11_fix_jp_encoding.patch'
	'12_float128.patch'
	'13_local_typedef.patch'
	'14_extend_parser.patch'
	'15_fix_scm_reg_exec.patch'
	'16_gauche_0_9_11_compat.patch')
sha1sums=('3b52496fa8151a409538d361e08b05ad9de16ac2'
          '99878b6fc5c306223e7119861b5af92362f90fd9'
          '11f45d119f2fc660ac32de724b01d47aaaf84675'
          '4a415ff35ad34ac84e4fadfd3f1b0aa5a11e4bba'
          '58a7d6a2b4591bb0a5b0481a79b63f5db4ca550d'
          '354a51fb8f578453c89d86c0ad9382dfe020b350'
          'faae81fcb833f5571ba151f319ed6d948d679935'
          'fc6aff7e1d30b177565654702b7eff67b953745d'
          'ec1582da5e299adc76fa21d0397e7ad1d323ee50'
          '341697ca27ee06fa80357f80807b11b5593cf6c3'
          '835d8befbfa7346f49fba39e2dfb74cb63a01af9'
          '46f2ae372276c51b534db5592398ef69a9264ca0'
          'c888b1aebf37adf20cc7874c31b1c8a2ba0dcd45'
          '8239972e42afb42a1040f7274c55620901458ca8'
          '113fc320f21d0648421b8e006bd63233dfa61619')

prepare() {
    cd "${_pkgname}-${pkgver}"

    for filename in "${source[@]}";
    do
	if [[ "$filename" =~ \.patch$ ]]; then
	    patch -p1 -N -i "$srcdir/${filename##*/}"
	fi
    done
}

build() {
    cd "${_pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make

    # Extract license from README
    sed -n '/License/,/ license./p' README > LICENSE
}

check() {
    cd "${_pkgname}-${pkgver}"
    make check
}

package() {
    cd "${_pkgname}-${pkgver}"

    make DESTDIR="$pkgdir" install

    install -d "$pkgdir"/usr/share/licenses/$pkgname/
    install -m 444 -t "$pkgdir"/usr/share/licenses/$pkgname/ ${srcdir}/"${_pkgname}-${pkgver}"/LICENSE
}
