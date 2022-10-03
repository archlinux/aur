# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=DIE-Plugins
pkgname=${_name,,}
pkgdesc="DISTRHO Imported Effect Plugins, Ardour's plugins without Ardour"
pkgver=1.1
pkgrel=3
arch=(x86_64 aarch64)
url="https://github.com/DISTRHO/$_name"
license=(GPL2)
groups=(lv2-plugins pro-audio)
depends=(glibc gcc-libs)
makedepends=(git glib2 libsndfile lv2)
optdepends=('lv2-host: for loading LV2 plugins')
source=("$_name-$pkgver.tar.gz::https://github.com/DISTRHO/$_name/archive/refs/tags/v$pkgver.tar.gz"
        'die-plugins-maintainer-mod-brand.patch::https://github.com/DISTRHO/DIE-Plugins/pull/1.diff')
sha256sums=('bef945fd7534a4bdaacd6bc57548ac3a9da97446c2b2e5a56b27ebfa2092a49a'
            'ee961e520e0bf0d98899fcc284cf7d4dbad6b59d0d98ed1ab1d4411889ead12a')


prepare() {
  cd $_name-$pkgver
  patch -p1 -N -r - -i "$srcdir"/die-plugins-maintainer-mod-brand.patch
}

build() {
  cd $_name-$pkgver
  make
}

package() {
  depends+=(libglib-2.0.so libsndfile.so)
  cd $_name-$pkgver
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  chmod +x "$pkgdir"/usr/lib/lv2/*.lv2/*.so
}
