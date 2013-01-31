# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=libvirt
pkgver=1.0.2
pkgrel=2
pkgdesc="API for controlling virtualization engines (openvz,kvm,qemu,virtualbox,xen,etc)"
arch=('i686' 'x86_64')
url="http://libvirt.org/"
license=('LGPL')
depends=('e2fsprogs' 'gnutls' 'iptables' 'libxml2' 'parted' 'polkit' 'python2'
	 'avahi' 'yajl' 'libpciaccess' 'udev' 'dbus-core' 'libxau' 'libxdmcp' 'libpcap'
	 'curl' 'libsasl' 'libgcrypt' 'libgpg-error' 'openssl' 'libxcb' 'gcc-libs'
	 'iproute2' 'libnl' 'libx11' 'audit')
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
	libvirt.tmpfiles.d)
md5sums=('7e268ed702c4331d393e5b43449cae13'
         'c43244c40a0437038c82089618e7beaa'
         '3ed0e24f5b5e25bf553f5427d64915e6'
         '0ee5b6c58590ff392a266f20f7928d1f'
         '0a96ed876ffb1fcb9dff5a9b3a609c1e'
         '020971887442ebbf1b6949e031c8dd3f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fix
  export PYTHON=`which python2`
  for file in $(find . -name '*.py' -print); do
    sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  export LDFLAGS=-lX11
  export RADVD=/usr/sbin/radvd
  [ -f Makefile ] || ./configure --prefix=/usr --libexec=/usr/lib/"$pkgname" \
	--with-storage-lvm --without-xen --with-udev --without-hal --disable-static \
	--with-init-script=systemd --with-audit \
	--with-qemu-user=nobody --with-qemu-group=nobody \
	--without-netcf --with-interface
  make
  sed -i 's|/etc/sysconfig/libvirtd|/etc/conf.d/libvirtd|' daemon/libvirtd.service
  sed -i 's|/etc/sysconfig/libvirt-guests|/etc/conf.d/libvirtd-guests|' tools/libvirt-guests.service
  sed -i 's|/etc/init.d/libvirt-g|/etc/rc.d/libvirtd-g|g' tools/libvirt-guests.service
  sed -i 's|@sbindir@|/usr/sbin|g' src/virtlockd.service
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -D -m755 "$srcdir"/libvirtd.rc.d "$pkgdir"/etc/rc.d/libvirtd
  install -D -m644 "$srcdir"/libvirtd.conf.d "$pkgdir"/etc/conf.d/libvirtd

  install -D -m755 "$srcdir"/libvirtd-guests.rc.d "$pkgdir"/etc/rc.d/libvirtd-guests
  install -D -m644 "$srcdir"/libvirtd-guests.conf.d "$pkgdir"/etc/conf.d/libvirtd-guests

  # systemd stuff
  install -D -m644 "$srcdir"/libvirt.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/libvirt.conf
  mv "$pkgdir"/lib/* "$pkgdir"/usr/lib/

  sed -i \
	's|After=.*|After=syslog.target network.target libvirtd.service|' \
	"$pkgdir"/usr/lib/systemd/system/libvirt-guests.service

  rm -rf \
	"$pkgdir"/var/run \
	"$pkgdir"/etc/sysconfig \
	"$pkgdir"/etc/rc.d/init.d \
	"$pkgdir"/lib \
	"$pkgdir"/etc/sysctl.d
}
