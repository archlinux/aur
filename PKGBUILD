# Maintainer: Hec <hec@heccraft.com>
pkgname=uupd
pkgver=1.3.0 # renovate: datasource=github-releases depName=ublue-os/uupd
pkgrel=1
pkgdesc="Centralized update service/checker made for Universal Blue"
arch=('x86_64' 'aarch64')
url="https://github.com/ublue-os/$pkgname"
license=('Apache-2.0')
depends=(libnotify
  systemd)
makedepends=(go
  just)
optdepends=(bootc
  distrobox
  flatpak)
source=(https://github.com/ublue-os/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('6132b4e1dcc8bd993cf532384dbaf8021084731d709652e4a4105f4b8e04acd8')

build() {
	cd "$pkgname-$pkgver"
  just build
}

package() {
	cd "$pkgname-$pkgver"
  ./output/uupd completion bash > uupd.bash
  ./output/uupd completion zsh > uupd.zsh
  ./output/uupd completion fish > uupd.fish
	install -Dm755 output/uupd $pkgdir/usr/bin/uupd
  install -Dm644 uupd.service $pkgdir/usr/lib/systemd/system/uupd.service
  install -Dm644 uupd.timer $pkgdir/usr/lib/systemd/system/uupd.timer
  install -Dm644 uupd.rules $pkgdir/usr/share/polkit-1/rules.d/uupd.rules
  install -Dm644 uupd.bash $pkgdir/usr/share/bash-completion/completions/uupd
  install -Dm644 uupd.zsh $pkgdir/usr/share/zsh/site-functions/_uupd
  install -Dm644 uupd.fish $pkgdir/usr/share/fish/vendor_completions.d/uupd.fish
}
