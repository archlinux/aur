# Maintainer: Rinus Remspoor <remspoor AT linuxmail DOT org>

pkgname=next
pkgver=1.454
pkgrel=1
pkgdesc="CGM rc Heli Flight Simulator"
arch=('i686' 'x86_64')
url="http://www.rc-aerobatics.eu/index_e.html"
license=('custom')
groups=()
backup=()
options=()
install=
changelog=${pkgname}.changelog
#makedepends=(	'gendesk')
depends=()
optdepends=(	'joyutils: jscal, jstest, and jsattach utilities for the Linux joystick driver')
source=(	'http://www.cgm-online.com/secure_rc-heli-simulator/cgm-rc-heli-simulator-linux-x86-64bit.zip'
		'next.LICENSE')

sha256sums=(	'e26cb0d4fdcdbfbc275ceaef9e94ad151d34792a1879dddd896ed2953d184576'
		'febb1e65a7932f2f80155078b1dd64f469433625c76cff43b239768a184729f0')

_DEST_PREFIX="/opt/${pkgname}"

prepare() {
  # rename the original directory to something sane and remove an OSX directory
  mv "Linux x86+64bit" "${pkgname}"
  rm -r "__MACOSX"

  cd "${pkgname}"

  # Remove unneeded and platform dependent files
  msg2 "Removing unneeded files..."
  find . -name '.DS_Store' -exec rm {} \;

  if [ "${CARCH}" == 'i686' ]; then
    rm -r ./neXt_Data/Mono/x86_64
    rm -r ./neXt_Data/Plugins/x86_64
    rm ./neXt.x86_64
  fi
  if [ "${CARCH}" == "x86_64" ]; then
    rm -r ./neXt_Data/Mono/x86
    rm -r ./neXt_Data/Plugins/x86
    rm ./neXt.x86
  fi

  msg2 "Creating .desktop file..."
  #gendesk --pkgname "${pkgname}-test" --pkgdesc "${pkgdesc}" -n

  if [ "${CARCH}" == 'i686' ]; then
  cat > "${srcdir}"/${pkgname}.desktop << EOF
[Desktop Entry]
Encoding=UTF-8
Name=neXt
Version=1.0
GenericName=A helicopter flight simulator made by CGM
Comment=${pkgdesc}
Exec=/opt/${pkgname}/neXt.x86
Terminal=false
Icon=/usr/share/icons/hicolor/96x96/apps/next.png
#Icon=${pkgname}
Type=Application
StartupNotify=false
Categories=Education;
Keywords=simulator;rc;helicopter
EOF
  fi
  if [ "${CARCH}" == "x86_64" ]; then
  cat > "${srcdir}"/${pkgname}.desktop << EOF
[Desktop Entry]
Encoding=UTF-8
Name=neXt
Version=1.0
GenericName=A helicopter flight simulator made by CGM
Comment=${pkgdesc}
Exec=/opt/${pkgname}/neXt.x86_64
Terminal=false
Icon=/usr/share/icons/hicolor/96x96/apps/next.png
#Icon=${pkgname}
Type=Application
StartupNotify=false
Categories=Education;
Keywords=simulator;rc;helicopter
EOF
  fi
}

#build() {
#  
#}

package() {
  cd "${srcdir}/${pkgname}"

  # Install files to ${pkgdir}
  install -dm755 "${pkgdir}${_DEST_PREFIX}"

  msg2 "Copying files to package directory..."
  cp -dr --no-preserve=ownership . ${pkgdir}/${_DEST_PREFIX}

  msg2 "Copying icon files to package directory..."
  cd ${srcdir}
  # Find all files with extension .png, extract the icon size and install into the right directory
  for i in *.png; do
    # Bad hack, could this be done in one line?
    ii="${i##*-}"
    iconsize="${ii%.*}"
    iconext="${i##*.}"
    iconname="${i%%-*}"
    install -Dm644 ${i} "${pkgdir}/usr/share/icons/hicolor/${iconsize}/apps/${iconname}.${iconext}"
  done

  msg2 "Installing .desktop file..."
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install license file, can't find one right now, maybe ask the author of the software later.
  install -Dm644 ${pkgname}.LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
