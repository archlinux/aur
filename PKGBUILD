# Maintainer: Alexandros Theodotou <alex@zrythm.org>
_pkgname=zrythm
pkgname=$_pkgname-git
pkgver=0.5.120.r2.ge9e5b258
pkgrel=1
pkgdesc="An highly automated, intuitive, Digital Audio Workstation (DAW)"
arch=( 'x86_64' )
url='https://git.zrythm.org/zrythm/zrythm'
license=( 'GPL3' )
depends=('gtk3' 'lv2' 'lilv' 'libx11' 'jack'
  'libsndfile' 'libyaml' 'gettext' 'qt5-base'
  'libsamplerate' 'alsa-lib' 'portaudio'
  'ladspa' 'fftw')
makedepends=('python' 'gettext' 'sed'
             'meson' 'ninja')
conflicts=( "$_pkgname" )
provides=( "$_pkgname" )
source=("$_pkgname::git+https://git.zrythm.org/git/zrythm.git")
md5sums=('SKIP')

pkgver () {
  cd "$srcdir/$_pkgname"
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  printf "%s" "$(git describe --tags | sed 's/-/\.r/' | sed 's/v//g' | sed 's/-/\./')"
}

build() {
  cd "$srcdir/$_pkgname"
  mkdir -p build
  cd build && meson --prefix=/usr .. -Denable_tests=true
  ninja
}

check() {
  cd "$srcdir/$_pkgname"
  cd build && ninja test
}

package() {
  cd "$srcdir/$_pkgname"
  cd build && DESTDIR="${pkgdir}/" ninja install
}
