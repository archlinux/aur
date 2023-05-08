# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Florian Hülsmann <fh@cbix.de>

_reponame=asid
pkgname=a-sid
pkgver=1.0.4
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
sha256sums=('43714a84e3512767d5cc99335a90a04ab689ebe9a4a5f309e0a512f1cdee0c76'
            '47fe561a94a7553538d27e7a738beb5e6d62f552985df2ef24e9db81c58b0168')

prepare() {
  cd $_reponame-$pkgver
  patch -p1 -N -r - -i "$srcdir"/a-sid-build-linux.patch
}

build() {
  cd $_reponame-$pkgver/vst3
  local _vstdir=/usr/src
  if [[ -d /usr/share/vst3sdk ]]; then
    _vstdir=/usr/share
  fi
  VST_SDK_DIR=$_vstdir ./buildLinux.sh
}

package() {
  cd $_reponame-$pkgver
  # plugin bundle
  install -Dm755 vst3/build/$_reponame.vst3/Contents/$(uname -m)-linux/$_reponame.so \
    -t "$pkgdir"/usr/lib/vst3/$_reponame.vst3/Contents/$(uname -m)-linux
  # documentation
  install -Dm644 README.md vst3/$_reponame.vst3/Contents/Resources/ChangeLog.txt -t \
    "$pkgdir"/usr/share/doc/$pkgname
  # extra license
  install -Dm644 vst3/$_reponame.vst3/Contents/Resources/sse2neon-license.txt -t \
    "$pkgdir"/usr/share/licenses/$pkgname
}
