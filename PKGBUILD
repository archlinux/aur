# Maintainer: ilonachan < n a g a t o _ i l o n a at p r o t o n dot m e >

pkgname=appimagelauncher-continuous-bin
_pkgname=appimagelauncher
pkgver=3.0.0_beta_2_gha298.4daf93f
pkgrel=1
pkgdesc="Helper app that 'makes your Linux desktop AppImage ready™.' - continuous snapshot version"
arch=('x86_64')
license=('MIT')
url="https://github.com/TheAssassin/AppImageLauncher/releases/tag/continuous"
provides=("${_pkgname%}")
conflicts=("${_pkgname%}")
depends=('cairo' 'desktop-file-utils' 'hicolor-icon-theme' 'libappimage' 'libbsd' 'libxpm' 'qt5-base' 'shared-mime-info')
makedepends=('curl')

# this becomes out-of-date too often to be acceptable as a static value, but works as a fallback if fetching isn't possible
_download_url="https://github.com/TheAssassin/AppImageLauncher/releases/download/continuous/appimagelauncher_${pkgver//_/-}_amd64.deb"

_get_current_url() {
  CONTINUOUS_DOWNLOAD_URL=$(curl -sL -H 'Accept: application/vnd.github+json' -H 'X-GitHub-Api-Version: 2026-03-10' https://api.github.com/repos/TheAssassin/AppImageLauncher/releases/tags/continuous | jq -er '.assets[] | select(.name|endswith("_amd64.deb")) | .browser_download_url')
  API_RETURN=$?
  case $API_RETURN in
  0) _download_url=$CONTINUOUS_DOWNLOAD_URL ;;
  *) return $API_RETURN ;; # we have to ignore it
  esac
}

_get_current_url 2>/dev/null

source=("$_download_url")
sha256sums=('SKIP')

pkgver() {
  if ! _get_current_url; then
    echo "Failed to obtain information about the latest file version from GitHub. Using hardcoded version as fallback." >&2
    echo $pkgver
    return 0
  fi

  FILENAME="${_download_url##*/}"
  FILENAME_="${FILENAME#appimagelauncher_}"
  FILE_VERSION="${FILENAME_%_amd64.deb}"

  echo "${FILE_VERSION//-/_}"
}

package() {
  cd "$srcdir/"
  tar xaf data.tar.xz -C $pkgdir
  cd $pkgdir/usr/share/applications
}
