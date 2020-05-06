pkgbase=gvfs-git
_pkgbase=gvfs
pkgname=(gvfs-git gvfs-{smb,afc,gphoto2,goa,mtp,nfs,google}-git)
pkgver=1.44.1+4+g94e12375
pkgrel=1
pkgdesc="Virtual filesystem implementation for GIO"
url="https://wiki.gnome.org/Projects/gvfs"
arch=(x86_64)
license=(LGPL)
depends=('avahi' 'dconf' 'fuse3' 'libarchive' 'libcdio-paranoia' 'libsoup' 'udisks2' 'libsecret'
         'libbluray' 'libgudev' 'gcr' 'psmisc' 'gsettings-desktop-schemas>=3.34.0')
makedepends=('dbus' 'libgphoto2' 'libimobiledevice' 'smbclient' 'docbook-xsl' 'gtk3' 'libmtp'
             'gnome-online-accounts' 'libnfs' 'libgdata' 'git' 'gtk-doc' 'python' 'meson'
             'openssh')
source=("git+https://gitlab.gnome.org/GNOME/gvfs.git"
        gvfsd.hook)
sha512sums=('SKIP'
            'eb54f22e7d06f226160a2a8cac613f6e761d3f059f98e29c9cf49f0c2afa9126841338812000c402046e8373e56a01f958ecdd169161706a0e0dc09bc6112917')

pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgbase build -D man=true
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

_split() {
  local name="$1" src dest; shift
  for src; do
    echo "$name: /usr/$src"
    dest="$srcdir/$name/$src"
    mkdir -p "${dest%/*}"
    mv -T "$src" "$dest"
    rmdir -p --ignore-fail-on-non-empty "${src%/*}"
  done
}

package_gvfs-git() {
  replaces=(gvfs-{obexftp,afp})
  optdepends=('gvfs-afc: AFC (mobile devices) support'
              'gvfs-smb: SMB/CIFS (Windows client) support'
              'gvfs-gphoto2: gphoto2 (PTP camera/MTP media player) support'
              'gvfs-mtp: MTP device support'
              'gvfs-goa: gnome-online-accounts (e.g. OwnCloud) support'
              'gvfs-nfs: NFS support'
              'gvfs-google: Google Drive support'
              'gtk3: Recent files support')
  provides=('gvfs')
  conflicts=('gvfs')
  options=(!emptydirs)

  DESTDIR="$pkgdir" meson install -C build

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"

  cd "$pkgdir/usr"

  _split smb \
    lib/gvfsd-smb{,-browse} \
    share/GConf/gsettings/gvfs-smb.convert \
    share/glib-2.0/schemas/org.gnome.system.smb.gschema.xml \
    share/gvfs/mounts/smb{,-browse}.mount

  _split afc \
    lib/gvfs{-afc-volume-monitor,d-afc} \
    lib/systemd/user/gvfs-afc-volume-monitor.service \
    share/dbus-1/services/org.gtk.vfs.AfcVolumeMonitor.service \
    share/gvfs/mounts/afc.mount \
    share/gvfs/remote-volume-monitors/afc.monitor

  _split gphoto2 \
    lib/gvfs{-gphoto2-volume-monitor,d-gphoto2} \
    lib/systemd/user/gvfs-gphoto2-volume-monitor.service \
    share/dbus-1/services/org.gtk.vfs.GPhoto2VolumeMonitor.service \
    share/gvfs/mounts/gphoto2.mount \
    share/gvfs/remote-volume-monitors/gphoto2.monitor

  _split mtp \
    lib/gvfs{-mtp-volume-monitor,d-mtp} \
    lib/systemd/user/gvfs-mtp-volume-monitor.service \
    share/dbus-1/services/org.gtk.vfs.MTPVolumeMonitor.service \
    share/gvfs/mounts/mtp.mount \
    share/gvfs/remote-volume-monitors/mtp.monitor

  _split goa \
    lib/gvfs-goa-volume-monitor \
    lib/systemd/user/gvfs-goa-volume-monitor.service \
    share/dbus-1/services/org.gtk.vfs.GoaVolumeMonitor.service \
    share/gvfs/remote-volume-monitors/goa.monitor

  _split nfs \
    lib/gvfsd-nfs \
    share/gvfs/mounts/nfs.mount

  _split google \
    lib/gvfsd-google \
    share/gvfs/mounts/google.mount
}

package_gvfs-smb-git() {
  pkgdesc+=" (SMB/CIFS backend; Windows client)"
  depends=("gvfs-git=$pkgver" 'smbclient>=4.12.0')
  provides=('gvfs-smb')
  conflicts=('gvfs-smb')

  mv "$srcdir/smb" "$pkgdir/usr"
}

package_gvfs-afc-git() {
  pkgdesc+=" (AFC backend; Apple mobile devices)"
  depends=("gvfs-git=$pkgver" 'libimobiledevice' 'usbmuxd')
  provides=('gvfs-afc')
  conflicts=('gvfs-afc')

  mv "$srcdir/afc" "$pkgdir/usr"
}

package_gvfs-gphoto2-git() {
  pkgdesc+=" (gphoto2 backend; PTP camera, MTP media player)"
  depends=("gvfs-git=$pkgver" 'libgphoto2')
  provides=('gvfs-gphoto2')
  conflicts=('gvfs-gphoto2')

  mv "$srcdir/gphoto2" "$pkgdir/usr"
}

package_gvfs-mtp-git() {
  pkgdesc+=" (MTP backend; Android, media player)"
  depends=("gvfs-git=$pkgver" 'libmtp')
  provides=('gvfs-mtp')
  conflicts=('gvfs-mtp')

  mv "$srcdir/mtp" "$pkgdir/usr"
}

package_gvfs-goa-git() {
  pkgdesc+=" (Gnome Online Accounts backend; cloud storage)"
  depends=("gvfs-git=$pkgver" 'gnome-online-accounts')
  provides=('gvfs-goa')
  conflicts=('gvfs-goa')

  mv "$srcdir/goa" "$pkgdir/usr"
}

package_gvfs-nfs-git() {
  pkgdesc+=" (NFS backend)"
  depends=("gvfs-git=$pkgver" 'libnfs')
  install=gvfs-nfs.install
  provides=('gvfs-nfs')
  conflicts=('gvfs-nfs')

  mv "$srcdir/nfs" "$pkgdir/usr"
}

package_gvfs-google-git() {
  pkgdesc+=" (Google Drive backend)"
  depends=("gvfs-goa-git=$pkgver" 'libgdata')
  provides=('gvfs-google')
  conflicts=('gvfs-google')

  mv "$srcdir/google" "$pkgdir/usr"
}

# vim:set sw=2 et:
