# Maintainer: Alexandros Theodotou <alex@zrythm.org>
_pkgname=zrythm
pkgname=$_pkgname-git
pkgver=0.5.120.r39.g7e84f645
pkgrel=1
pkgdesc='An highly automated, intuitive, Digital Audio Workstation (DAW)'
arch=('x86_64')
url='https://git.zrythm.org/zrythm/zrythm'
license=('AGPL3')
depends=('gtk3' 'lv2' 'lilv' 'libx11' 'jack'
  'libsndfile' 'libyaml' 'gettext'
  'libsamplerate' 'alsa-lib'
  'ladspa' 'fftw')
makedepends=('python' 'gettext' 'sed'
             'meson' 'ninja')
optdepends=('portaudio: portaudio backend'
            'qt5-base: for embedding qt5 plugin UIs')
conflicts=("$_pkgname")
provides=("$_pkgname")
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
