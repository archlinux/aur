# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
# Contributor: Christopher Arndt <aur at chrisarndt dot de>
 
_pkgname=guitarix.vst
pkgname=$_pkgname-git
pkgver=v0.1.r1.gacbdd19
pkgrel=1
pkgdesc='A virtual versatile amplification for Jack/Linux - vst3 wrapper'
arch=(x86_64)
url='https://github.com/brummer10/guitarix.vst'
license=(GPL3)
groups=(vst3-plugins pro-audio)
depends=(alsa-lib curl gcc-libs glib2 glibc libsigc++ libsndfile lilv fftw freetype2 glibmm avahi)
makedepends=(git boost eigen gperf intltool lv2 waf sassc pkgconfig webkit2gtk)
optdepends=(
  'vst3-host: for VST3 plugins'
  'gxplugins.lv2: for Guitarix LV2 plugins'
)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/brummer10/guitarix.vst"
        'guitarix::git+https://github.com/brummer10/guitarix.git')
sha256sums=('SKIP' 'SKIP')
 
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
  git submodule init
  git submodule set-url guitarix "$srcdir"/guitarix
  git -c protocol.file.allow=always submodule update
}
 
build() {
  cd $_pkgname
  make
}
 
package() {
  cd $_pkgname
  make JUCE_VST3DESTDIR="$pkgdir"/usr/lib/vst3 install
}
