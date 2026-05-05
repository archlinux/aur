# Maintainer: JuanJo Ciarlante <jjo@users.noreply.github.com>
pkgname=drm-colortemp
pkgver=0.2.10
pkgrel=1
pkgdesc="DRM color temperature control for COSMIC DE (wlr-gamma-control workaround)"
arch=('x86_64')
url="https://github.com/jjo/drm-colortemp"
license=('Apache-2.0')
depends=('libdrm')
optdepends=('libnotify: desktop notifications')
makedepends=('gcc' 'pkgconf' 'make')
backup=('etc/default/drm-colortemp.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jjo/drm-colortemp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c7da86b2bc5fa7ab50968d5c44c502850885cb30900b8700242ea5ce76ff4fde')

build() {
  cd "$pkgname-$pkgver"
  make
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 drm_colortemp              "$pkgdir/usr/bin/drm_colortemp"
  install -Dm755 drm_colortemp_daemon       "$pkgdir/usr/bin/drm_colortemp_daemon"
  install -Dm755 drm-colortemp-notify.sh    "$pkgdir/usr/bin/drm-colortemp-notify.sh"
  install -Dm755 drm-colortemp-notifier.sh  "$pkgdir/usr/bin/drm-colortemp-notifier.sh"

  install -Dm644 drm-colortemp.conf "$pkgdir/etc/default/drm-colortemp.conf"

  install -Dm644 drm-colortemp-daemon.service   "$pkgdir/usr/lib/systemd/system/drm-colortemp-daemon.service"
  install -Dm644 drm-colortemp-notifier.service "$pkgdir/usr/lib/systemd/system/drm-colortemp-notifier.service"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Source defaults to /usr/local/bin paths; rewrite for distro install layout
  sed -i 's|/usr/local/bin|/usr/bin|g' \
    "$pkgdir/usr/lib/systemd/system/drm-colortemp-daemon.service" \
    "$pkgdir/usr/lib/systemd/system/drm-colortemp-notifier.service" \
    "$pkgdir/usr/bin/drm-colortemp-notifier.sh"
}
