# Maintainer: c0des1ayr <rplatinumedition+git@gmail.com>
# Contributor: Subhamoy Biswas <hey@neosubhamoy.com>
pkgname=neodlp-arch-libs
pkgver=0.4.3
pkgrel=1
pkgdesc="Modern video/audio downloader based on yt-dlp with browser integration. Modified to use external aria2c, deno and yt-dlp."
arch=('x86_64' 'aarch64')
url="https://github.com/neosubhamoy/neodlp"
license=('MIT')
depends=('aria2' 'deno' 'yt-dlp' 'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'ffmpeg')
makedepends=('curl' 'jq')
conflicts=('neodlp')
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
  rm -rf "${pkgdir}/usr/bin/aria2c"
  rm -rf "${pkgdir}/usr/bin/deno"
  rm -rf "${pkgdir}/usr/bin/yt-dlp"
}

source_x86_64=("NeoDLP_${pkgver}_amd64.deb::${url}/releases/download/v$pkgver/NeoDLP_${pkgver}_amd64.deb")
sha256sums_x86_64=('c2953097dd87ca19acefd2bbc54ff59e395fd9df6b1329cb8375c9e2e9e05bac')
source_aarch64=("NeoDLP_${pkgver}_arm64.deb::${url}/releases/download/v$pkgver/NeoDLP_${pkgver}_arm64.deb")
sha256sums_aarch64=('b12d5ca362482cdf4e7fab90ea8f89f227a45bf6c01d78bc5c70d3a6cd3d83a1')