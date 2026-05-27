# Maintainer: Subhamoy Biswas <hey@neosubhamoy.com>
pkgname=neodlp
pkgver=0.4.5
pkgrel=1
pkgdesc="Modern video/audio downloader based on yt-dlp with browser integration"
arch=('x86_64' 'aarch64')
url="https://github.com/neosubhamoy/neodlp"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'ffmpeg' 'deno' 'aria2')
makedepends=('curl' 'jq')
provides=('yt-dlp')
conflicts=('yt-dlp')
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
  rm -rf "${pkgdir}/usr/bin/deno"
}

source_x86_64=("NeoDLP_${pkgver}_amd64.deb::${url}/releases/download/v$pkgver/NeoDLP_${pkgver}_amd64.deb")
sha256sums_x86_64=('a187630c9d7b9a15d5a22c3fcc807fe5eb15f7a144366971bbc05d2eebc29406')
source_aarch64=("NeoDLP_${pkgver}_arm64.deb::${url}/releases/download/v$pkgver/NeoDLP_${pkgver}_arm64.deb")
sha256sums_aarch64=('e78a567c6788fa3f3a8ed8c32f0b9dc93a4ed5d13acc1a5fd274ce959467806a')