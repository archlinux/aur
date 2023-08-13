# Maintainer: simpleclips <jsquid128 (at) gmail (dot) com>
pkgbase=snes9x-rr
pkgname=(snes9x-rr snes9x-rr-gtk)
pkgver=1.60
pkgrel=1
pkgdesc="Port of the Snes9x emulator with Lua support (rerecording version)"
arch=(x86_64)
url=http://www.snes9x.com/
license=('custom')
makedepends=(alsa-lib cairo gdk-pixbuf2 glib2
  gtk3 intltool libepoxy libpng libpulse libx11 libxext libxml2
  libxrandr libxv lua51 meson minizip nasm portaudio sdl2 zlib gtkmm3
)
source=(
  https://github.com/gocha/snes9x-rr/archive/refs/tags/1.60.tar.gz
  snes9x-rr-gtk.desktop
  0001-Fixing-a-small-bug-with-newer-g-and-forward-decalara.patch
  0002-Fixing-some-compile-breaks-with-newer-g.patch
  0003-Define-MAX_PATH-for-linux-improperly-but-working.patch
  0004-Implement-Lua-support-for-Linux-in-GTK-UI.patch
  0005-Fixed-a-compile-error-on-g-regarding-const-compariso.patch
)
sha256sums=(
  '490a52c29d31569f9582f6c4a2b8c7f3423206e6ea74b024ae3f2bceb95303c8'
  '5a0bb0754c97a54c138b02ed4e7ff20e364c1d56d5e1df436671416fc3fe5245'
  '18f34c6c2aa31cf98da62d140cea955e421eccd56fad0c71c12f59ee669ecccb'
  'cbd09efe50707f7d082cdbfd5389342b3279c758ade174b9cf36b98c7a3cc1a5'
  '128e28c1add13f7395b20394842f41fc0b608fd5f1f91f3ed0c4481064be682b'
  '8a65487cb346971a029ba0398ae19f4e0bc7fc9e1821327a5fd90df8cccfa6b9'
  '832ca85d3e0d4466a9bc1d9012998923afdb2dfdbd20150e85466c968f746b47'
)

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  patch -p1 < "${srcdir}/0001-Fixing-a-small-bug-with-newer-g-and-forward-decalara.patch"
  patch -p1 < "${srcdir}/0002-Fixing-some-compile-breaks-with-newer-g.patch"
  patch -p1 < "${srcdir}/0003-Define-MAX_PATH-for-linux-improperly-but-working.patch"
  patch -p1 < "${srcdir}/0004-Implement-Lua-support-for-Linux-in-GTK-UI.patch"
  patch -p1 < "${srcdir}/0005-Fixed-a-compile-error-on-g-regarding-const-compariso.patch"

  cd unix
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}/unix"

  ./configure \
    --prefix='/usr' \
    --enable-netplay
  make

  meson setup --prefix /usr "${srcdir}/${pkgbase}-${pkgver}"/gtk "${srcdir}/${pkgbase}-${pkgver}"/build
  cd "${srcdir}/${pkgbase}-${pkgver}"/build
  meson compile
}

package_snes9x-rr() {
  pkgdesc="Portable Emulator for the Super Nintendo Entertainment System"
  depends=(alsa-lib libpng libx11 libxext libxinerama libxv minizip zlib)

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -D -m755 unix/snes9x -T "${pkgdir}"/usr/bin/snes9x-rr
  install -D -m644 {unix/snes9x.conf.default,docs/{control-inputs,controls,snapshots}.txt} -t \
    "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm644  LICENSE -t \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"
}

package_snes9x-rr-gtk() {
  pkgdesc="Portable Emulator for the Super Nintendo Entertainment System with Lua support - GTK version"
  depends=(alsa-lib cairo gdk-pixbuf2 glib2 gtk3 gtkmm3 hicolor-icon-theme libepoxy libpng libpulse libx11 libxext libxml2 libxrandr libxv lua51 minizip portaudio sdl2 zlib)

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -D -m755 build/snes9x-gtk -T "${pkgdir}"/usr/bin/snes9x-rr-gtk
  install -Dm644 {unix/snes9x.conf.default,docs/{control-inputs,controls,snapshots}.txt} -t \
    "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 data/cheats.bml -t "${pkgdir}/usr/share/${pkgbase}/"
  install -vDm644 LICENSE -t \
    "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm644 "${srcdir}"/snes9x-rr-gtk.desktop -t "${pkgdir}"/usr/share/applications
  cd gtk/data
  install -Dm644 snes9x_16x16.png -T "${pkgdir}"/usr/share/icons/hicolor/16x16/apps/snes9x-rr.png
  install -Dm644 snes9x_24x24.png -T "${pkgdir}"/usr/share/icons/hicolor/24x24/apps/snes9x-rr.png
  install -Dm644 snes9x_32x32.png -T "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/snes9x-rr.png
  install -Dm644 snes9x_64x64.png -T "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/snes9x-rr.png
  install -Dm644 snes9x_128x128.png -T "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/snes9x-rr.png
  install -Dm644 snes9x_256x256.png -T "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/snes9x-rr.png
  install -Dm644 snes9x.svg -T "${pkgdir}"/usr/share/icons/scalable/apps/snes9x-rr.svg
}

# vim: ts=2 sw=2 et:
