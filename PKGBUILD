# Maintainer: se2crid
pkgname=plumeimpactor-git
pkgver=0.r0.g0000000
pkgrel=1
pkgdesc="Feature rich iOS/tvOS sideloading app written in Rust (git)"
arch=('x86_64')
url="https://github.com/khcrysalis/Impactor"
license=('MIT')
depends=('gtk3' 'libpng' 'libjpeg-turbo' 'mesa' 'glu' 'libxkbcommon' 'expat' 'libtiff' 'usbmuxd' 'libimobiledevice')
makedepends=('git' 'cargo' 'clang' 'cmake' 'pkgconf')
provides=('plumeimpactor')
conflicts=('plumeimpactor')
source=('git+https://github.com/khcrysalis/Impactor.git')
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "$srcdir/Impactor"
  if git describe --tags --long --abbrev=7 >/dev/null 2>&1; then
    git describe --tags --long --abbrev=7 | sed 's/^v//; s/-/.r/; s/-/./'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "$srcdir/Impactor"
  cargo build --release --locked --bin plumeimpactor
}

package() {
  cd "$srcdir/Impactor"
  install -Dm755 target/release/plumeimpactor "$pkgdir/usr/bin/plumeimpactor"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 package/linux/dev.khcrysalis.PlumeImpactor.desktop \
    "$pkgdir/usr/share/applications/dev.khcrysalis.PlumeImpactor.desktop"
  install -Dm644 package/linux/dev.khcrysalis.PlumeImpactor.metainfo.xml \
    "$pkgdir/usr/share/metainfo/dev.khcrysalis.PlumeImpactor.metainfo.xml"
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "package/linux/icons/hicolor/${size}x${size}/apps/dev.khcrysalis.PlumeImpactor.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/dev.khcrysalis.PlumeImpactor.png"
  done
}
