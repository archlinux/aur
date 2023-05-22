# Maintainer:  koonix <me at koonix dot org>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: dcelasun
# Contributor: David Phillips <dbphillipsnz gmail dot com>

_name=wkhtmltopdf
pkgname=${_name}-static

_version=0.12.6.1-3
pkgver=${_version%-*}_r${_version##*-}
pkgrel=1

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

# debian packages are already stripped, so don't bother re-attempting
options=('!strip')

# debian release codenames:
#
#   Forky       TBD
#   Trixie      TBD
#   Bookworm    2023
#   Bullseye    2021
#   Buster      2019
#   Stretch     2017
#
_release='bookworm'
_source=(
	"${_name}-${_version}-${_release}-@ARCH@.deb::${url}/releases/download/${_version}/wkhtmltox_${_version}.${_release}_@SRCARCH@.deb"
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

sha256sums_i386=('79ac95fe69bb7ef356b88884a3659c0f03ce679711a78869f0f877f80f20d26c')
sha256sums_aarch64=('b6606157b27c13e044d0abbe670301f88de4e1782afca4f9c06a5817f3e03a9c')
sha256sums_ppc64le=('0f2afa1fbcdad7a5a288ae38fbaf8e1f256be8557084cc56f66cac0bd2af332b')
sha256sums_x86_64=('98ba0d157b50d36f23bd0dedf4c0aa28c7b0c50fcdcdc54aa5b6bbba81a3941d')
