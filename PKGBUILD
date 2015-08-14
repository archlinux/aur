# Maintainer: Zach Callear <zach@callear.org>
# Original Maintainer: Mark Quinn <mmq.arch@dekinai.com>
pkgname=imgmin-git
pkgver=20150814
pkgrel=1
pkgdesc="Automated lossy JPEG optimization"
arch=('i686' 'x86_64')
url="https://github.com/rflynn/imgmin"
license=('MIT')
depends=('imagemagick')
makedepends=('git')

_gitroot=git://github.com/rflynn/imgmin.git
_gitname=imgmin

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

  # Fix a build problem with Apache module
  sed -i 's/\(MAGICK_CONFIG.*\?xargs\)/\1|sed "s\/-fopenmp\\s\/\/g"/' src/apache2/Makefile.am

  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE-MIT.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
