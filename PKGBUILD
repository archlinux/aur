# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=blender-plugin-blendrig-git
pkgver=5.0.0
pkgrel=1
pkgdesc="BlenRig rigging system for Blender"
url="https://cloud.blender.org/p/blenrig/"
license=("AGPL")
arch=('any')
depends=('blender')
groups=('blender')
makedepends=('unzip')
source=()
noextract=()
options=()
backup=()
md5sums=()

_gitroot="https://gitlab.com/jpbouza/BlenRig.git"
_gitname="BlenRig"


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

}


package() {
  	cd "$srcdir/$_gitname-build"
	pwd
    addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons/"
    if [ ! -d "$addons" ]; then
        mkdir -p "$addons"
    fi
	[ -d "${addons}${_gitname}" ] || mkdir "${addons}${_gitname}"
	cp -r "$srcdir/$_gitname-build/"* "${addons}${_gitname}"
}

