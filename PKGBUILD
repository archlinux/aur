# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_reponame=asid
pkgname=a-sid
pkgver=1.0.2
pkgrel=1
pkgdesc="Emulation of the C64 MOS 8580 SID analog filter as a VST3 plugin"
arch=(x86_64)
url='https://www.orastron.com/asid'
license=(GPL3 MIT)
depends=(glibc)
makedepends=(vst3sdk)
groups=(pro-audio vst3-plugins)
source=("$pkgname-$pkgver.tar.gz::https://github.com/sdangelo/$_reponame/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('76bf5e925b2aed577b2eea255cb3f972be6f4d5c3925898855eefdbdbfbad17d')

prepare() {
  cd $_reponame-$pkgver/vst3
  sed -i -e 's|VST_SDK_DIR=.*$|VST_SDK_DIR=/usr/include|' buildLinux.sh
}

build() {
  cd $_reponame-$pkgver/vst3
  ./buildLinux.sh
}

package() {
  cd $_reponame-$pkgver

  # plugin bundle
  install -Dm755 vst3/build/$_reponame.vst3/desktop.ini \
    vst3/build/$_reponame.vst3/Plugin.ico \
    -t "$pkgdir"/usr/lib/vst3/$_reponame.vst3
  install -Dm755 vst3/build/$_reponame.vst3/Contents/Info.plist \
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
