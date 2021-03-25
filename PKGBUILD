# Maintainer: robertfoster
# Contributor: Det <nimetonmaili gmail a-dot com>

pkgname=biglybt-extreme-mod
pkgver=2.7.0.2
_ver=${pkgver/b*/}
_modver=20201218
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
  "BiglyBT_${pkgver}_${_modver}.zip::http://www.sb-innovation.de/attachment.php?attachmentid=20989&d=1616337721")
noextract=($(basename ${source[1]}))
sha512sums=('07f66adf898d5c5db9d030a7fc11a374387b4d630e2f0371378af8063ed86547dae993c9ffd5637695c6b4ebcaee70fc9a343f4e435127aacc7aa2d76c856f82'
  'd9db44c34fb9552345105655648150984381a1f922a93916eed9956647e0fc9397f85404f54f7bf1e47c75105b70918b1c25129a40318270a8eb56455ee7c7c8')

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
