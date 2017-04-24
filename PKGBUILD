# $Id: PKGBUILD 273603 2016-08-11 12:06:39Z heftig $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=gvfs-nosystemd
_pkgbase=gvfs
pkgname=(gvfs-nosystemd gvfs-{smb,afc,gphoto2,goa,mtp,nfs,google}-nosystemd)
pkgver=1.32.1
pkgrel=1
pkgdesc="Virtual filesystem implementation for GIO, nosystemd version"
url="https://wiki.gnome.org/Projects/gvfs"
arch=(i686 x86_64)
license=(LGPL)
depends=(avahi dconf fuse libarchive libcdio-paranoia libsoup udisks2 libsecret
         libbluray libgudev gcr psmisc)
makedepends=(dbus intltool libgphoto2 libimobiledevice smbclient docbook-xsl
             gtk3 libmtp gnome-online-accounts libnfs libgdata git gtk-doc python)
groups=(gnome)
_commit=4325a9be52a0c203384aa722aa440236eafded52  # tags/1.32.1^0
source=("git+https://git.gnome.org/browse/gvfs#commit=$_commit"
        gvfsd.hook)
sha256sums=('SKIP'
            '478b9cf7b4c242959fc640dbf0cd4935f16c59b81f5828a3af102d608d7a9d72')

prepare() {
  cd $_pkgbase
  NOCONFIGURE=1 ./autogen.sh
}

pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd $_pkgbase
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gvfs \
      --disable-systemd
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_gvfs-nosystemd() {
  replaces=(gvfs gvfs-{obexftp,afp})
  provides=(gvfs)
  conflicts=(gvfs)
  optdepends=('gvfs-afc-nosystemd: AFC (mobile devices) support'
              'gvfs-smb-nosystemd: SMB/CIFS (Windows client) support'
              'gvfs-gphoto2-nosystemd: gphoto2 (PTP camera/MTP media player) support'
              'gvfs-mtp-nosystemd: MTP device support'
              'gvfs-goa-nosystemd: gnome-online-accounts (e.g. OwnCloud) support'
              'gvfs-nfs-nosystemd: NFS support'
              'gvfs-google-nosystemd: Google Drive support'
              'gtk3: Recent files support')

  cd $_pkgbase
  sed -e 's/^am__append_3/#am__append_3/' \
      -e 's/^am__append_4/#am__append_4/' \
      -e 's/^am__append_5/#am__append_5/' \
      -e 's/^am__append_6/#am__append_6/' \
      -i monitor/Makefile
  make DESTDIR="$pkgdir" install

  install -Dm644 ../gvfsd.hook "$pkgdir/usr/share/libalpm/hooks/gvfsd.hook"
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"

  cd "$pkgdir"
  rm usr/lib/gvfs/gvfsd-{smb,smb-browse,afc,gphoto2,mtp,nfs,google}
  rm usr/share/gvfs/mounts/{smb,smb-browse,afc,gphoto2,mtp,nfs,google}.mount
  rm usr/share/glib-2.0/schemas/org.gnome.system.smb.gschema.xml
  rm usr/share/GConf/gsettings/gvfs-smb.convert
}

package_gvfs-smb-nosystemd() {
  pkgdesc+=" (SMB/CIFS backend; Windows client)"
  depends=("${pkgbase}=$pkgver" smbclient)
  _pkgname=${FUNCNAME[0]/#package_/}
  replaces=(${_pkgname/%-nosystemd/})
  provides=($replaces)
  conflicts=($replaces)

  cd $_pkgbase/daemon
  install -m755 -d "$pkgdir/usr/lib/gvfs"
  install -m755 -d "$pkgdir/usr/share/gvfs/mounts"

  install -m755 .libs/gvfsd-smb{,-browse} "$pkgdir/usr/lib/gvfs/"
  install -m644 smb{,-browse}.mount "$pkgdir/usr/share/gvfs/mounts/"

  install -Dm644 org.gnome.system.smb.gschema.xml \
    "$pkgdir/usr/share/glib-2.0/schemas/org.gnome.system.smb.gschema.xml"
  install -Dm644 gvfs-smb.convert \
    "$pkgdir/usr/share/GConf/gsettings/gvfs-smb.convert"
}

package_gvfs-afc-nosystemd() {
  pkgdesc+=" (AFC backend; Apple mobile devices)"
  depends=("${pkgbase}=$pkgver" libimobiledevice usbmuxd)
  _pkgname=${FUNCNAME[0]/#package_/}
  replaces=(${_pkgname/%-nosystemd/})
  provides=($replaces)
  conflicts=($replaces)

  cd $_pkgbase/daemon
  install -D .libs/gvfsd-afc "$pkgdir/usr/lib/gvfs/gvfsd-afc"
  install -Dm644 afc.mount "$pkgdir/usr/share/gvfs/mounts/afc.mount"

  cd "$srcdir/$_pkgbase/monitor/afc"
  make DESTDIR="$pkgdir" install
}

package_gvfs-gphoto2-nosystemd() {
  pkgdesc+=" (gphoto2 backend; PTP camera, MTP media player)"
  depends=("${pkgbase}=$pkgver" libgphoto2)
  _pkgname=${FUNCNAME[0]/#package_/}
  replaces=(${_pkgname/%-nosystemd/})
  provides=($replaces)
  conflicts=($replaces)

  cd $_pkgbase/daemon
  install -D .libs/gvfsd-gphoto2 "$pkgdir/usr/lib/gvfs/gvfsd-gphoto2"
  install -Dm644 gphoto2.mount "$pkgdir/usr/share/gvfs/mounts/gphoto2.mount"

  cd "$srcdir/$_pkgbase/monitor/gphoto2"
  make DESTDIR="$pkgdir" install
}

package_gvfs-mtp-nosystemd() {
  pkgdesc+=" (MTP backend; Android, media player)"
  depends=("${pkgbase}=$pkgver" libmtp)
  _pkgname=${FUNCNAME[0]/#package_/}
  replaces=(${_pkgname/%-nosystemd/})
  provides=($replaces)
  conflicts=($replaces)

  cd $_pkgbase/daemon
  install -D .libs/gvfsd-mtp "$pkgdir/usr/lib/gvfs/gvfsd-mtp"
  install -Dm644 mtp.mount "$pkgdir/usr/share/gvfs/mounts/mtp.mount"

  cd "$srcdir/$_pkgbase/monitor/mtp"
  make DESTDIR="$pkgdir" install
}

package_gvfs-goa-nosystemd() {
  pkgdesc+=" (Gnome Online Accounts backend; cloud storage)"
  depends=("${pkgbase}=$pkgver" gnome-online-accounts)
  _pkgname=${FUNCNAME[0]/#package_/}
  replaces=(${_pkgname/%-nosystemd/})
  provides=($replaces)
  conflicts=($replaces)

  cd "$srcdir/$_pkgbase/monitor/goa"
  make DESTDIR="$pkgdir" install
}

package_gvfs-nfs-nosystemd() {
  pkgdesc+=" (NFS backend)"
  depends=("${pkgbase}=$pkgver" libnfs)
  _pkgname=${FUNCNAME[0]/#package_/}
  replaces=(${_pkgname/%-nosystemd/})
  provides=($replaces)
  conflicts=($replaces)
  install=gvfs-nfs.install

  cd $_pkgbase/daemon
  install -D .libs/gvfsd-nfs "$pkgdir/usr/lib/gvfs/gvfsd-nfs"
  install -Dm644 nfs.mount "$pkgdir/usr/share/gvfs/mounts/nfs.mount"
}

package_gvfs-google-nosystemd() {
  pkgdesc+=" (Google Drive backend)"
  depends=("gvfs-goa-nosystemd=$pkgver" libgdata)
  _pkgname=${FUNCNAME[0]/#package_/}
  replaces=(${_pkgname/%-nosystemd/})
  provides=($replaces)
  conflicts=($replaces)

  cd $_pkgbase/daemon
  install -D .libs/gvfsd-google "$pkgdir/usr/lib/gvfs/gvfsd-google"
  install -Dm644 google.mount "$pkgdir/usr/share/gvfs/mounts/google.mount"
}
