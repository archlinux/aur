# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=drumgizmo
pkgname=$_pkgname-git
pkgver=0.9.14.r17.ge3e60b5
pkgrel=2
pkgdesc="an open source cross-platform drum plugin and stand-alone application (lv2)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.drumgizmo.org"
license=('GPL')
groups=('lv2-plugins')
depends=('libsmf' 'libxext' 'expat' 'jack' 'zita-resampler')
makedepends=('git' 'lv2')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+http://git.drumgizmo.org/drumgizmo.git"
        "http://www.steinberg.net/sdk_downloads/vstsdk367_03_03_2017_build_352.zip")
md5sums=('SKIP'
         'b4ed4f4f4be77b267f1821fc1413ea36')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git submodule update
  ./autogen.sh
}

build() {
  cd "$_pkgname"
  ./configure --prefix=/usr \
              --enable-lv2 \
              --enable-vst \
              --with-vst-sources="$srcdir/VST_SDK/VST2_SDK"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
