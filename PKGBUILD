# Maintainer: Mark Collins <tera_1225 [at] hotmail [ðot] com>
pkgname=elan-bin
_pkgname=elan
_pkgname_caps=ELAN
pkgver="7.1"
pkgrel=3
pkgdesc="A video and audio annotation tool"
arch=('x86_64')
url="https://tla.mpi.nl/tools/tla-tools/elan/"
provides=('elan')
conflicts=('elan')
depends=(
  'alsa-lib'
  'ffmpeg'
  'freetype2'
  'gcc-libs'
  'glibc'
  'libx11'
  'libxcb'
  'libxext'
  'libxi'
  'libxrender'
  'libxtst'
  'zlib'
)
optdepends=(
  'vlc: enable use of VLC as the media framework'              
  'vlc-plugins-all: enable use of VLC as the media framework'
)
license=('GPL-3.0-or-later')
source=("https://www.mpi.nl/tools/${_pkgname}/${_pkgname_caps}_${pkgver//\./\-}_linux.tar.gz"
        "${_pkgname}.desktop"
        "${_pkgname}_wrapper.sh")
sha256sums=('ab0095ccb4dca8439d76da6cb14d22613c446d6edf021729ca454f65d9c77b94'
            '29952b1c1cc51afec11e9aaf119e65656199b8eaa41972854fe0b1871dfd0dcb'
            'baf3fc09376cc59df4db7239cda6c1f23999d3414aa644ef29c7a7ae09211a62')
options=(!debug)

package() {
	cd "${srcdir}/${_pkgname_caps}_${pkgver}/"
	
  echo "Installing ${_pkgname} in /opt/${_pkgname}"
  install -d -m755 "${pkgdir}/opt/${_pkgname}"
	install -d -m755 "${pkgdir}/opt/${_pkgname}/bin"
	cp -r "lib" "${pkgdir}/opt/${_pkgname}/"
	install -D -m755 "bin/${_pkgname_caps}_$pkgver" "${pkgdir}/opt/${_pkgname}/bin/"

  echo "Installing binary wrapper shell script"
  sed -i 's/VERSIONSTRINGHERE/'"$pkgver"'/' "${srcdir}/${_pkgname}_wrapper.sh"
	install -d -m755 "${pkgdir}/usr/bin/"
	install -D "${srcdir}/${_pkgname}_wrapper.sh" "${pkgdir}/usr/bin/${_pkgname}"

  echo "Installing desktop file"
	install -d -m755 "${pkgdir}/usr/share/applications/"
	install -D "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"

  echo "Installing logo"
  install -d -m755 "${pkgdir}/usr/share/pixmaps"
  install -D "${srcdir}/${_pkgname_caps}_${pkgver}/lib/${_pkgname_caps}_${pkgver}.png" \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
