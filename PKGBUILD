# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=alto
pkgver=0.10.0
pkgrel=1
pkgdesc="GUI file synchronization client that can sync with any cloud provider"
arch=('x86_64')
url="https://github.com/hwittenborn/${pkgname}"
license=('GPL-3.0-or-later')
conflicts=('celeste')
depends=(
  'libadwaita'
  'alsa-lib'
  'nss'
  'nspr'
  'mesa'
  'libgcc'
  'expat'
  'libxcb'
  'pango'
  'hicolor-icon-theme'
  'libxext'
  'libxrandr'
  'systemd-libs'
  'libxdamage'
  'glib2'
  'libxfixes'
  'libxcomposite'
  'gtk3'
  'at-spi2-core'
  'libx11'
  'dbus'
  'libxkbcommon'
  'glibc'
  'cairo'
  'libcups'
)
makedepends=(
  'npm'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bb508d7289e9e9da1ebdeb1ea69ffb8863e11ef630041b8e1cf3e61c07e33bbd')

_get_arch() {
  local given_arch="$1"
  
  case "$given_arch" in
    x86_64)
      echo "x64"
      ;;
    *)
      echo "$given_arch"
      ;;
  esac
}

build() {
  cd "$pkgname-$pkgver"
  npm install
}

check() {
  cd "$pkgname-$pkgver"
  npm run test
}

package() {
  cd "$pkgname-$pkgver"
  npm run package

  local short_arch=$(_get_arch "${arch}")

  install -d "${pkgdir}/usr/lib/${pkgname}"
  cp -r "out/Alto-linux-${short_arch}/." "${pkgdir}/usr/lib/${pkgname}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -d "${pkgdir}/usr/share/applications"
  install -Dm755 "assets/linux/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

  for size in 16 32 48 64 128 256 512; do
    local icon_folder="icons/hicolor/${size}x${size}"
    install -Dm644 "assets/${icon_folder}/com.hunterwittenborn.Alto.png" "${pkgdir}/usr/share/${icon_folder}/apps/${pkgname}.png"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

