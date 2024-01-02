# Maintainer: cmuench / torben

# Default language is english
# Languages to choose from: en, de
# Export the environment variable ECODMS_LANG to select a non-default value.
# for example: export ECODMS_LANG=de

pkgname=ecodms-client
pkgver=23.02
pkgrel=1
pkgdesc="Document Management Software"
arch=('x86_64')
url="http://www.ecodms.de/index.php/de/"
license=('custom')
depends=('apr' 'bash' 'libappindicator-gtk2' 'libgcrypt' 'libpng' 'libjpeg-turbo' 'libtiff5' 'openjpeg2' 'pcre' 'qt5-webengine' 'qt5-svg' 'qt5-x11extras' )
options=('!strip')
install=${pkgname}.install

source_x86_64=("ecodmsclient-23.02-1_amd64.deb::https://www.ecodms.de/ecodms_230264/jammy/ecodmsclient-23.02-1_amd64.deb")
sha256sums_x86_64=("a67d62bff4050605a6fb54b1e7b4991652af73142f92bf5031531645d47d2988")

package() {
  cd "${srcdir}"
  tar -xf data.tar.gz

  ln -sf /usr/lib/libpcre.so opt/ecodms/ecodmsclient/libpcre.so.3
  ln -sf /usr/lib/libappindicator.so opt/ecodms/ecodmsclient/libayatana-appindicator.so.1

  sed -i '1 i #!/bin/sh' opt/ecodms/ecodmsclient/ecodmsclient.sh
  sed -i '1 i #!/bin/sh' opt/ecodms/ecodmsclient/ecodmsconmgr.sh

  if [[ -z "${ECODMS_LANG}" ]]; then
    _LANG='en'
  else
    _LANG="${ECODMS_LANG}"
  fi

  # Set client language
  ln -sf language_${_LANG}.qm opt/ecodms/ecodmsclient/language.qm

  cp -dr --no-preserve=ownership etc opt usr "${pkgdir}"/
}
