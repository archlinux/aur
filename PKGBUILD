# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

_pkgname=framework-control
pkgname=${_pkgname}-bin
pkgver=0.5.2
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
            'd82fec3b8ad076949f2636e1d74c894949d82023682f587ce827372c741be404'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')

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
