# Maintainer: Frontier (frontier314 at gmail dot com)

pkgname=visualfbeditor
pkgver=1.3.6
pkgrel=2
pkgdesc="VisualFBEditor FreeBASIC RAD IDE (with mff)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/XusinboyBekchanov/VisualFBEditor"
depends=('freebasic' 'gtk3')
provides=('visualfbeditor')
options=(staticlibs)

prepare() {
echo "Fetching Sources..."
cd "${srcdir}"
git clone https://github.com/XusinboyBekchanov/VisualFBEditor.git
cd "${srcdir}"/VisualFBEditor/Controls
git clone https://github.com/XusinboyBekchanov/MyFbFramework.git
}

build() {
echo "Compiling mff..."
cd "${srcdir}/VisualFBEditor/Controls/MyFbFramework/mff"
fbc -b "mff.bi" -dll -x "../libmff_gtk3.so" -d __USE_GTK3__
echo "Compiling VisualFBEditor..."
cd "${srcdir}/VisualFBEditor/src"
fbc "VisualFBEditor.bas" -x "../VisualFBEditor64_gtk3" -i "${srcdir}/VisualFBEditor/Controls/MyFbFramework" -d __USE_GTK3__
}

package() {
install -d -m 0755 ${pkgdir}/opt/${pkgname}
cp -a ${srcdir}/VisualFBEditor/* ${pkgdir}/opt/${pkgname}
cat > ${pkgname}.desktop << EoF
[Desktop Entry]
Version=${pkgver}
Encoding=UTF-8
Name=Visual FB Editor
Comment=${pkgdesc}
Exec=env GTK_THEME=Adwaita:dark /opt/${pkgname}/VisualFBEditor64_gtk3
Path=/opt/${pkgname}
Icon=/opt/${pkgname}/Resources/VisualFBEditor.ico
Terminal=false
Type=Application
Categories=Basic;Development;
EoF

install -D -m 0644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
