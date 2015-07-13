# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=drumgizmo
pkgname=$_pkgname-git
pkgver=0.9.8.1.r22.ga611e1e
pkgrel=1
pkgdesc="an open source cross-platform drum plugin and stand-alone application (lv2)"
arch=('i686' 'x86_64')
url="http://www.drumgizmo.org"
license=('GPL')
groups=('lv2-plugins')
depends=('libsmf' 'jack' 'libao' 'qt4' 'zita-resampler')
makedepends=('git' 'cppunit')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+http://git.drumgizmo.org/drumgizmo.git"
        'hugin::git+http://git.oftal.dk/hugin.git')
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  #git config submodule.mysubmodule.url $srcdir/mysubmodule
  git config submodule.hugin.git.oftal.dk $srcdir/hugin
  git submodule update
  # hackish, but I don't want to clone hugin with every build
  #rmdir hugin
  #ln -sf "$srcdir/hugin" hugin
  ./autogen.sh
}

build() {
  cd "$_pkgname"
  ./configure --prefix=/usr \
              --enable-lv2 \
              --enable-cli \
              --enable-editor \
              --enable-static=no \
              --with-resample
  make
}

#check() {
#  cd "$_pkgname"
#  make check
#}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
