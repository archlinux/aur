# Maintainer: kellyiscute <guo40020@gmail.com>

pkgname=atk-logic-bin
pkgver=1.1.2.2
pkgrel=1
pkgdesc='ALIENTEK ATK-Logic logic analyzer software (binary release)'
arch=('x86_64')
url='https://github.com/kellyiscute/atk-logic-bin'
license=('GPL-3.0-or-later')
depends=(
  'e2fsprogs'
  'expat'
  'fontconfig'
  'freetype2'
  'fribidi'
  'gcc-libs'
  'glibc'
  'harfbuzz'
  'libglvnd'
  'libgpg-error'
  'libthai'
  'libusb'
  'libx11'
  'libxcb'
  'zlib'
)
optdepends=('xorg-xwayland: required on Wayland sessions (the app is X11/xcb only)')
provides=('atk-logic')
conflicts=('atk-logic')
options=('!strip' '!debug')
source=("ATK-Logic_${pkgver}_amd64.deb::https://github.com/kellyiscute/atk-logic-bin/releases/download/v${pkgver}/ATK-Logic_${pkgver}_amd64.deb"
        'atk-logic.sh'
        'atk-logic.desktop')
sha256sums=('8353b5866a7bfdf41a7573b223057711c42ffeb791eca36d4fe739934f559954'
            '9f286523f2ccb840eff0ff1bcffed4008cce74ef87ced7e7074de9adfe47b619'
            'a54407d26432f29da8e26da219a3d088db8d17d386af61ab7f1a4e0318915780')

prepare() {
  rm -rf root
  mkdir root
  bsdtar -xf data.tar.xz -C root
}

package() {
  local _app="$pkgdir/opt/atk-logic"

  install -dm755 "$pkgdir/opt"
  cp -a root/opt/apps/atk-logic "$_app"

  # The deb ships many files as 0777; normalize, then restore exec bits
  find "$_app" -type d -exec chmod 755 {} +
  find "$_app" -type f -exec chmod 644 {} +
  find "$_app" -type f -name '*.so*' -exec chmod 755 {} +
  chmod 755 "$_app/ATK-Logic" "$_app/ATK-Logic.sh"

  install -Dm755 atk-logic.sh "$pkgdir/usr/bin/atk-logic"
  install -Dm644 atk-logic.desktop "$pkgdir/usr/share/applications/atk-logic.desktop"
  install -Dm644 root/usr/share/icons/ATK-Logic/logo.png "$pkgdir/usr/share/pixmaps/atk-logic.png"
  install -Dm644 root/usr/lib/udev/rules.d/99-atk-logic-usb.rules \
    "$pkgdir/usr/lib/udev/rules.d/99-atk-logic-usb.rules"
  install -Dm644 "$_app/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.bundled"
}
