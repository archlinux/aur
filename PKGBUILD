# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
pkgname=synthpod-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight non-linear plugin host"
arch=('i686' 'x86_64')
url="http://open-music-kontrollers.ch/lv2/synthpod"
license=('Artistic2.0')
groups=('lv2-plugins' 'lv2-hosts')
depends=('lilv' 'jack' 'zita-alsa-pcmi' 'elementary' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'lv2' 'xdg-utils')
optdepends=('moony-lv2' 'sherlock-lv2')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=synthpod.install
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="https://github.com/OpenMusicKontrollers/synthpod.git"
_gitname="master"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
		-DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_JACK=1 \
    -DBUILD_ALSA=1 \
		.
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
