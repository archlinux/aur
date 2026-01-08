# Maintainer:Saeed  Badrelden <helwanlinux@gmail.com>
pkgname=hel-web-server
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple web server utility for Helwan Linux, supporting various server types like Django and Flask."
arch=('any')
url="https://github.com/helwan-linux/helwan-server"
license=('GPL')
depends=('python' 'python-pyqt5' 'python-setuptools' 'desktop-file-utils')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/helwan-linux/helwan-server/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/helwan-server-main"
}

package() {
  cd "${srcdir}/helwan-server-main"

  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/${pkgname}/"
  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"

  # نسخ ملفات المشروع
  cp -r hel-web-server/* "${pkgdir}/usr/share/${pkgname}/"

  # سكربت التشغيل
  cat << EOF > "${pkgdir}/usr/bin/${pkgname}"
#!/bin/bash
python /usr/share/${pkgname}/hel_web_server.py "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/${pkgname}"

  # أيقونة
  install -m644 hel-web-server/gui/resources/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"

  # ملف .desktop
  cat << EOF > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
[Desktop Entry]
Name=Hel-Web-Server
Comment=A local web server for development and project hosting.
Exec=/usr/bin/${pkgname}
Icon=${pkgname}
Terminal=false
Type=Application
Categories=Development;Network;WebDevelopment;
StartupNotify=true
Keywords=web;server;http;development;hosting;linux;helwan;
EOF

  # تحديث كاش الأيقونات
  gtk-update-icon-cache -q /usr/share/icons/hicolor || true
}

