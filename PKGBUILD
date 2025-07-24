# Maintainer: Hildigerr Vergaray <Maintainer at YmirSystems dot com>
# Contributor:Frederic Bezies <fredbezies at gmail dot com>
# Contributor: George Tokmaji <tokmajigeorge@gmail.com>
# Contributor: Benedict Etzel <developer@beheh.de>
# Contributor: Jonathan Steel <mail at jsteel dot org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Wesley <rudirennsau at hotmail dot com>
# Contributor: Lukas Werling <lukas.werling@gmail.com>

pkgname=openclonk-git
pkgrel=1
pkgver=9.0.alpha.r499
pkgdesc='Multiplayer-action-tactic-skill game'
arch=('i686' 'x86_64')
url='http://openclonk.org'
license=('custom')
depends=('freealut' 'miniupnpc' 'sdl2' 'qt5-base' 'hicolor-icon-theme' 'tinyxml' 'libepoxy' 'libvorbis')
makedepends=('cmake' 'boost' 'mesa' 'git')
provides=('openclonk')
conflicts=('clonk_rage' 'openclonk' 'openclonk-music')
source=("$pkgname::git+https://github.com/openclonk/openclonk#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # Extract version components from Version.txt
  local C4XVER1=$(grep "C4XVER1" Version.txt | awk '{print $2}'| tr -d '[:punct:]')
  local C4XVER2=$(grep "C4XVER2" Version.txt | awk '{print $2}'| tr -d '[:punct:]')
  local C4VERSIONEXTRA=$(grep "C4VERSIONEXTRA" Version.txt | awk '{print $2}' | tr -d '[:punct:]')

  # Get the number of commits since Version.txt was updated
  local last_version_commit=$(git log -1 --pretty=format:%H -- Version.txt)
  local commits_since_version=$(git rev-list --count ${last_version_commit}..HEAD)

  # Construct the pkgver
  if [[ "${C4VERSIONEXTRA}" == "FALSE" ]]; then
    printf "%s.%s.r%s" "${C4XVER1}" "${C4XVER2}" "${commits_since_version}"
  else
    printf "%s.%s.%s.r%s" "${C4XVER1}" "${C4XVER2}" "${C4VERSIONEXTRA}" "${commits_since_version}"
  fi
}

build() {
  cd ${pkgname}

  [[ -d build ]] && rm -rf build
  mkdir build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFREETYPE_INCLUDE_DIRS=/usr/include/freetype2

  make
}

package() {
  cd ${pkgname}/build
  make DESTDIR="$pkgdir" install
  cd ..

  mv "$pkgdir/usr/games/openclonk" "$pkgdir/usr/bin/openclonk"
  rmdir "$pkgdir/usr/games/"

  # replace the music packet with unpacked music to allow adding music
  rm -rf "$pkgdir/usr/share/openclonk/Music.ocg"
  install -Dm644 planet/Music.ocg/* -t "$pkgdir/usr/share/openclonk/Music.ocg"

  # licenses
  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 licenses/*.txt "$pkgdir"/usr/share/licenses/$pkgname
}

