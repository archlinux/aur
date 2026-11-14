# Maintainer: Adromedary
pkgname=trueflasher-git
pkgver=1.0.0.r1.g1e95726
pkgrel=1
pkgdesc="Find the real capacity of fake USB flash drives"
arch=('x86_64' 'aarch64')
url="https://github.com/9M2PJU/Adromedarys-s-True-Flasher."
license=('MIT')
depends=('gcc-libs' 'util-linux')
makedepends=('git' 'dotnet-sdk-8.0')
optdepends=('dosfstools: FAT32 fix step'
            'exfatprogs: exFAT fix step')
provides=('trueflasher')
conflicts=('trueflasher')
source=("git+https://github.com/9M2PJU/Adromedarys-s-True-Flasher..git")
sha256sums=('SKIP')

pkgver() {
  cd "Adromedarys-s-True-Flasher."
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || \
    printf "1.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "Adromedarys-s-True-Flasher."
  if [ "$CARCH" = "aarch64" ]; then
    ./build.sh arm64
  else
    ./build.sh
  fi
}

package() {
  cd "Adromedarys-s-True-Flasher."
  if [ "$CARCH" = "aarch64" ]; then _rid="linux-arm64"; else _rid="linux-x64"; fi
  install -Dm755 "bin/${_rid}/trueflasher" "$pkgdir/usr/bin/trueflasher"
  install -Dm644 packaging/trueflasher.1 "$pkgdir/usr/share/man/man1/trueflasher.1"
  install -Dm644 packaging/trueflasher.desktop "$pkgdir/usr/share/applications/trueflasher.desktop"
  install -Dm644 assets/icon_256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/trueflasher.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
