# Maintainer:   Patrick Rogers <patrick at thewebzone dot net>
# Contributor:  Alexander Blinne "Sunday" <alexander at blinne dot net>
_pkgname=sview
pkgname=$_pkgname-git
pkgver=r1751.ad7cbddf
pkgrel=1
pkgdesc="Stereoscopic 3D video player with OpenGL UI"
arch=('x86_64' 'i686')
url="https://github.com/gkv311/sview"
license=('GPL-3.0-only AND MIT AND CC-BY-4.0')
depends=('libconfig' 'ffmpeg' 'freetype2' 'gtk2' 'libgl' 'libx11' 'libxext' 'libxpm' 'openal' 'ttf-droid' 'gnu-free-fonts')
optdepends=('ttf-nanum')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/gkv311/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  # git tag -f 23_02 301eccf5f81e0483710e01ec477906a13fb8988b
  # git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}

build() {
  cd $_pkgname
  unset ANDROID_NDK
  cmake -B build -D USE_OPENVR=off -D CMAKE_INSTALL_PREFIX=$pkgdir/usr
  make -C build all
}

package() {
  cd $_pkgname
  make -C build install
  mkdir -p $pkgdir/usr/share/licenses/$_pkgname/
  cp docs/LICENSE.md $pkgdir/usr/share/licenses/$_pkgname/
}
