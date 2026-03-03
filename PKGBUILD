# Maintainer: Subhamoy Biswas <hey@neosubhamoy.com>
pkgname=neodlp
pkgver=0.4.2
pkgrel=1
pkgdesc="Modern video/audio downloader based on yt-dlp with browser integration"
arch=('x86_64' 'aarch64')
url="https://github.com/neosubhamoy/neodlp"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'ffmpeg')
makedepends=('curl' 'jq')
options=('!strip' '!emptydirs')
install=${pkgname}.install

pkgver() {
  # Get the latest release info using GitHub API
  local latest_tag=$(curl -s "https://api.github.com/repos/neosubhamoy/neodlp/releases/latest" | jq -r '.tag_name')
  
  # Extract version number from tag (remove the leading 'v' and any suffix after '-')
  # This will work with formats like v0.1.0, v0.1.0-beta, v1.0.0-stable, etc.
  echo "$latest_tag" | sed -E 's/^v([0-9]+\.[0-9]+\.[0-9]+)(-.*)?$/\1/'
}

prepare() {
  cd "$srcdir"
  mkdir -p extracted
  
  # Extract the appropriate .deb file based on architecture
  case "$CARCH" in
    x86_64)
      ar x "NeoDLP_${pkgver}_amd64.deb"
      ;;
    aarch64)
      ar x "NeoDLP_${pkgver}_arm64.deb"
      ;;
  esac
}

package() {
  tar -xf "$srcdir/data.tar.gz" -C "${pkgdir}"
}

source_x86_64=("NeoDLP_${pkgver}_amd64.deb::${url}/releases/download/v$pkgver/NeoDLP_${pkgver}_amd64.deb")
sha256sums_x86_64=('42661311eab05a6a02f79cc1a488894cc44676a904104901f5bc8fd4c812a6dd')
source_aarch64=("NeoDLP_${pkgver}_arm64.deb::${url}/releases/download/v$pkgver/NeoDLP_${pkgver}_arm64.deb")
sha256sums_aarch64=('e87d16af98402d352dd764688b7ac1f3ee5c8cfdd6e0447525450863f9363968')