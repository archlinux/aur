# Maintainer:Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=Starp
_pkgname=${_name,,}
pkgname=$_pkgname-git
pkgver=v0.2.0.r0.g2cb7f86
pkgrel=1
pkgdesc='A stable random arpeggiator VST3 plugin (git version)'
arch=(x86_64 aarch64)
url='https://github.com/mhhollomon/Starp'
license=(GPL3)
depends=(gcc-libs glibc)
makedepends=(cmake freetype2 git)
groups=(pro-audio vst3-plugins)
optdepends=('vst3-host: for loading the VST3 format plugin')
source=("git+https://github.com/mhhollomon/Starp.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -B $_pkgname-build -S $_name
  cmake --build $_pkgname-build
}

package() {
  depends+=(libfreetype.so)
  install -vDm 644 \
    $_pkgname-build/Source/Starp_artefacts/Release/VST3/$_name.vst3/Contents/Resources/moduleinfo.json \
    -t "$pkgdir"/usr/lib/vst3/$_name.vst3/Contents/Resources
  install -vDm 755 \
    $_pkgname-build/Source/Starp_artefacts/Release/VST3/$_name.vst3/Contents/$CARCH-linux/$_name.so \
    -t "$pkgdir"/usr/lib/vst3/$_name.vst3/Contents/$CARCH-linux
  install -vDm 644 $_name/README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 $_name/docs/*.png -t "$pkgdir"/usr/share/doc/$pkgname/docs
}
