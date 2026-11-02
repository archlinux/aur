# Maintainer: Aliorpse <aliorpse@qq.com>
pkgname=wetype-linux
pkgver=0.1.0+wetype3.0.2.22
pkgrel=1
pkgdesc="WeType (微信输入法) engine for Fcitx5, running the Windows engine under Wine"
arch=('x86_64')
url="https://github.com/Aliorpse/wetype-linux"
license=('MIT')
depends=('fcitx5' 'wine' 'hicolor-icon-theme')
# rustup conflicts with the distro rust package: build in a clean chroot
# (devtools) if you already have rust installed.
makedepends=('rustup' 'mingw-w64-gcc' 'meson' 'ninja' 'pkgconf' '7zip' 'git' 'protobuf')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
install=wetype-linux.install

build() {
  cd "$srcdir/$pkgname"

  # The engine host is a Windows PE; the distro rust ships only the host std.
  rustup default stable
  rustup target add x86_64-pc-windows-gnu

  # Tencent's payload is downloaded on the build machine and verified against
  # wetype.lock; this package never redistributes it.
  ./scripts/fetch_wetype.sh
  ./scripts/build.sh
}

package() {
  cd "$srcdir/$pkgname"
  ./scripts/install.sh --destdir "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
