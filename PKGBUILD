# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_projectname='Kapitonov-Plugins-Pack'
pkgname=kpp
pkgver=1.2.1
pkgrel=3
pkgdesc='Kapitonov Plugins Pack for guitar sound processing'
arch=(x86_64 aarch64)
url='https://kpp-tubeamp.com/'
license=(GPL3)
groups=(ladspa-plugins lv2-plugins pro-audio)
depends=(cairo gcc-libs xcb-util xcb-util-wm)
makedepends=(boost faust ladspa lv2 meson libxcb zita-convolver zita-resampler)
optdepends=('ladspa-host: for running the LADSPA plugins'
            'lv2-host: for running the LV2 plugins')
source=("$pkgname-$pkgver.tar.gz::https://github.com/olegkapitonov/$_projectname/archive/refs/tags/$pkgver.tar.gz"
        'kpp-ladspa-descriptor.patch::https://github.com/olegkapitonov/Kapitonov-Plugins-Pack/pull/26.diff')
sha256sums=('056c152ee72c5a0cfd45ca0cd848ff13b098c8f58b14c26ad06d7ef49c792b40'
            '361cdfb787e34d6646065b064f7633ee82ddf2bad7e87fb06d5307ee40e2ead5')

prepare() {
  cd $_projectname-$pkgver
  # fix ladspa plugins to have proper label, name, maker and copyright info
  patch -p1 -N -r - -i "$srcdir"/kpp-ladspa-descriptor.patch
}

build() {
  arch-meson $_projectname-$pkgver build
  meson compile -C build
}

package() {
  depends+=(libzita-convolver.so libzita-resampler.so)
  meson install -C build --destdir "$pkgdir"
}
