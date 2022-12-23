# Maintainer: robertfoster
# Contributor: Det <nimetonmaili gmail a-dot com>

pkgname=biglybt-extreme-mod
pkgver=3.2.0.0
_ver=${pkgver/b*/}
_modver=20221014
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
  "BiglyBT_${pkgver}_${_modver}.zip::https://www.sb-innovation.de/attachment.php?attachmentid=21389&d=http://www.sb-innovation.de/attachment.php?attachmentid=21389&d=1665759448")
noextract=($(basename ${source[1]}))
sha512sums=('959a1b81c160512407a0695557158c7d3fe823eef2f9cd572bbeaa4be7bc798962e52db517cdbb7c1a97f24715c1aed45b00f897bb4aa3611a312cb5373fd722'
            'f21e4b90a84ce60b9757b7d749d525663898ede49787f43e11aa74ca1ca5a271527dd84a4ab799e04a36490e20fc71c0c408ccd4356e4c0a8fd40bda2fd90504')

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
