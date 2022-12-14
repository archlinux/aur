# Maintainer:  ghesy <ehsan at disroot dot org>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: dcelasun
# Contributor: David Phillips <dbphillipsnz gmail dot com>

_name=wkhtmltopdf
pkgname=${_name}-static
pkgver=0.12.6.1_r2
pkgrel=2
pkgdesc='Shell utility to convert HTML to PDF using Webkit and Qt (upstream static build)'
url='https://github.com/wkhtmltopdf/packaging'
license=('GPL3')
provides=("$_name")
conflicts=("$_name")
depends=(
	'bzip2' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'glibc' 'glib2'
	'graphite' 'harfbuzz' 'libjpeg6-turbo' 'libpng' 'libx11' 'libxau'
	'libxcb' 'libxcrypt' 'libxdmcp' 'libxext' 'libxrender' 'openssl-1.1'
	'pcre' 'zlib'
)
optdepends=(
	'icu48: Rendering from HTML uses unicode character encoding'
)
# debian packages are already stripped, so don't bother re-attempting
options=('!strip')

# debian release codenames:
#
#   Forky       TBD
#   Trixie      TBD
#   Bookworm    TBD
#   Bullseye    2021
#   Buster      2019
#   Stretch     2017
#
_release='bullseye'
_version=${pkgver%_*}-${pkgver##*r}
_source=(
	"${_name}-${_version}-@ARCH@.deb::${url}/releases/download/${_version}/wkhtmltox_${_version}.${_release}_@SRCARCH@.deb"
)

# architectures and their counterparts used in the source URL
declare -Ag _archmap=(
	['x86_64']='amd64'
	['i386']='i386'
	['aarch64']='arm64'
	['ppc64le']='ppc64el'
)

package() {
	tar -xf data.tar.xz
	mkdir -p "${pkgdir}/usr/"
	cp -a usr/local/* -t "${pkgdir}/usr/"
	cp -aT usr/share "${pkgdir}/usr/share"
}

# boilerplate for generating the "arch=()" and "source_<arch>=()" arrays
arch=("${!_archmap[@]}")
for _a in "${!_archmap[@]}"; do
	_sa=${_archmap[$_a]}
	_s=("${_source[@]//@ARCH@/$_a}")
	_s=("${_s[@]//@SRCARCH@/$_sa}")
	declare -ag "source_${_a}="'("${_s[@]}")'
done

sha256sums_i386=('35ff064a6bfdd39aa5a193b021de09d5add48ff1cb99e2e881bb81b880358779')
sha256sums_aarch64=('3344e3a72f4cb4c1218cf48ac5fa9e88bef62aa7fa6f2295be7d5bc1fef100b1')
sha256sums_ppc64le=('82a9845aad7a76fdf386156407ab41242c9c6ee686d4f5fa02b3383f7c553c37')
sha256sums_x86_64=('50a3c5334d1fb21349f8ec965fc233840026c376185e3aa75373e6e7aa3ff74d')
