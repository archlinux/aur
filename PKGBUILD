# Maintainer: Patrick Desaulniers <patrick dot desaulniers36 at gmail dot com>

_pkgname=wolf-shaper
_pkgdesc="A waveshaper plugin with graph editor"
pkgname=$_pkgname-git
pkgver=1.0.2.r25.gd38cc33
pkgrel=1
pkgdesc="$_pkgdesc (git version)"
arch=(i686 x86_64)
url='https://github.com/wolf-plugins/wolf-shaper'
license=(GPL)
groups=(
  pro-audio
  dssi-plugins
  clap-plugins
  lv2-plugins
  vst-plugins
  vst3-plugins
)
depends=(
  gcc-libs
  glibc
  libxext
  libglvnd
  libx11
)
makedepends=(
  alsa-lib
  dssi
  gcc-libs
  gendesk
  glibc
  jack
  liblo
  libglvnd
  libx11
  libxext
  lv2
)
optdepends=(
  'jack: for standalone application'
  'dssi-host: for loading the DSSI format plugin'
  'clap-host: for loading the CLAP format plugin'
  'lv2-host: for loading the LV2 format plugin'
  'vst-host: for loading the VST2 format plugin'
  'vst3-host: for loading the VST3 format plugin'
)
provides=(
  $_pkgname{,-clap,-dssi,-lv2,-standalone,-vst,-vst3}
)
conflicts=(
  $_pkgname{,-clap,-dssi,-lv2,-standalone,-vst,-vst3}
)
source=("$_pkgname::git+https://github.com/wolf-plugins/wolf-shaper")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  git submodule update --init --recursive

  gendesk -f -n \
    --pkgname com.github.pdesaulniers.$_pkgname \
    --name $_pkgname \
    --exec $_pkgname \
    --pkgdesc "$_pkgdesc" \
    --genericname "Wave Shaper" \
    --categories "AudioVideo;Audio"
}

build() {
  cd $_pkgname
  make \
    BUILD_CLAP=True \
    BUILD_DSSI=true \
    BUILD_JACK=true \
    BUILD_LV2=true  \
    BUILD_VST2=true \
    BUILD_VST3=True
}

package() {
  depends+=(libasound.so libGL.so liblo.so)
  cd $_pkgname
  make DESTDIR="$pkgdir" PREFIX="/usr" VST_FOLDER_NAME=vst install
  install -vDm 644 *.desktop -t "$pkgdir"/usr/share/applications
}
