# Maintainer: Dustin Falgout <dustin@falgout.us>
# Contributor: Gifts <gifts.antichat@gmail.com>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

pkgname=pycharm-eap
_buildver=141.1899
_pkgver=4.5.3
_eap="True"
pkgver=${_pkgver}.${_buildver}
pkgrel=1
pkgdesc="Powerful Python and Django IDE, Early Access Program (EAP) build. Professional edition."
arch=('any')
options=('!strip')
url="http://www.jetbrains.com/pycharm/"
license=("custom")
depends=("java-environment>=6")
makedepends=("wget")
provides=("pycharm-professional")
conflicts=("pycharm-professional" "pycharm-pro-eap")
changelog="CHANGES"
if [[ ${_eap} = "True" ]]; then
	source=("http://download.jetbrains.com/python/pycharm-professional-${_buildver}.tar.gz")
	sha256sums=$(wget -q "${source}.sha256" && cat "pycharm-professional-${_buildver}.tar.gz.sha256" | cut -f1 -d" ")
else
	source=("http://download.jetbrains.com/python/pycharm-professional-${_pkgver}.tar.gz")
	sha256sums=$(wget -q "${source}.sha256" && cat "pycharm-professional-${_pkgver}.tar.gz.sha256" | cut -f1 -d" ")
fi


package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  _eap=False
  if [[ ${_eap} = "True" ]]; then
  	cp -R "${srcdir}/pycharm-${_buildver}/"* "${pkgdir}/opt/${pkgname}"
  else
  	cp -R "${srcdir}/pycharm-${_pkgver}/"* "${pkgdir}/opt/${pkgname}"
  fi
  if [[ $CARCH = 'i686' ]]; then
     rm -f "${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux64.so"
     rm -f "${pkgdir}/opt/${pkgname}/bin/fsnotifier64"
  fi
(
cat <<EOF
[Desktop Entry]
Version=$pkgver
Type=Application
Name=PyCharm-EAP
Exec="/opt/$pkgname/bin/pycharm.sh" %f
Icon=/opt/$pkgname/bin/pycharm.png
Comment=$pkgdesc
Categories=Development;IDE;
Terminal=false
StartupNotify=true
StartupWMClass=jetbrains-pycharm
EOF
) > "${srcdir}/${pkgname}.desktop"

  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
  if [[ ${_eap} = "True" ]]; then
  	install -Dm644 "${srcdir}/pycharm-${_buildver}/license/PyCharm_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/PyCharm_license.txt"
  else  
  	install -Dm644 "${srcdir}/pycharm-${_pkgver}/license/PyCharm_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/PyCharm_license.txt"
  fi
  ln -s "/opt/${pkgname}/bin/pycharm.sh" "${pkgdir}/usr/bin/pycharm-eap"
}

