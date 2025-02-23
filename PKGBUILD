# Maintainer: Jai-JAP <jai dot jap dot 318 at gmail dot com>
pkgname=keymapper-bin
pkgver=4.10.2
pkgrel=1
pkgdesc="A cross-platform context-aware keyremapper"
arch=(x86_64 aarch64)
url=https://github.com/houmain/keymapper
conflicts=(keymapper)
provides=(keymapper)
license=("GPL-3.0-or-later")
depends=(dbus gcc-libs libayatana-appindicator libappindicator-gtk3 libusb libx11 libxkbcommon wayland)

source=(autostart.desktop)
sha256sums=('b3312492e497b5976501a42445b70309183811da545257742f7b99364cdca402')

source_x86_64=(${pkgname%-bin}-amd64.tgz::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-Linux-x86_64.tar.gz)
sha256sums_x86_64=('e3c11a2f84b0708acac87a5a9323ecc60c86c5835730e42b46eee5254258be9f')

source_aarch64=(${pkgname%-bin}-arm64.tgz::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-Linux-arm64.tar.gz)
sha256sums_aarch64=('aebfdc285df68dbaa2147058b7e4de84e396fbc76f9ee9c8c0c11583661c3e58')

_arch=${CARCH/aarch64/arm64}

prepare() {
  # Taken from keymapper aur script <https://aur.archlinux.org/packages/keymapper>
  sed -i 's|^ExecStart=keymapperd|ExecStart=/usr/bin/keymapperd|' \
    ${pkgname%-bin}-${pkgver}-Linux-${_arch}/lib/systemd/system/keymapperd.service
}

package() {
  mkdir -p ${pkgdir}/usr 
  install -Dm644 ${srcdir}/autostart.desktop ${pkgdir}/etc/xdg/autostart/${pkgname%-bin}.desktop
  for dir in bin lib share; do
    cp -r ${pkgname%-bin}-${pkgver}-Linux-${_arch}/${dir} ${pkgdir}/usr/
  done
}
