# Maintainer: JuanJo Ciarlante <jjo@users.noreply.github.com>
pkgname=drm-colortemp-git
_pkgname=drm-colortemp
pkgver=0.2.10.r0.g0000000
pkgrel=1
pkgdesc="DRM color temperature control for COSMIC DE (git version)"
arch=('x86_64')
url="https://github.com/jjo/drm-colortemp"
license=('Apache-2.0')
depends=('libdrm')
optdepends=('libnotify: desktop notifications')
makedepends=('gcc' 'pkgconf' 'make' 'git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=('etc/default/drm-colortemp.conf')
source=("$_pkgname::git+https://github.com/jjo/drm-colortemp.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

check() {
  cd "$_pkgname"
  make test
}

package() {
  cd "$_pkgname"

  install -Dm755 drm_colortemp              "$pkgdir/usr/bin/drm_colortemp"
  install -Dm755 drm_colortemp_daemon       "$pkgdir/usr/bin/drm_colortemp_daemon"
  install -Dm755 drm-colortemp-notify.sh    "$pkgdir/usr/bin/drm-colortemp-notify.sh"
  install -Dm755 drm-colortemp-notifier.sh  "$pkgdir/usr/bin/drm-colortemp-notifier.sh"

  install -Dm644 drm-colortemp.conf "$pkgdir/etc/default/drm-colortemp.conf"

  install -Dm644 drm-colortemp-daemon.service   "$pkgdir/usr/lib/systemd/system/drm-colortemp-daemon.service"
  install -Dm644 drm-colortemp-notifier.service "$pkgdir/usr/lib/systemd/system/drm-colortemp-notifier.service"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  sed -i 's|/usr/local/bin|/usr/bin|g' \
    "$pkgdir/usr/lib/systemd/system/drm-colortemp-daemon.service" \
    "$pkgdir/usr/lib/systemd/system/drm-colortemp-notifier.service" \
    "$pkgdir/usr/bin/drm-colortemp-notifier.sh"
}
