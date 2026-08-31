# Maintainer: fluhus
# Based on Arch's gvfs PKGBUILD by Jan Alexander Steffens, Fabian Bornschein, Jan de Groot

pkgname=gvfs-googledrive
pkgver=1.61.2
pkgrel=1
pkgdesc="Virtual filesystem implementation for GIO (with Google Drive backend) - all backends"
url="https://gitlab.gnome.org/fluhus/gvfs"
arch=(x86_64 aarch64)
license=(LGPL-2.0-only)
depends=(
  avahi
  dconf
  fuse3
  gcr-4
  glib2
  glibc
  gsettings-desktop-schemas
  libarchive
  libbluray
  libcdio
  libcdio-paranoia
  libgcc
  libgcrypt
  libgoa
  libgphoto2
  libgudev
  libimobiledevice
  libmtp
  libnfs
  libplist
  libsecret
  libsoup3
  libusb
  libxml2
  msgraph
  polkit
  procps-ng
  'smbclient>=4.12.0'
  systemd
  systemd-libs
  udisks2
  usbmuxd
  wsdd
)
makedepends=(
  dbus
  docbook-xsl
  git
  glib2-devel
  meson
  openssh
  python
  smbclient
)
provides=(
  "gvfs=$pkgver"
  "gvfs-afc=$pkgver"
  "gvfs-dnssd=$pkgver"
  "gvfs-goa=$pkgver"
  "gvfs-google=$pkgver"
  "gvfs-gphoto2=$pkgver"
  "gvfs-mtp=$pkgver"
  "gvfs-nfs=$pkgver"
  "gvfs-onedrive=$pkgver"
  "gvfs-smb=$pkgver"
  "gvfs-wsdd=$pkgver"
)
conflicts=(
  gvfs gvfs-afc gvfs-dnssd gvfs-goa gvfs-google gvfs-gphoto2
  gvfs-mtp gvfs-nfs gvfs-onedrive gvfs-smb gvfs-wsdd
)
replaces=(
  gvfs gvfs-afc gvfs-dnssd gvfs-goa gvfs-google gvfs-gphoto2
  gvfs-mtp gvfs-nfs gvfs-onedrive gvfs-smb gvfs-wsdd
)
groups=(gnome)
install=gvfs-nfs.install
source=(
  "git+https://gitlab.gnome.org/fluhus/gvfs.git#commit=d85a4f8c023c7bfcc0ff94f01aef4d8cae174f22"
  gvfsd.hook
)
b2sums=('SKIP'
        'a0356a49c419dc69466c591d5e69701b865bb97ca336ea6d8bca0f0d9173b832b73d9f2c701d572a0245957d39c9a38ab6dff4ea7c737c34f2a1a28d93c0427f')

prepare() {
  cd gvfs
}

build() {
  local meson_options=(
    -D man=true
    -D google=true
  )

  arch-meson gvfs build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
}

# vim:set sw=2 sts=-1 et:
