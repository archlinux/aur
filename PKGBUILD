# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

_pkgname=framework-control
pkgname=${_pkgname}-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Tool for Framework Laptop features (Fan, Battery, LEDs) - Precompiled Binary"
arch=('x86_64')
url="https://github.com/ozturkkl/framework-control"
install=framework-control.install
license=('MIT')
depends=('framework-system' 'xdg-utils' 'hicolor-icon-theme')
source=("framework-control.png" 
        "https://github.com/ozturkkl/framework-control/releases/download/${pkgver}/${_pkgname}-service-${CARCH}.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/ozturkkl/framework-control/master/LICENSE")
sha256sums=('16c69209b6549b0f284874e5488d798c1f99b64c39cd08674c02cd323459abda'
            'f5c220890f89d8b87b5e3af54c939398c03ed20c3c43df8e891347e88685f9f6'
            '18638616a47c48cd56035316719c8ec29b1f4808dc293625cfc0e03d5b8500b0')

prepare() {
  cd "$srcdir"
  # Patch the service file to use the /usr/bin for binary location
  sed -i 's|/usr/local/bin/|/usr/bin/|g' framework-control.service
}

package() {
  cd "$srcdir"

  # create necessary dirs
  install -d "${pkgdir}/usr/bin" \
             "${pkgdir}/usr/lib/systemd/system" \
             "${pkgdir}/usr/share/applications" \
             "${pkgdir}/usr/share/icons/hicolor/512x512/apps" \
             "${pkgdir}/usr/share/licenses/${_pkgname}"

  # install binary and systemd unit
  install -m755 ${_pkgname} -t "${pkgdir}/usr/bin/"
  install -m644 ${_pkgname}.service -t "${pkgdir}/usr/lib/systemd/system/"

  # install the icon
  install -m644 ${_pkgname}.png -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"  

  # install license
  install -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"

  # create and install the desktop shortcut to open the framework tool in the default browser
  cat <<EOF > "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Name=Framework Control
Comment=Configure Framework Laptop battery, fans, and LEDs
Exec=xdg-open http://127.0.0.1:30912
Icon=framework-control
Terminal=false
Type=Application
Categories=Settings;System;
EOF
}
