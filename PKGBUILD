# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=libvirt
pkgver=0.10.0
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
	openbsd-netcat-default.patch
	libvirt-libnl3.patch
	xdg.patch)
md5sums=('63ceb65bba07fc7690499d9eb6d2c844'
         'c43244c40a0437038c82089618e7beaa'
         '3ed0e24f5b5e25bf553f5427d64915e6'
         '8297b1be794a24cc77f66af9380ace59'
         'bc2971dacdbac967fc3474e50affc345'
         '8d98e62915785686b0b6c8c070628392'
         '456723b41903d3aaa7ec948c1feea265'
         'ba27fbcd989de8d84cfff98326f10c54'
         '9b9fcdbd64d37d84ae73d9da0a7efed7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fix
  export PYTHON=`which python2`
  for file in $(find . -name '*.py' -print); do
    sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  patch -Np1 -i "$srcdir"/openbsd-netcat-default.patch
#  patch -Np1 -i ${srcdir}/libvirt-libnl3.patch
#  patch -Np1 -i ${srcdir}/xdg.patch
#  aclocal
#  automake --add-missing || true
#  autoreconf

  export LDFLAGS=-lX11
  export RADVD=/usr/sbin/radvd
  [ -f Makefile ] || ./configure --prefix=/usr --libexec=/usr/lib/"$pkgname" \
	--with-storage-lvm --without-xen --with-udev --without-hal --disable-static \
	--with-init-script=systemd
  make -j1
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

  rm -rf \
	$pkgdir/var/run \
	$pkgdir/etc/rc.d/init.d \
	$pkgdir/etc/sysconfig \
	$pkgdir/lib \
	$pkgdir/etc/sysctl.d
}
