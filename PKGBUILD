# Maintainer: 910JQK <v910JQK@gmail.com>
_pkgname=subway-launcher
pkgname=$_pkgname-git
pkgver=r35.7edce43
pkgrel=2
pkgdesc='An HTML5-based application launcher for GNU/Linux with modern (metro) style.'
arch=('any')
url='https://github.com/SubwayDesktop/subway-launcher'
depends=('cubway-git' 'cubway-jslib-simplejs-git')
makedepends=('coreutils')
provides=('subway-launcher')
source=('subway-launcher::git+https://github.com/SubwayDesktop/subway-launcher.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -m755 -d "${pkgdir}/opt/Subway/launcher"
	install -m644 back_arrow.svg launcher.js main.html style.css "${pkgdir}/opt/Subway/launcher/"
	install -m755 -d "${pkgdir}/usr/bin"
	install -m755 -d "${pkgdir}/usr/share/applications"
	cat << EOF > "${pkgdir}/usr/bin/subway-launcher"
#!/bin/sh
if (dbus-send --session       \
  --dest=org.freedesktop.DBus \
  --type=method_call          \
  --print-reply               \
  /org/freedesktop/DBus       \
  org.freedesktop.DBus.ListNames \
  | grep 'org.subwaydesktop.launcher' > /dev/null );
then
  dbus-send --session \
  --dest=org.subwaydesktop.launcher \
  --type=method_call \
  /view org.subwaydesktop.cubway.toggleVisible
  dbus-send --session \
  --dest=org.subwaydesktop.launcher \
  --type=method_call \
  /view org.subwaydesktop.cubway.activateWindow
else
  /opt/Subway/Cubway/cubway /opt/Subway/launcher/main.html
fi
EOF
	chmod 755 "${pkgdir}/usr/bin/subway-launcher"
	cat << EOF > "${pkgdir}/usr/share/applications/subway-launcher.desktop"
[Desktop Entry]
Version=0.01
Encoding=UTF-8
Name=Subway Launcher
Comment=MS Modern Style Launcher
Exec=subway-launcher
Icon=applications-other
Categories=Application;Utility
EOF
	chmod 644 "${pkgdir}/usr/share/applications/subway-launcher.desktop"
}
