# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname='gladstone-drizztbsd-git'
pkgver=20111104
pkgrel=1
pkgdesc='educational ITU-T G729 compliant codec with a GStreamer plugin - Git Version (drizztbsd fork)'
url='http://code.google.com/p/gladstone'
arch=('i686' 'x86_64')
license=('LGPL' 'MIT')
depends=(gstreamer0.10)
options=(!libtool)
source=('T-REC-G.729-200701-I!!SOFT-ZST-E.zip::http://www.itu.int/rec/dologin_pub.asp?lang=e&id=T-REC-G.729-200701-I!!SOFT-ZST-E')
sha256sums=('9555544399d5594b61e9d6e01bd3f3faab013815741536f64f590f6fa5099a2a')

_gitroot='https://github.com/drizztbsd/gladstone.git'
_gitname='gladstone'

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

  autoreconf -i
  ./configure --prefix=/usr --with-refcode-prefix="$srcdir/Soft/g729AnnexB/c_codeBA"
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
