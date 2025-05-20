# Maintainer: Adam Schadler <ajschadler gmail.com>

# 7.X Release notes:
#   https://surfer.nmr.mgh.harvard.edu/fswiki/ReleaseNotes

_pkgname=freesurfer
pkgname=${_pkgname}-bin
pkgver=8.0.0
pkgrel=1
pkgdesc="An open source software suite for processing and analyzing (human) brain MRI images. (Precompiled binary version)"
arch=("i686" "x86_64")
url="https://surfer.nmr.mgh.harvard.edu/"
license=("custom")
depends=(
	"dbus"
	"e2fsprogs"
	"fontconfig"
	"freetype2"
	"glib2"
	"glu"
	"krb5"
	"libdrm"
	"libglvnd"
	"libice"
	"libjpeg6-turbo"
	"libpng12"
	"libsm"
	"libx11"
	"libxcb"
	"libxcrypt-compat"
	"libxext"
	"libxft"
	"libxi"
	"libxkbcommon"
	"libxmu"
	"libxp"
	"libxpm"
	"libxrender"
	"libxss"
	"libxt"
	"pcre2"
	"tcl"
	"tcsh"
	"zlib"
	"zstd"
)
optdepends=(
	"perl-tk: for tkmib script"
)
conflicts=("$_pkgname")
provides=("$_pkgname")
install=${_pkgname}.install
options=(!strip)
source=("https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/8.0.0/freesurfer-Rocky8-${pkgver}-1.x86_64.rpm"
        "freesurfer.sh")
b2sums=('e5842a209da482af7590a98d4d0e68fbbf4979f21ca82298e23d1e827efa928741d2b0ff1408434926b29d69b5b50a960d45a9a3f18232b96ee510bf0da3217d'
        '43752fe3e8a6ce74ae0638abbfc4c2f5ede96a46220c5114af14b4ffc0ac391359c2440dfd41e6e63518d1e16e3b9e202370182303e5f12ed932c6415bf1fe60')

package() {
	# Create dirs
	install -d \
		"${pkgdir}/opt" \
		"${pkgdir}/usr/share/licenses/${_pkgname}" \
		"${pkgdir}/etc/profile.d"

	# Copy over relevant files...
	cp -r --reflink=auto "${srcdir}/usr/local/freesurfer/8.0.0-1/" \
        "${pkgdir}/opt/${_pkgname}"
	install -Dm 644 \
        "${pkgdir}/opt/${_pkgname}/docs/license.freesurfer_SLA.txt" \
        "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	cp "${srcdir}/freesurfer.sh" "${pkgdir}/etc/profile.d/"

	# Addresses error referenced here:
	#  https://www.mail-archive.com/freesurfer@nmr.mgh.harvard.edu/msg45290.html
	ln -s /usr/lib/libjpeg.so "${pkgdir}/opt/${_pkgname}/lib/libjpeg.so.62"
	ln -s /usr/lib/libpng12.so.0 "${pkgdir}/opt/${_pkgname}/lib/"

	# Cleanup
	find "${pkgdir}/opt/${_pkgname}/lib" -name \*.a -delete
}
