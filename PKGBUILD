# Maintainer: Maddie Mewmews <maddie at mewmews gay>
# Contributor: June <june@eridan.me>

pkgname=q-zandronum
pkgver=1.4.11
pkgrel=1
_fmodex_ver=4.44.64
pkgdesc="Zandronum 3.0 fork with improved netcode and Quake movement"
arch=('x86_64')
url="http://qzandronum.com/"
license=('custom')
depends=('sdl' 'libjpeg6-turbo' 'glu' 'openal' 'openssl-1.1' 'fluidsynth' 'mpg123')
optdepends=('timidity++: midi support' 'freedoom: free IWAD' 'gtk2: for a GUI selection screen' 'doomseeker: a GUI server browser')
#makedepends=( 'zlib' 'sdl' 'libjpeg-turbo' 'nasm' 'gtk2' 'cmake' 'mercurial' 'fluidsynth' 'mesa' 'glu' ) # Package isn't being built from source
_pkgname=q-zandronum
install=q-zandronum.install

source_x86_64=("https://github.com/IgeNiaI/Q-Zandronum/releases/download/${pkgver}/Q-Zandronum_${pkgver}_Linux_amd64.tar.gz")
#latest=https://github.com/IgeNiaI/Q-Zandronum/releases/download/1.4.11/Q-Zandronum_1.4.11_Linux_amd64.tar.gz
source=(
	'LICENSE.txt'
	"${pkgname}.launcher"
	"${pkgname}-server.launcher"
	"${pkgname}.desktop"
	"${pkgname}.svg"
)

sha256sums_x86_64=('74e2f1b394243714f00cdf82cbeb9148ff5824d71cd528f0969262ebd16af925')

sha256sums=(
	'c9407f638950af1dc4ff0884aa73a41490390b79435a81805a8e9c8c0ec84adf'
	'1fe0a389e571c77aa0207c09bee6533828e818e7daff34640c0a01c25f094088'
	'3170f827179cc7c14f2755cc6a324fc12c71cde2793d21a8f0cdb829c9bb3469'
	'04b74a1053b413cc59fdeedebe518f35fe2db88b7577a7eacd5858ea4c56c20d'
	'77967f0ef35fbeae6e3e70e3b779b9eddeb8e08fa259bfa88806b72be34973d0'
)

if [ "${CARCH}" == "x86_64" ];
then
        _fmod_suffix="64"
else
        _fmod_suffix=""
fi

_bundle_freedoom=${_bundle_freedoom-y}


package() {
  cd ${srcdir}
  echo "For compatibility reasons, the bundled FreeDOOM wads are included in the package unless the variable above (in the PKGBUILD) is blanked out."
  install -Dm644 "q-zandronum.pk3" "${pkgdir}/usr/share/${pkgname}/q-zandronum.pk3"
  install -Dm755 "q-zandronum" "${pkgdir}/usr/share/${pkgname}/q-zandronum"
  install -Dm755 "q-zandronum-server" "${pkgdir}/usr/share/${pkgname}/q-zandronum-server"
  install -Dm755 "gm.sf2" "${pkgdir}/usr/share/${pkgname}/gm.sf2"
  install -dm755 ${pkgdir}/usr/share/${pkgname}/Doomseeker
  cp -R "${srcdir}/Doomseeker" "${pkgdir}/usr/share/${pkgname}"
  install -dm755 ${pkgdir}/usr/share/${pkgname}/lib
  install -Dm755 "libfmodex${_fmod_suffix}-${_fmodex_ver}.so" "${pkgdir}/usr/share/${pkgname}/lib/libfmodex${_fmod_suffix}-${_fmodex_ver}.so"
  install -Dm755 "liboutput_sdl.so" "${pkgdir}/usr/share/${pkgname}/lib/liboutput_sdl.so"
  #install -Dm755 "libcrypto.so.1.1" "${pkgdir}/usr/share/${pkgname}/lib/libcrypto.so.1.1"

  if [ -n "$_bundle_freedoom" ]; then
    install -Dm755 "freedoom1.wad" "${pkgdir}/usr/share/${pkgname}/freedoom1.wad"
    install -Dm755 "freedoom2.wad" "${pkgdir}/usr/share/${pkgname}/freedoom2.wad"
    install -Dm755 "freedm.wad" "${pkgdir}/usr/share/${pkgname}/freedm.wad"
  fi

  install -Dm755 "libfluidsynth.so.1" "${pkgdir}/usr/share/${pkgname}/lib/libfluidsynth.so.1"
#  install -Dm755 "libmpg123.so.0" "${pkgdir}/usr/share/${pkgname}/lib/libmpg123.so.0"
#  install -Dm755 "libopenal.so.1" "${pkgdir}/usr/share/${pkgname}/lib/libopenal.so.1"


  install -Dm755 "q-zandronum.launcher" "${pkgdir}/usr/bin/q-zandronum"
  install -Dm755 "q-zandronum-server.launcher" "${pkgdir}/usr/bin/q-zandronum-server"
  install -Dm644 "q-zandronum.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "q-zandronum.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"

  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
