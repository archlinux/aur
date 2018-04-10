# Maintainer: Michael J. Pento <mjpento@verizon.net>
# Maintainer: mkzero <me [at] linux-web-development [dot] de>
pkgname=yakyak-git
pkgver=v1.2.0.r910.g9c3c471
pkgrel=1
pkgdesc="Desktop client for Google Hangouts"
arch=('x86_64' 'i686')
url="https://github.com/yakyak/yakyak"
license=('MIT')
makedepends=('unzip' 'nodejs' 'npm')
depends=('libgcrypt15' 'libnotify' 'gconf' 'alsa-lib' 'nss' 'libxtst' 'gtk2' 'libgnome-keyring' 'git' 'icu')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

_electron_version=1.4.10
_platform=ia32
[[ $CARCH == 'x86_64' ]] && _arch='x64' || _arch='ia32'

source=("${pkgname%-git}::git+https://github.com/yakyak/yakyak#branch=master"
        "yakyak.desktop")
source_i686=("https://github.com/atom/electron/releases/download/v${_electron_version}/electron-v${_electron_version}-linux-ia32.zip")
source_x86_64=("https://github.com/atom/electron/releases/download/v${_electron_version}/electron-v${_electron_version}-linux-x64.zip")

sha256sums=('SKIP'
            'ba537052daca0bacd1f957792c24150eade47bba296423a7a7d48e92f3946587')
sha256sums_x86_64=('ce6bf2fa183a5f3bae6bac2bd3d48cbbfa289a2dad45282dedd1a27731f4b564')
sha256sums_i686=('192c4602198eb94e8d0b2b8188af90222131d8d1f9d9155b341ae5722f9202a3')

noextract=("electron-v${_electron_version}-linux-${_arch}.zip")

pkgver() {
  cd "$srcdir/yakyak"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  unzip "electron-v${_electron_version}-linux-${_arch}.zip" -d "${srcdir}/electron-${_electron_version}"
  mv "${srcdir}/electron-${_electron_version}/electron" "${srcdir}/electron-${_electron_version}/yakyak"
}

build() {
  cd "${srcdir}/yakyak"
  npm install
  npm run gulp

  cp -a "${srcdir}/yakyak/app" "${srcdir}/electron-${_electron_version}/resources/"
}

package() {
  install -dm755 "${pkgdir}/usr/share/"
  cp -R "${srcdir}/electron-${_electron_version}" "${pkgdir}/tmp"
  mv "${pkgdir}/tmp" "${pkgdir}/usr/share/${pkgname}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/yakyak" "${pkgdir}/usr/bin/${pkgname%-git}"

  install -Dm644 "${srcdir}/yakyak.desktop" "${pkgdir}/usr/share/applications/yakyak.desktop"
  install -Dm644 "${srcdir}/yakyak/src/icons/icon_256.png" "${pkgdir}/usr/share/pixmaps/yakyak.png"
}
