# Maintainer: 7k5x <7k5xlp0onfire@gmail.com>

ZOOMCONTEXT="/opt/zoom/platforminputcontexts"
pkgname=zoom-hangul
pkgver=5.7.6a
_build=31792.0820
pkgrel=1
pkgdesc="Zoom desktop client with Korean input patches"
arch=('x86_64')
license=('custom')
url="https://zoom.us/"
depends=('fontconfig' 'glib2' 'libpulse' 'libsm' 'ttf-font' 'libx11' 'libxtst' 'libxcb'
	'libxcomposite' 'libxfixes' 'libxi' 'libxcursor' 'libxkbcommon-x11' 'libxrandr'
	'libxrender' 'libxshmfence' 'libxslt' 'mesa' 'nss' 'xcb-util-image'
	'xcb-util-keysyms' 'dbus' 'ibus' 'nimf')
optdepends=('pulseaudio-alsa: audio via PulseAudio'
	'qt5-webengine: SSO login support'
	'picom: extra compositor needed by some window managers for screen sharing'
	'xcompmgr: extra compositor needed by some window managers for screen sharing')
provides=("zoom")
conflicts=("zoom")
options=(!strip)
source=("${pkgname}-${pkgver}_orig_x86_64.pkg.tar.xz"::"https://zoom.us/client/${pkgver:0:-2}${_build}/zoom_x86_64.pkg.tar.xz"
"libqt5im-nimf.so")
sha512sums=('7c34f2f1951a22391ced31960fedba4f1058abf55f1e530b1069bc9b2946f54cd3a12713135ab7ea0ae57131e2ce30521315ce4a67673f7f024cd23f6e03c4be'
'd79cdff1c43dc62c66f4a928d07ceae5d00533915df4ce2a44b3e3308f0d2a8a4d403933a2ef4edd455ee4ae840a67ae218a582690693bb5ae3ebe97f1a1441c')
post_install() {
  xdg-icon-resource forceupdate --theme hicolor &> /dev/null

  if [[ ! -d "$ZOOMCONTEXT" ]]; then
    mkdir -p "$ZOOMCONTEXT"
  fi

  if [[ -f "./libqt5im-nimf.so" ]]; then
    cp -f "./libqt5im-nimf.so" "$ZOOMCONTEXT/libqt5im-nimf.so"
    cp -f "$ZOOMCONTEXT/libqt5im-nimf.so" "$ZOOMCONTEXT/libnimfplatforminputcontextplugin.so"
  fi

  update-desktop-database -q
}
prepare() {
	sed -i 's/Zoom\.png/Zoom/g' "${srcdir}/usr/share/applications/Zoom.desktop"
	sed -i 's/StartupWMClass=Zoom/StartupWMClass=zoom/g' "${srcdir}/usr/share/applications/Zoom.desktop"
}

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
