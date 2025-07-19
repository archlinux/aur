# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=tuner
pkgver=2.0.0
pkgrel=1
pkgdesc="GNU/Linux app to discover and play internet radio stations. Geared towards RadioBrowser"
arch=('x86_64' 'i686')
url="https://github.com/louis77/${pkgname}"
license=('GPL-3.0-only')
depends=('granite' 'gst-plugins-bad-libs' 'gst-plugins-good')
optdepends=('gst-libav: play AAC[+] streams')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d38d0d9dfde3a642936ef51ca9797a1c94b571f940d575e568688089bc1bf9b')

prepare() {
  # Remove the invocation of glib-compile-schemas from the upstream install schema. It prevents building in a clean chroot and
  # isn't needed as the task is covered by a hook.
  # Details in upstream issue #215 (https://github.com/louis77/tuner/issues/215).
  sed -i '/^meson.add_install_script.*glib-compile-schemas/d' tuner-${pkgver}/data/meson.build
}

build() {
  arch-meson "${pkgname}-${pkgver}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  cd "${pkgdir}"/usr/bin/
  ln -s com.github.louis77.tuner tuner
}
