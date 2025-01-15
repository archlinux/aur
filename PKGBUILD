# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=sonix-flasher-git
_name=${pkgname%-git}
pkgver=v0.2.5.r8.g7ded3d4
pkgrel=2
pkgdesc="Sonix Keyboard Flasher"
arch=('any')
url="https://github.com/SonixQMK/sonix-flasher"
license=('unknown')
depends=('python-altgraph'
         'python-fbs'
         'python-hidapi'
         'python-macholib'
         'python-pefile'
         'python-pyqt5'
         'python-pyqt5-sip'
         'hicolor-icon-theme')
makedepends=('git')
source=("sonix-flasher.sh"
        "sonix-flasher.desktop"
        "0001-fix-Wayland-taskbar-icon.patch"
        "sonix-flasher::git+https://github.com/SonixQMK/sonix-flasher")
provides=("sonix-flasher")
conflicts=("sonix-flasher")
sha256sums=('68d7641d8a903b9044ceb5bd38f71080f3e3b5c88312f3cd16a2fe4fb9c45077'
            'c31cb3ae4cf5e8cdd211733bc4adb6d1add4330704f2fa0b654eb1844dc78487'
            '92ece2e245e5077145d3e620b10b6cfce203eb89f02ed379a8f5363e0f5c92a1'
            'SKIP')

pkgver() {
  cd "$_name"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_name"
  patch --forward --strip=1 --input="${srcdir}/0001-fix-Wayland-taskbar-icon.patch"
}

package() {
  cd "${_name}"
  
  # copy entire project
  find src -type f -exec install -Dm644 {} ${pkgdir}/usr/share/${_name}/{} \;

  # wrapper
  install -Dm755 ${srcdir}/${_name}.sh "${pkgdir}/usr/bin/${_name}"

  # desktop entry
  install -Dm644 ${srcdir}/${_name}.desktop -t ${pkgdir}/usr/share/applications

  # icons
  for _icon in 16 24 32 48 64
  do
    install -Dm644 src/main/icons/base/${_icon}.png \
                  ${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${_name}.png
  done

  for _icon in 128 256 512 1024
  do
    install -Dm644 src/main/icons/linux/${_icon}.png \
                  ${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${_name}.png
  done

  # install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim: ts=2 sw=2 et:
