# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=coati
_pkgname=Coati
# Make sure to use vercmp to check version is seen as newer. Bump epoch if not.
pkgver=0.11.15
_pkgver=${pkgver/\./\_}
pkgrel=1
pkgdesc='A cross-platform source explorer for C/C++ and Java'
arch=('i686' 'x86_64')
url='https://www.coati.io/'
license=('custom')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::${url}/downloads/${pkgver}/linux/64bit/")
sha256sums=('aecf8e7dab97640e272086efd113be4f5fcfe3d571384ec62c134d9089eed8de')
noextract=("${pkgname}-${pkgver}.tar.gz")

prepare() {
  mkdir -p "${srcdir}/opt/${pkgname}"
  bsdtar --strip-components 1 -xf "${pkgname}-${pkgver}.tar.gz" \
         -C "${srcdir}/opt/${pkgname}"
}

package() {
(
cat <<EOF
[Desktop Entry]
Type=Application
Version=0.11.15
Name=Coati
GenericName=${_pkgname}
Comment=${pkgdesc}
Icon=${pkgname}
Exec="/usr/bin/${pkgname}"
Terminal=false
Categories=Development;
StartupNotify=true
StartupWMClass=coati-${_pkgname}
EOF
) > ${srcdir}/coati-${pkgname}.desktop

  rsync -rtl "${srcdir}/opt" "${pkgdir}"

  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m 644 "${srcdir}/coati-${pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/"

  ln -s "/opt/${pkgname}/data/gui/icon/logo_1024_1024.png" \
            "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  ln -s "/opt/${pkgname}/EULA.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/${_pkgname}.sh" \
            "${pkgdir}/usr/bin/${pkgname}"
}
