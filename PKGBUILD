# Maintainer: deddroid <deddo9412@gmail.com>
pkgname=wnvidia-control-bin
_pkgname=wnvidia-control
_bin=wnvctl
pkgver=0.1.1
pkgrel=1
pkgdesc="Overclock, undervolt, power limit and fan curves for NVIDIA GPUs (Wayland/X11 GUI, CLI and service) (prebuilt)"
arch=('x86_64')
url="https://github.com/deddroid/wnvidia-control"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libglvnd' 'libxkbcommon' 'nvidia-utils')
optdepends=('wayland: native Wayland window'
            'libx11: X11 window')
provides=("$_pkgname" "$_bin")
conflicts=("$_pkgname" "$_bin")
backup=('etc/wnvctl/daemon.toml')
install=wnvidia-control-bin.install
options=('!lto' '!strip' '!debug')
source=("$url/releases/download/v$pkgver/$_bin-$pkgver-linux-x86_64.tar.gz")
sha256sums=('90597cbaf18e625bb487f67d0d34483d87f5f7cf85f09961c95dc3f96ddcf684')

package() {
  cd "$_bin-$pkgver-linux-x86_64"
  install -Dm755 wnvctl wnvctl-gui -t "$pkgdir/usr/bin/"
  install -Dm644 wnvctl.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 wnvctl.sysusers "$pkgdir/usr/lib/sysusers.d/wnvctl.conf"
  install -Dm644 daemon.toml -t "$pkgdir/etc/wnvctl/"
  install -Dm644 wnvctl.desktop -t "$pkgdir/usr/share/applications/"
  for s in 16 32 48 64 128 256 512; do
    install -Dm644 "icons/icon-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/wnvctl.png"
  done
  install -Dm644 icons/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/wnvctl.svg"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md README.it.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
