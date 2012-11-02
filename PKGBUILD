# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=libvirt
pkgver=1.0.0
pkgrel=1
pkgdesc="API for controlling virtualization engines (openvz,kvm,qemu,virtualbox,xen,etc)"
arch=('i686' 'x86_64')
url="http://libvirt.org/"
license=('LGPL')
depends=('e2fsprogs' 'gnutls' 'iptables' 'libxml2' 'parted' 'polkit' 'python2'
	 'avahi' 'yajl' 'libpciaccess' 'udev' 'dbus-core' 'libxau' 'libxdmcp' 'libpcap'
	 'curl' 'libsasl' 'libgcrypt' 'libgpg-error' 'openssl' 'libxcb' 'gcc-libs'
	 'iproute2' 'netcf' 'libnl')
makedepends=('pkgconfig' 'lvm2' 'linux-api-headers')
optdepends=('bridge-utils: for briged networking (default)'
	    'dnsmasq: for NAT/DHCP for guests'
	    'kvm'
	    'openbsd-netcat: for remote management over ssh'
	    'qemu'
	    'radvd'
	    'dmidecode')
options=('emptydirs' '!libtool')
backup=('etc/conf.d/libvirtd'
	'etc/conf.d/libvirtd-guests'
	'etc/libvirt/libvirtd.conf'
	'etc/libvirt/libvirt.conf'
	'etc/libvirt/qemu.conf'
	'etc/sasl2/libvirt.conf')
install="libvirt.install"
source=("http://libvirt.org/sources/$pkgname-$pkgver.tar.gz"
	libvirtd.rc.d
	libvirtd.conf.d
	libvirtd-guests.rc.d
	libvirtd-guests.conf.d
	libvirt.tmpfiles.d
	openbsd-netcat-default.patch)
md5sums=('7c8b006de7338e30866bb56738803b21'
         'c43244c40a0437038c82089618e7beaa'
         '3ed0e24f5b5e25bf553f5427d64915e6'
         'b47419dfd8c40d1b37fae6576d07baa0'
         '0a96ed876ffb1fcb9dff5a9b3a609c1e'
         '8d98e62915785686b0b6c8c070628392'
         '456723b41903d3aaa7ec948c1feea265')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fix
  export PYTHON=`which python2`
  for file in $(find . -name '*.py' -print); do
    sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  patch -Np1 -i "$srcdir"/openbsd-netcat-default.patch

  export LDFLAGS=-lX11
  export RADVD=/usr/sbin/radvd
  [ -f Makefile ] || ./configure --prefix=/usr --libexec=/usr/lib/"$pkgname" \
	--with-storage-lvm --without-xen --with-udev --without-hal --disable-static \
	--with-init-script=systemd
  make -j1
  sed -i 's|/etc/sysconfig/libvirtd|/etc/conf.d/libvirtd|' daemon/libvirtd.service
  sed -i 's|/etc/sysconfig/libvirt-guests|/etc/conf.d/libvirtd-guests|' tools/libvirt-guests.service
  sed -i 's|/etc/init.d/libvirt-g|/etc/rc.d/libvirtd-g|g' tools/libvirt-guests.service
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -D -m755 "$srcdir"/libvirtd.rc.d "$pkgdir"/etc/rc.d/libvirtd
  install -D -m644 "$srcdir"/libvirtd.conf.d "$pkgdir"/etc/conf.d/libvirtd

  install -D -m755 "$srcdir"/libvirtd-guests.rc.d "$pkgdir"/etc/rc.d/libvirtd-guests
  install -D -m644 "$srcdir"/libvirtd-guests.conf.d "$pkgdir"/etc/conf.d/libvirtd-guests


  install -dm0755 $pkgdir/usr/lib/sysctl.d
  mv $pkgdir/etc/sysctl.d/libvirtd $pkgdir/usr/lib/sysctl.d/libvirtd

  # systemd stuff
  install -D -m644 "$srcdir"/libvirt.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/libvirt.conf
  mv $pkgdir/lib/* $pkgdir/usr/lib/

  sed -i \
	's|After=.*|After=syslog.target network.target libvirtd.service|' \
	$pkgdir/usr/lib/systemd/system/libvirt-guests.service

  rm -rf \
	$pkgdir/var/run \
	$pkgdir/etc/sysconfig \
	$pkgdir/etc/rc.d/init.d \
	$pkgdir/lib \
	$pkgdir/etc/sysctl.d
}
