# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=flacsync-git
pkgver=0.3.2.r4.gfe95e74
pkgver() {
  cd "$srcdir/$_gitname-build"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="Recursively mirror a directory tree of FLAC audio files to AAC/OGG"
url="https://github.com/cmcginty/flacsync"
arch=('any')
license=('GPL')
depends=('python2' 'python-imaging' 'mutagen' 'flac')
makedepends=('git' 'python2-distribute')
optdepends=('neroaacenc: AAC encoding'
            'neroaactag: AAC tagging'
            'vorbis-tools: OGG Vorbis encoding and tagging'
            'lame: MP3 encoding'
)
provides=('flacsync')
conflicts=('flacsync')

_gitroot=https://github.com/cmcginty/flacsync.git
_gitname=flacsync

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
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

