# Maintainer: Samuel Corsi-House <chouse.samuel@gmail.com>
# Contributor: D. Can Celasun <can[at]dcc[dot]im>

pkgname=code-insiders
pkgver=1_63_0_1636353036
pkgrel=1
pkgdesc="Editor for building and debugging modern web and cloud applications (insiders version)"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://code.visualstudio.com/"
license=('custom: commercial')
# lsof: need for terminal splitting, see https://github.com/Microsoft/vscode/issues/62991
depends=(libxkbfile gnupg gtk3 libsecret nss gcc-libs libnotify libxss glibc lsof)
optdepends=('glib2: Needed for move to trash functionality'
            'libdbusmenu-glib: Needed for KDE global menu')

pkgver() {
    if [ "${CARCH}" = "x86_64" ]; then
        IFS='/' read -ra ADDR <<< $(curl -ILs -o /dev/null -w %{url_effective} https://code.visualstudio.com/sha/download\?build=insider\&os=linux-deb-x64); echo "${ADDR[5]}" | sed 's/code-insiders_//g' | sed 's/_amd64.deb//g' | sed 's/-/_/g' | sed 's/\./_/g'
    elif [ "${CARCH}" = "aarch64" ]; then
        IFS='/' read -ra ADDR <<< $(curl -ILs -o /dev/null -w %{url_effective} https://code.visualstudio.com/sha/download\?build=insider\&os=linux-deb-arm64); echo "${ADDR[5]}" | sed 's/code-insiders_//g' | sed 's/_arm64.deb//g' | sed 's/-/_/g' | sed 's/\./_/g'
    elif [ "${CARCH}" = "armv7h" ]; then
        IFS='/' read -ra ADDR <<< $(curl -ILs -o /dev/null -w %{url_effective} https://code.visualstudio.com/sha/download\?build=insider\&os=linux-deb-armhf); echo "${ADDR[5]}" | sed 's/code-insiders_//g' | sed 's/_armhf.deb//g' | sed 's/-/_/g' | sed 's/\./_/g'
    else
        IFS='/' read -ra ADDR <<< $(curl -ILs -o /dev/null -w %{url_effective} https://code.visualstudio.com/sha/download\?build=insider\&os=linux-deb-ia32); echo "${ADDR[5]}" | sed 's/code-insiders_//g' | sed 's/_i386.deb//g' | sed 's/-/_/g' | sed 's/\./_/g'
    fi
}

source_x86_64=(code_x64_${pkgver}.deb::https://code.visualstudio.com/sha/download\?build=insider\&os=linux-deb-x64)
source_aarch64=(code_arm64_${pkgver}.deb::https://code.visualstudio.com/sha/download\?build=insider\&os=linux-deb-arm64)
source_armv7h=(code_armhf_${pkgver}.deb::https://code.visualstudio.com/sha/download\?build=insider\&os=linux-deb-armhf)
source_i686=(code_ia32_${pkgver}.deb::https://code.visualstudio.com/sha/download\?build=insider\&os=linux-deb-ia32)

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_i686=('SKIP')

package() {
  rm -rf "${srcdir}/data"
  mkdir "${srcdir}/data"
  tar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/data"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons" 

  install -m644 "${srcdir}/data/usr/share/code-insiders/resources/app/LICENSE.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rtf"
  install -m644 "${srcdir}/data/usr/share/code-insiders/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
  install -m644 "${srcdir}/data/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -m644 "${srcdir}/data/usr/share/applications/${pkgname}-url-handler.desktop" "${pkgdir}/usr/share/applications/${pkgname}-url-handler.desktop"

  cp -r "${srcdir}/data/usr/share/code-insiders/"* "${pkgdir}/opt/${pkgname}" -R
  ln -s /opt/${pkgname}/bin/code-insiders "${pkgdir}"/usr/bin/code-insiders
  ln -s /opt/${pkgname} ${pkgdir}/usr/share/code-insiders
}
