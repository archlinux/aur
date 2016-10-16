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

		'next-16x16.png'
		'next-24x24.png'
		'next-32x32.png'
		'next-48x48.png'
		'next-64x64.png'
		'next-96x96.png'
		'next-128x128.png'
		'next-192x192.png'
		'next-256x256.png'
		'next.LICENSE')

sha256sums=(	'e26cb0d4fdcdbfbc275ceaef9e94ad151d34792a1879dddd896ed2953d184576'

		'da75a4813dfbdeb9741baf4308799732b541bab8e7628578692a89d9ff2425dd'
		'15e2c9a76e1900196ca8179a0a218cc8c4abd5c214960d4772e6bbf70ab45d49'
		'22d503b69eccea1e276b94657d9131de56486767e87f362d729366a025ef1bc8'
		'd294ce00828ebee8c9734ab5daf343117116603f091cd62d14e23ea8787c17af'
		'946ecde0fb126a047ce6784714ac094b01431a57b7e2ea69217d337e2b30841e'
		'5bb17db20c71f6c7d026d68df6c7ab57ad768d0b44bb3e52fba678f856716611'
		'c3ca268d88ff1ecdf20aa2aecd5bde8f5bb115af4b2e01e108c921edc5e93d49'
		'473c48dd726c64f4252ecb9e360b79a9e7a2fa1951d3cf52208b29e00426f4eb'
		'db7b807ec1cb84a5d6c575eb263affd14c3ae72800a73d0571358f378b60a2e2'
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
