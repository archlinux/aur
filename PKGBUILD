# Maintainer: Joshua Olsen (JackKelli) <joshuaolsen@gmail.com>

pkgname=urbanterror41
pkgver=4.1
pkgrel=1
epoch=1
pkgdesc="Urban Terror is a team-based tactical shooter based on the Quake 3 Engine (ioQ3 Version)"
arch=('x86_64')
url="http://www.urbanterror.info"
license=('GPL2')
depends=('sdl' 'openal' 'curl' 'opus' 'opusfile' 'mumble')
makedepends=('mesa')
source=("https://up.barbatos.fr/urt/UrbanTerror4.1.1.zip"
        "git+https://github.com/ioquake/ioq3.git"
        "https://upload.wikimedia.org/wikipedia/commons/5/56/Urbanterror.svg"
        "ioq3-makefile.local"
        "ioq3-standalone.patch"
        "ioq3-compile64.patch"
        "${pkgname}.sh"
        "${pkgname}-server.sh"
        "${pkgname}.desktop"
        "default.cfg")
md5sums=('722c1fea9936593c9ef039bb068cc33b'
         'SKIP'
         '728dc8288d4ffb781feddf55e0fc878d'
         'c8e10b3582bbe56ccaf5e9d43c961002'
         '1643d06ec3079542fb38cf2b913c84d9'
         '62736969cc65c7b82d2183fd01078c2f'
         'a437e92578430636a35bcb9b17337198'
         'b3fd5122bdd49c6003701dd9214b9aef'
         '5e1068aed72fb55bf9dcb80efa72a9c7'
         'SKIP')

package() {
  unzip -o UrbanTerror4.1.1.zip -d "${srcdir}"

  cp -f "ioq3-makefile.local" ioq3/Makefile.local
  patch -d "${srcdir}/ioq3" -s -p1 < ioq3-standalone.patch
  patch -d "${srcdir}/ioq3" -s -p1 < ioq3-compile64.patch
  
  cd ioq3
  make

  zip -j - "${srcdir}/default.cfg" > "${srcdir}/zpak000_newdefault.pk3"
  mkdir -p "${pkgdir}/opt/${pkgname}/q3ut4"
  install -m755 "${srcdir}/ioq3/build/release-linux-x86_64/urbanterror41.x86_64" "${pkgdir}/opt/${pkgname}"
  install -m755 "${srcdir}/ioq3/build/release-linux-x86_64/urbanterror41-server.x86_64" "${pkgdir}/opt/${pkgname}"
  install -m755 "${srcdir}/ioq3/build/release-linux-x86_64/renderer_opengl1_x86_64.so" "${pkgdir}/opt/${pkgname}"
  install -m755 "${srcdir}/ioq3/build/release-linux-x86_64/renderer_opengl2_x86_64.so" "${pkgdir}/opt/${pkgname}"
  install -m644 "${srcdir}/UrbanTerror/q3ut4/autoexec.cfg" "${pkgdir}/opt/${pkgname}/q3ut4"
  install -m644 "${srcdir}/UrbanTerror/q3ut4/description.txt" "${pkgdir}/opt/${pkgname}/q3ut4"
  install -m644 "${srcdir}/UrbanTerror/q3ut4/mapcycle.txt" "${pkgdir}/opt/${pkgname}/q3ut4"
  install -m644 "${srcdir}/UrbanTerror/q3ut4/server.cfg" "${pkgdir}/opt/${pkgname}/q3ut4"
  install -m644 "${srcdir}/UrbanTerror/q3ut4/zpak000.pk3" "${pkgdir}/opt/${pkgname}/q3ut4"
  install -m644 "${srcdir}/UrbanTerror/q3ut4/zpak000_assets.pk3" "${pkgdir}/opt/${pkgname}/q3ut4"
  install -m644 "${srcdir}/UrbanTerror/q3ut4/zpak001_assets.pk3" "${pkgdir}/opt/${pkgname}/q3ut4"
  install -m644 "${srcdir}/zpak000_newdefault.pk3" "${pkgdir}/opt/${pkgname}/q3ut4"
  install -m644 -T "${srcdir}/Urbanterror.svg" "${pkgdir}/opt/${pkgname}/${pkgname}.svg"
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 -T "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -m755 -T "${srcdir}/${pkgname}-server.sh" "${pkgdir}/usr/bin/${pkgname}-server"
  mkdir -p "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"
}