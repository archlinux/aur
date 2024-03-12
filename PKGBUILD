# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
# Contributor: Christopher Arndt <aur at chrisarndt dot de>

_pkgname=guitarix.vst
pkgname=$_pkgname-git
pkgver=v0.3.r1.g313edd9
pkgrel=1
pkgdesc='A versatile (guitar) amplifier VST3 plugin (git version)'
arch=(x86_64)
url='https://github.com/brummer10/guitarix.vst'
license=(GPL-3.0-or-later)
groups=(vst3-plugins pro-audio)
depends=(
  gcc-libs
  glib2
  glibc
  glibmm
  libsigc++
)
makedepends=(
  boost
  curl
  eigen
  fftw
  freetype2
  git
  gperf
  graphite
  intltool
  lilv
  libsndfile
  sassc
  waf
  webkit2gtk
)
optdepends=(
  'vst3-host: for VST3 plugins'
  'gxplugins.lv2: for Guitarix LV2 plugins'
)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/brummer10/guitarix.vst"
        'guitarix::git+https://github.com/brummer10/guitarix.git'
        'NAM::git+https://github.com/sdatkinson/NeuralAmpModelerCore.git'
        'eigen::git+https://gitlab.com/libeigen/eigen.git'
        'RTNeural::git+https://github.com/jatinchowdhury18/RTNeural.git')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd $_pkgname
  (
    set -o pipefail
    git describe --long --tag --match 'v*' | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname
  git submodule init guitarix
  git submodule set-url guitarix "$srcdir"/guitarix
  git -c protocol.file.allow=always submodule update guitarix
  cd guitarix
  git submodule init trunk/src/NAM/NeuralAmpModelerCore
  git submodule set-url trunk/src/NAM/NeuralAmpModelerCore "$srcdir"/NAM
  git -c protocol.file.allow=always submodule update trunk/src/NAM/NeuralAmpModelerCore
  git submodule init trunk/src/RTNeural/RTNeural
  git submodule set-url trunk/src/RTNeural/RTNeural "$srcdir"/RTNeural
  git -c protocol.file.allow=always submodule update trunk/src/RTNeural/RTNeural
  cd trunk/src/NAM/NeuralAmpModelerCore
  git submodule init Dependencies/eigen
  git submodule set-url Dependencies/eigen "$srcdir"/eigen
  git -c protocol.file.allow=always submodule update Dependencies/eigen
}

build() {
  cd $_pkgname
  make
}

package() {
  depends+=(
    libcurl.so
    libfftw3f.so
    libfreetype.so
    libgio-2.0.so
    libglib-2.0.so
    libglibmm-2.4.so
    libgobject-2.0.so
    libgraphite2.so.3
    liblilv-0.so
    libsigc-2.0.so
    libsndfile.so
  )
  cd $_pkgname
  make JUCE_VST3DESTDIR="$pkgdir"/usr/lib/vst3 install
}
