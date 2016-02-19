# $Id: PKGBUILD 250481 2015-11-09 22:26:39Z heftig $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=gvfs-nosystemd
_pkgbase=gvfs
pkgname=$pkgbase
pkgver=1.26.3
pkgrel=1
arch=(i686 x86_64)
license=(LGPL)
makedepends=(avahi dbus fuse intltool libarchive libcdio-paranoia libgphoto2 libimobiledevice
             libsoup smbclient udisks2 libsecret docbook-xsl gtk3 libmtp gnome-online-accounts
             libbluray libgudev libnfs libgdata)
url="http://www.gnome.org"
groups=(gnome)
conflicts=($_pkgbase)
provides=($_pkgbase=$pkgver)
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgbase/${pkgver:0:4}/$_pkgbase-$pkgver.tar.xz)
sha256sums=('a70f75fa60d66f3f478c0c8aec43d0e43455a8cc75a4dfa8029e51c816401b4a')

prepare() {
  cd "$_pkgbase-$pkgver"
}

build() {
  cd "$_pkgbase-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gvfs \
      --with-bash-completion-dir=/usr/share/bash-completion/completions \
      --disable-systemd
  make
}

package_gvfs-nosystemd() {
  pkgdesc="Userspace virtual filesystem implemented as a pluggable module for gio"
  depends=(avahi dconf fuse libarchive libcdio-paranoia libsoup udisks2 libsecret libbluray libgudev gcr)
  replaces=(gvfs-{obexftp,afp})
  optdepends=('gvfs-afc: AFC (mobile devices) support'
              'gvfs-smb: SMB/CIFS (Windows client) support'
              'gvfs-gphoto2: gphoto2 (PTP camera/MTP media player) support'
              'gvfs-mtp: MTP device support'
              'gvfs-goa: gnome-online-accounts (e.g. OwnCloud) support'
              'gvfs-nfs: NFS support'
              'gvfs-google: Google Drive support'
              'gtk3: Recent files support')
  install=gvfs.install

  cd "$_pkgbase-$pkgver"
  sed -e 's/^am__append_4/#am__append_4/' \
      -e 's/^am__append_5/#am__append_5/' \
      -e 's/^am__append_6/#am__append_6/' \
      -e 's/^am__append_7/#am__append_7/' \
      -i monitor/Makefile
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"
  rm usr/lib/gvfs/gvfsd-{smb,smb-browse,afc,gphoto2,mtp,google}
  rm usr/share/gvfs/mounts/{smb,smb-browse,afc,gphoto2,mtp,google}.mount
  rm usr/share/glib-2.0/schemas/org.gnome.system.smb.gschema.xml
  rm usr/share/GConf/gsettings/gvfs-smb.convert
}
