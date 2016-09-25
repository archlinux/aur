# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=drumgizmo
pkgname=$_pkgname-git
pkgver=0.9.10.r240.g736e4e7
pkgrel=1
pkgdesc="an open source cross-platform drum plugin and stand-alone application (lv2)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.drumgizmo.org"
license=('GPL')
groups=('lv2-plugins')
depends=('libx11' 'jack' 'libsmf' 'expat' 'zita-resampler')
makedepends=('git' 'lv2' 'alsa-utils')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+http://git.drumgizmo.org/drumgizmo.git"
        'plugingizmo::git+http://git.drumgizmo.org/plugingizmo.git'
        'lodepng::git+https://github.com/lvandeve/lodepng'
        'hugin::git+http://git.oftal.dk/hugin.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.hugin.git.oftal.dk "$srcdir/hugin"
  git config submodule.plugingizmo.git.drumgizmo.org "$srcdir/plugin/plugingizmo"
  git config submodule.lodepng.git.lodev.org "$srcdir/plugingui/lodepng"
  git submodule update
  ./autogen.sh
}

build() {
  cd "$_pkgname"
  ./configure --prefix=/usr \
              --enable-lv2
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
