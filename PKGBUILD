# Maintainer: Alexandros Theodotou <alex@zrythm.org>
# and milk / milkii on Freenode
_pkgname=zrythm
pkgname=$_pkgname-debug-git
pkgver=0.8.298.r32.g039d28f7
pkgrel=1
pkgdesc='a highly automated and intuitive digital audio workstation'
arch=('x86_64' 'i686')
url="https://www.zrythm.org"
license=('AGPL3')
depends=('git' 'gtk3' 'lilv' 'libx11' 'jack' 'libsndfile'
  'libyaml'  'libsamplerate' 'alsa-lib' 'fftw' 'xdg-utils'
  'rubberband' 'breeze-icons')
makedepends=(
  'python' 'gettext' 'sed'
  'meson' 'ninja' 'help2man' 'python-sphinx'
  'ladspa' 'lv2-git')
optdepends=('portaudio: portaudio backend'
            'qt5-base: for embedding qt5 plugin UIs')
conflicts=()
provides=()
source=("$_pkgname::git+https://git.zrythm.org/git/$_pkgname.git")
md5sums=('SKIP')
options=(debug !strip)

pkgver () {
  cd "$srcdir/$_pkgname"
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  printf "%s" "$(git describe --tags | sed 's/-/\.r/' | sed 's/v//g' | sed 's/-/\./g')"
}

build() {
  cd "$srcdir/$_pkgname"
  meson build --prefix=/usr -Denable_guile=true -Denable_jack=true -Denable_ffmpeg=true -Denable_graphviz=true -Denable_carla=true -Dmanpage=true 
  ninja -C build
}

check() {
  cd "$srcdir/$_pkgname"
  ninja -C build test
}

package() {
  cd "$srcdir/$_pkgname"
  install -vDm 644 AUTHORS CONTRIBUTING.md CHANGELOG.md README.md THANKS TRANSLATORS \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  DESTDIR="${pkgdir}/" ninja -C build install
}
