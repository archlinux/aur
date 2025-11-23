# Maintainer: Frontier (frontier314 at gmail dot com)
# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
pkgname=visualfbeditor
pkgver=1.3.6
pkgrel=3
pkgdesc="VisualFBEditor FreeBASIC RAD IDE (with mff)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/XusinboyBekchanov/VisualFBEditor"
depends=('freebasic' 'gtk3')
provides=('visualfbeditor')
options=(staticlibs)
source=(
${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz
https://github.com/XusinboyBekchanov/MyFbFramework/archive/refs/tags/${pkgver}.tar.gz
)
sha256sums=('f2e332981be8841c0a0a342d7531d0be1205c84e2fd45bacb506c2a074ce5560'
            '0fd29216f03848b521fedda8ec38cdffeff9a41590eb759fbf6929445ad8fe98')

prepare() {
  mv MyFbFramework-${pkgver} MyFbFramework
  mv MyFbFramework VisualFBEditor-${pkgver}/Controls
}

build() {
echo "Compiling mff..."
cd "${srcdir}/VisualFBEditor-${pkgver}/Controls/MyFbFramework/mff"
fbc -b "mff.bi" -dll -x "../libmff_gtk3.so" -d __USE_GTK3__
echo "Compiling VisualFBEditor..."
cd "${srcdir}/VisualFBEditor-${pkgver}/src"
fbc "VisualFBEditor.bas" -x "../VisualFBEditor64_gtk3" -i "${srcdir}/VisualFBEditor-${pkgver}/Controls/MyFbFramework" -d __USE_GTK3__
}

package() {
install -d -m 0755 ${pkgdir}/opt/${pkgname}
cp -a ${srcdir}/VisualFBEditor-${pkgver}/* ${pkgdir}/opt/${pkgname}
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
