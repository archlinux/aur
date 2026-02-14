# Maintainer: h4us0x <95170448+h4us0x@users.noreply.github.com>
pkgname=ryzenadj-control
pkgver=0.1.1
pkgrel=1
pkgdesc="PyQt6 GUI for ryzenadj"
arch=('x86_64')
url="https://github.com/h4us0x/ryzenadj-control"
license=('MIT')
depends=('python' 'python-pyqt6' 'ryzenadj' 'polkit')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b28bea78994abc2d766426becefd47a573a401ae76453e59877d158f8418fd05')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  /usr/bin/python3 -m compileall .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/lib/${pkgname}"
  cp -r main.py ui core resources README.md LICENSE \
    "${pkgdir}/usr/lib/${pkgname}/"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/usr/bin/env bash
exec /usr/bin/python3 /usr/lib/${pkgname}/main.py "\$@"
EOF

  install -Dm644 resources/icons/logo-taskbar.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=RyzenAdj Control
Comment=GUI for managing Ryzen CPU settings via ryzenadj
Exec=${pkgname}
Icon=${pkgname}
Terminal=false
Categories=System;Settings;
StartupNotify=true
EOF
}
