# Maintainer: robertfoster
# Contributor: Det <nimetonmaili gmail a-dot com>

pkgname=biglybt-extreme-mod
pkgver=3.0.0.0
_ver=${pkgver/b*/}
_modver=20220226
pkgrel=1
pkgdesc="A modded version of the BiglyBT client with multiple spoofing capabilities"
arch=('x86_64')
url="http://www.sb-innovation.de/f41/"
license=('GPL3')
depends=('desktop-file-utils' 'xdg-user-dirs' 'java-runtime>=8')
optdepends=('jna' 'libappindicator-gtk3' 'ttf-dejavu')
options=('!strip')
install=${pkgname}.install
source=("GitHub_BiglyBT_Installer_${pkgver}.sh::https://github.com/BiglySoftware/BiglyBT/releases/download/v$_ver/GitHub_BiglyBT_Installer.sh"
  "BiglyBT_${pkgver}_${_modver}.zip::https://www.sb-innovation.de/attachment.php?attachmentid=21219&d=1645871561")
noextract=($(basename ${source[1]}))
sha512sums=('543ea77d804d659e6d5e8ceef043b8f442c0f10cef03279aefb513eb9bee6ab5c12900984e9680327445fedf50620d502bf4bfa3325fe360ef3823f0cb6f05f4'
            '451b2a6c9f353f83c57c6ef35d930782c98a71ee57906ce9ad2d37471a95aa31c85f74c58fdd16c12c13e62ec554d8c24096d50c84e53619585bf217cb20e598')

package() {
  if [[ ! -f /usr/bin/javac ]]; then
    warning "Installation without JDK will cause prompts for Root password during build!"
  fi

  if [[ -d "${pkgname}" ]]; then
    msg2 "Cleaning build environment..."
    rm -r "${pkgname}"
  fi

  msg2 "Extracting GitHub_BiglyBT_Installer_${pkgver}.sh..."
  export app_java_home="/usr/lib/jvm/default"

  # Prevent the installer from creating files in the user's homedir
  export HOME="${srcdir}/home"
  mkdir -p ${srcdir}/home/{Desktop,.local/share/applications}

  sh "GitHub_BiglyBT_Installer_${pkgver}.sh" -q -dir "${srcdir}/${pkgname}"

  cd "${srcdir}/${pkgname}"

  msg2 "Creating directory structure..."
  install -d "${pkgdir}/opt/${pkgname}/"
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -d "${pkgdir}/usr/share/pixmaps/"

  msg2 "Moving stuff in place..."
  # Launchers
  mv biglybt "${pkgdir}/usr/bin/${pkgname}"

  # Icon and desktop
  mv biglybt.svg "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  mv biglybt.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Licenses
  mv 3rdPartyLicences.txt GPL.txt GPLv3.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  msg2 "Removing redundancies..."
  rm swt/swt-{bsd,ppc64,ppc64le,x86}.jar
  rm biglybt-lightgray.svg biglybt.png
  rm installer.log
  rm {,un}registerBiglyBT uninstall updateBiglyBT

  msg2 "Installing to /opt..."
  mv * "${pkgdir}/opt/${pkgname}/"

  msg2 "Fixing paths..."
  sed -i "s|#PROGRAM_DIR=.*|PROGRAM_DIR=\"/opt/${pkgname}\"|" "${pkgdir}/usr/bin/${pkgname}"
  sed -e "s|Name=.*|Name=BiglyBT Extreme Mod|" -e "s|Exec=.*|Exec=${pkgname} %U|" -e "s|Icon=.*|Icon=${pkgname}|" \
    -i "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  msg2 "Installing Extreme Mod..."
  bsdtar -xf "${srcdir}/BiglyBT_${pkgver}_${_modver}.zip" -C "${pkgdir}/opt/${pkgname}/"
}
