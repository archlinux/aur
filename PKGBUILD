# Maintainer: fluhus
# Based on Arch's gvfs PKGBUILD by Jan Alexander Steffens, Fabian Bornschein, Jan de Groot

pkgbase=gvfs
pkgname=(
  gvfs
  gvfs-afc
  gvfs-dnssd
  gvfs-goa
  gvfs-google
  gvfs-gphoto2
  gvfs-mtp
  gvfs-nfs
  gvfs-onedrive
  gvfs-smb
  gvfs-wsdd
)
pkgver=1.60.0
pkgrel=1
pkgdesc="Virtual filesystem implementation for GIO (with Google Drive backend)"
url="https://gitlab.gnome.org/fluhus/gvfs"
arch=(x86_64)
license=(LGPL-2.0-only)
depends=(
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
  libgudev
  libsecret
  libsoup3
  polkit
  procps-ng
  systemd
  systemd-libs
  udisks2
)
makedepends=(
  avahi
  dbus
  docbook-xsl
  git
  glib2-devel
  libgoa
  libgphoto2
  libimobiledevice
  libmtp
  libnfs
  libxml2
  meson
  msgraph
  openssh
  python
  smbclient
  wsdd
)
groups=(gnome)
source=(
  "git+https://gitlab.gnome.org/fluhus/gvfs.git#branch=googledrive"
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

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_gvfs() {
  optdepends=(
    'gvfs-afc: AFC support (Apple mobile devices)'
    'gvfs-dnssd: DNS-SD and WebDAV support (macOS file sharing)'
    'gvfs-goa:  Gnome Online Accounts support (e.g. OwnCloud)'
    'gvfs-google: Google Drive support'
    'gvfs-gphoto2: gphoto2 support (PTP camera, MTP media player)'
    'gvfs-mtp: MTP support (Android, media player)'
    'gvfs-nfs: NFS support'
    'gvfs-onedrive: Microsoft OneDrive support'
    'gvfs-smb: SMB/CIFS support (Windows file sharing)'
    'gvfs-wsdd: Web Services Dynamic Discovery support (Windows discovery)'
  )

  meson install -C build --destdir "$pkgdir"

  ( cd "$pkgdir"

    _pick afc \
      usr/lib/gvfs{-afc-volume-monitor,d-afc} \
      usr/lib/systemd/user/gvfs-afc-volume-monitor.service \
      usr/share/dbus-1/services/org.gtk.vfs.AfcVolumeMonitor.service \
      usr/share/gvfs/mounts/afc.mount \
      usr/share/gvfs/remote-volume-monitors/afc.monitor

    _pick dnssd \
      usr/lib/gvfsd-{dav,dnssd} \
      usr/share/GConf/gsettings/gvfs-dns-sd.convert \
      usr/share/glib-2.0/schemas/org.gnome.system.dns_sd.gschema.xml \
      usr/share/gvfs/mounts/{dav+sd,dav,dns-sd}.mount

    _pick goa \
      usr/lib/gvfs-goa-volume-monitor \
      usr/lib/systemd/user/gvfs-goa-volume-monitor.service \
      usr/share/dbus-1/services/org.gtk.vfs.GoaVolumeMonitor.service \
      usr/share/gvfs/remote-volume-monitors/goa.monitor

    _pick google \
      usr/lib/gvfsd-google \
      usr/share/gvfs/mounts/google.mount

    _pick gphoto2 \
      usr/lib/gvfs{-gphoto2-volume-monitor,d-gphoto2} \
      usr/lib/systemd/user/gvfs-gphoto2-volume-monitor.service \
      usr/share/dbus-1/services/org.gtk.vfs.GPhoto2VolumeMonitor.service \
      usr/share/gvfs/mounts/gphoto2.mount \
      usr/share/gvfs/remote-volume-monitors/gphoto2.monitor

    _pick mtp \
      usr/lib/gvfs{-mtp-volume-monitor,d-mtp} \
      usr/lib/systemd/user/gvfs-mtp-volume-monitor.service \
      usr/share/dbus-1/services/org.gtk.vfs.MTPVolumeMonitor.service \
      usr/share/gvfs/mounts/mtp.mount \
      usr/share/gvfs/remote-volume-monitors/mtp.monitor

    _pick nfs \
      usr/lib/gvfsd-nfs \
      usr/share/gvfs/mounts/nfs.mount

    _pick onedrive \
      usr/lib/gvfsd-onedrive \
      usr/share/gvfs/mounts/onedrive.mount

    _pick smb \
      usr/lib/gvfsd-smb{,-browse} \
      usr/share/GConf/gsettings/gvfs-smb.convert \
      usr/share/glib-2.0/schemas/org.gnome.system.smb.gschema.xml \
      usr/share/gvfs/mounts/smb{,-browse}.mount

    _pick wsdd \
      usr/lib/gvfsd-wsdd \
      usr/share/glib-2.0/schemas/org.gnome.system.wsdd.gschema.xml \
      usr/share/gvfs/mounts/wsdd.mount
  )

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
}

package_gvfs-afc() {
  pkgdesc+=" - AFC backend (Apple mobile devices)"
  depends=(
    "gvfs=$pkgver"
    glib2
    glibc
    libimobiledevice
    libplist
    usbmuxd
  )

  mv afc/* "$pkgdir"
}

package_gvfs-dnssd() {
  pkgdesc+=" - DNS-SD and WebDAV backend (macOS file sharing)"
  depends=(
    "gvfs=$pkgver"
    avahi
    dconf
    glib2
    glibc
    libsoup3
    libxml2
  )

  mv dnssd/* "$pkgdir"
}

package_gvfs-goa() {
  pkgdesc+=" - Gnome Online Accounts backend (e.g. OwnCloud)"
  depends=(
    "gvfs=$pkgver"
    glib2
    glibc
    libgcc
    libgoa
  )

  mv goa/* "$pkgdir"
}

package_gvfs-google() {
  pkgdesc+=" - Google Drive backend"
  depends=(
    "gvfs-goa=$pkgver"
    glib2
    glibc
    libgcc
    libgoa
  )

  mv google/* "$pkgdir"
}

package_gvfs-gphoto2() {
  pkgdesc+=" - gphoto2 backend (PTP camera, MTP media player)"
  depends=(
    "gvfs=$pkgver"
    glib2
    glibc
    libgcc
    libgphoto2
    libgudev
  )

  mv gphoto2/* "$pkgdir"
}

package_gvfs-mtp() {
  pkgdesc+=" - MTP backend (Android, media player)"
  depends=(
    "gvfs=$pkgver"
    glib2
    glibc
    libgcc
    libgudev
    libmtp
    libusb
  )

  mv mtp/* "$pkgdir"
}

package_gvfs-nfs() {
  pkgdesc+=" - NFS backend"
  depends=(
    "gvfs=$pkgver"
    glib2
    glibc
    libgcc
    libnfs
  )
  install=gvfs-nfs.install

  mv nfs/* "$pkgdir"
}

package_gvfs-onedrive() {
  pkgdesc+=" - Microsoft OneDrive backend"
  depends=(
    "gvfs-goa=$pkgver"
    glib2
    glibc
    libgcc
    libgoa
    msgraph
  )

  mv onedrive/* "$pkgdir"
}

package_gvfs-smb() {
  pkgdesc+=" - SMB/CIFS backend (Windows file sharing)"
  depends=(
    "gvfs=$pkgver"
    'smbclient>=4.12.0'
    dconf
    glib2
    glibc
    libgcc
  )

  mv smb/* "$pkgdir"
}

package_gvfs-wsdd() {
  pkgdesc+=" - Web Services Dynamic Discovery backend (Windows discovery)"
  depends=(
    "gvfs=$pkgver"
    dconf
    glib2
    glibc
    libgcc
    wsdd
  )

  mv wsdd/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
