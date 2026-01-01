# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Archeb <archebasic@hotmail.com>

pkgname=opentrace-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="A cross-platform GUI wrapper for NextTrace. Bringing you the familiar traceroute experience."
arch=('x86_64' 'aarch64')
url="https://github.com/Archeb/opentrace"
license=('GPL3')
options=('!debug')
depends=('nexttrace' 'webkit2gtk')

provides=('opentrace')
conflicts=('opentrace')
source=(
        "opentrace.desktop::https://raw.githubusercontent.com/Archeb/opentrace/master/opentrace.desktop"
        "logo.png::https://raw.githubusercontent.com/nxtrace/Ntrace-core/main/assets/logo.png"
)
sha256sums=('69f8c4799f6db03bf17cd78b1de7a18d939ec5e282190942172dbe13e39c2075'
            '93cf17802f2691d63e29a7020afb0c7c39782c85212ce4b795cc8486f36c758d')
sha256sums_x86_64=('acfc08a3285218444d1ed9d127de699b5666118a666059990bb131d6dfaa6104')
sha256sums_aarch64=('acfc08a3285218444d1ed9d127de699b5666118a666059990bb131d6dfaa6104')
source_x86_64=("$pkgname-$pkgver::https://github.com/Archeb/opentrace/releases/download/v$pkgver/linux-x64.tar.gz")
source_aarch64=("$pkgname-$pkgver::https://github.com/Archeb/opentrace/releases/download/v$pkgver/linux-arm64.tar.gz")

latestver() {
  # Fetch latest version from GitHub API
  curl -s "https://api.github.com/repos/Archeb/opentrace/releases/latest" | jq -r '.tag_name' | sed 's/^v//'
}

package() {
  # Create target directory
  install -dm755 "${pkgdir}/opt/${pkgname}"
  
  # Copy files
  cp -r "${srcdir}"/* "${pkgdir}/opt/${pkgname}"

  # Remove bundled NextTrace to use system dependency
  rm -f "${pkgdir}/opt/${pkgname}/nexttrace"

  # Create binary symlink
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/OpenTrace" "${pkgdir}/usr/bin/opentrace"
  
  # Install desktop file and icon
  install -Dm644 "opentrace.desktop" "${pkgdir}/usr/share/applications/opentrace.desktop"
  install -Dm644 "logo.png" "${pkgdir}/usr/share/pixmaps/opentrace.png"
}
