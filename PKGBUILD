# Maintainer: Ashley <ashley at nullworks dot dev>
pkgname=pmount-modern
_tag=0.10.0-dbus
pkgver=${_tag//-/_}
pkgrel=2
pkgdesc='Modernized pmount with D-Bus, PolicyKit, and systemd integration'
arch=('x86_64')
url='https://github.com/zHappySnake/pmount-modern'
license=('GPL-3.0-or-later')
depends=(
  'dbus'
  'dbus-glib'
  'glib2'
  'polkit'
  'systemd'
  'util-linux'
  'util-linux-libs'
)
makedepends=(
  'cmake'
  'meson'
  'pkgconf'
)
optdepends=(
  'cryptsetup: LUKS support'
  'ntfs-3g: NTFS mounting via ntfs-3g'
)
provides=('pmount')
conflicts=('pmount')
replaces=('pmount')
backup=(
  'etc/pmount.allow'
  'etc/pmount.conf'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('2c2a57149c009bc93feea045bfae7d867672692a1fc08434639baf6261f418c2')

build() {
  local meson_options=(
    -Ddbus=enabled
    -Dpolkit=enabled
    -Dsystemd=enabled
    -Dmount-prog=/usr/bin/mount
    -Dumount-prog=/usr/bin/umount
    -Dcryptsetup-prog=/usr/bin/cryptsetup
    -Dmount-ntfs-3g=/usr/bin/mount.ntfs-3g
    -Dfsck-prog=/usr/bin/fsck
    -Dlosetup-prog=/usr/bin/losetup
    --prefix=/usr
    --sysconfdir=/etc
    --sharedstatedir=/var/lib
  )

  arch-meson "${pkgname}-${_tag}" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}" --no-rebuild
}
