# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_reponame=asid
pkgname=a-sid
pkgver=1.0.3
pkgrel=2
pkgdesc="Emulation of the C64 MOS 8580 SID analog filter as a VST3 plugin"
arch=(x86_64 aarch64)
url='https://www.orastron.com/asid'
license=(GPL3 MIT)
depends=(glibc gcc-libs libxcb)
makedepends=(vst3sdk)
optdepends=('vst3-host: for loading the VST3 plugin')
groups=(pro-audio vst3-plugins)
source=("$pkgname-$pkgver.tar.gz::https://github.com/sdangelo/$_reponame/archive/refs/tags/$pkgver.tar.gz"
        'a-sid-build-linux.patch')
sha256sums=('16bd9df96d763dfba3add95e643b48713fb22401e6f54df57cceaf5793f65a55'
            'bd21be0d58d33a126e95c61c70384f8ff63a0740b9d1c9f8752d84f6602d0f1d')

prepare() {
  cd $_reponame-$pkgver
  patch -p1 -N -r - -i "$srcdir"/a-sid-build-linux.patch
}

build() {
  cd $_reponame-$pkgver/vst3
  VST_SDK_DIR=/usr/include ./buildLinux.sh
}

package() {
  cd $_reponame-$pkgver

  # plugin bundle
  install -Dm644 vst3/build/$_reponame.vst3/desktop.ini \
    vst3/build/$_reponame.vst3/Plugin.ico \
    -t "$pkgdir"/usr/lib/vst3/$_reponame.vst3
  install -Dm644 vst3/build/$_reponame.vst3/Contents/Info.plist \
    vst3/build/$_reponame.vst3/Contents/PkgInfo \
    -t "$pkgdir"/usr/lib/vst3/$_reponame.vst3/Contents
  install -Dm755 vst3/build/$_reponame.vst3/Contents/$(uname -m)-linux/$_reponame.so \
    -t "$pkgdir"/usr/lib/vst3/$_reponame.vst3/Contents/$(uname -m)-linux
  # documentation
  install -Dm644 README.md vst3/$_reponame.vst3/Contents/Resources/ChangeLog.txt -t \
    "$pkgdir"/usr/share/doc/$pkgname
  # extra license
  install -Dm644 vst3/$_reponame.vst3/Contents/Resources/sse2neon-license.txt -t \
    "$pkgdir"/usr/share/licenses/$pkgname
}
