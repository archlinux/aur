# Maintainer: robertfoster
# Contributor: Det <nimetonmaili gmail a-dot com>

pkgname=biglybt-extreme-mod
pkgver=3.1.0.0
_ver=${pkgver/b*/}
_modver=20220708
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
  "BiglyBT_${pkgver}_${_modver}.zip::https://www.sb-innovation.de/attachment.php?attachmentid=21332&d=1657259961")
noextract=($(basename ${source[1]}))
sha512sums=('a760d374bfdc1a4ead6c08fc97c28d2cea9fdfefd4c2c5958c3412c999cad489ac505346605b5d30488ba4b80dfbb81c3c90b2feaceb95e39ce5f331e4920a71'
            '889ac43de16561310201c6132a34a0f0c12730e8e870876f757f58cba60a7953c7cf0018c3741036986c7f113f1351e3a3dfc48c89801c8dd8c0dbe2b7f491fb')

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
