# Maintainer: robertfoster
# Contributor: Det <nimetonmaili gmail a-dot com>

pkgname=biglybt-extreme-mod
pkgver=2.9.0.0
_ver=${pkgver/b*/}
_modver=20211119
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
  "BiglyBT_${pkgver}_${_modver}.zip::http://www.sb-innovation.de/attachment.php?attachmentid=21083&d=1637292957")
noextract=($(basename ${source[1]}))
sha512sums=('5049f361fe572b184bbf69dfc21994e7ab8768246682b98534beff100abbbc46bdf503412c059df0b16fed9c34b8fab2ff43a47c8f0bbef69f7e63aeda822639'
            '1b637d4b55e43146b418945d6825994ead5d1fa59368843f1c41ae83f8b51f84fc9cbc6e31e315b94dce3ff5c7f103e2baae86e4de4e564c496896ed31f7d7d6')

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
