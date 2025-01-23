# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_name=asitic
pkgname="${_name}-bin"
pkgver=20011105
pkgrel=1
pkgdesc="Analysis and Simulation of Spiral Inductors and Transformers for ICs (32-bit binary)"
arch=('x86_64')
url="https://rfic.eecs.berkeley.edu/software.html"
license=('LicenseRef-FreeWare')
depends=(
	"lib32-glibc"
	"lib32-gcc-libs"
	"lib32-libxext"
	"lib32-libx11"
	"lib32-libxcb"
	"lib32-libxau"
	"lib32-libxdmcp"
	"lib32-f2c"
	"xorg-fonts-misc" # Requires the 9x15 font
)
makedepends=(
	'patchelf'
	'xorg-mkfontscale'
)
options=()

# The URL is not online anymore
# Have to be accessed through Wayback machine
_wayback_snapshot="20210509075224"
_wayback_url="https://web.archive.org"
_asitic_url="http://rfic.eecs.berkeley.edu/~niknejad/Asitic"
_asitic_ver="grackle"
_doc_date="05_28_01"
_url="${_wayback_url}/${_wayback_snapshot}/${_asitic_url}/${_asitic_ver}"

source=(
	"${_name}-${pkgver}.gz::${_url}/asitic_linux.gz"
	"${_name}-doc-${pkgver}.tgz::${_url}/doc_${_doc_date}.tgz"
)
noextract=("${_name}-${pkgver}.gz")
b2sums=(
	'4950500b6f81217cfc327928105eb7e344543782302d4e0fdf6e2fdc7a15e2d4212d5e1a831dc30ab7d2116cf4a2e21dd806e0d42f81e423c2e6e2a6e58f24d4'
	'88cc4dddd9b7eaeaed760471cbdb971d85e5263c7e66994acdba125b230ce2cf111fa5d51300c6a55b1c0b1d3c37f1a650535e61829f4c7adf3ed0ba46cacc8e'
)


_srcdir="${_name}-${pkgver}"
prepare() {
	mkdir "${_srcdir}" || true
	gunzip -c "${_name}-${pkgver}.gz" > "${_srcdir}/${_name}"
	mv "doc-${_doc_date//_/-}" "${_srcdir}/doc"

	# ASITIC refers to an older library g2c.so; however this has been replaced by a newer one
	# For compatability we need to patch g2c.so -> f2c.so
	patchelf --replace-needed libg2c.so.0 libf2c.so "${_srcdir}/${_name}"
}

package() {
	cd "${_srcdir}"

	# Install binary
	install -Dm0755 -t "${pkgdir}/usr/bin/" "${_name}"

	# Install doc
	install -Dm0644 -t "${pkgdir}/usr/share/${_name}/doc/" doc/*

	# License: No license found...
}
