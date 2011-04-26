# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=libvirt
pkgver=0.9.0
pkgrel=3
pkgdesc="API for controlling virtualization engines (openvz,kvm,qemu,virtualbox,xen,etc)"
arch=('i686' 'x86_64')
url="http://libvirt.org/"
license=('LGPL')
depends=('e2fsprogs' 'gnutls' 'iptables' 'libxml2' 'parted' 'polkit' 'python2'
	 'avahi' 'yajl' 'libpciaccess' 'udev' 'dbus-core' 'libxau' 'libxdmcp' 'libpcap'
	 'curl' 'libsasl' 'libgcrypt' 'libgpg-error' 'openssl' 'libxcb' 'gcc-libs'
	 'iproute2')
makedepends=('pkgconfig' 'lvm2')
optdepends=('bridge-utils: for briged networking (default)'
	    'dnsmasq: for NAT/DHCP for guests'
	    'kernel26-ovz24: for openvz guests'
	    'kvm'
	    'lxc'
	    'openbsd-netcat: for remote management over ssh'
	    'qemu'
	    'user-mode-linux'
	    'virtualbox_bin'
	    'virtualbox-ose'
	    'xen')
options=('emptydirs' '!libtool')
backup=('etc/conf.d/libvirtd'
	'etc/libvirt/libvirtd.conf'
	'etc/libvirt/qemu.conf'
	'etc/sasl2/libvirt.conf')
install="libvirt.install"
source=("http://libvirt.org/sources/$pkgname-$pkgver.tar.gz"
	libvirtd.rc.d
	libvirtd.conf.d
	openbsd-netcat-default.patch
	unixperms.patch
	yajl-2.x.patch)
md5sums=('53d005e6f3732aba1fd6b2718f9cec99'
         '018d97dafc0049075fba6f2850f17a12'
         '3ed0e24f5b5e25bf553f5427d64915e6'
         '7d5a841d51321be56ad3c4f93d112fb0'
         'db95aecdf2ccf3693fef5821cdcb7eba'
         '5745bb8d0b254abb7a3528c66e03b0f9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fix
  export PYTHON=`which python2`
  for file in $(find . -name '*.py' -print); do
    sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

#  for more information on authentication see http://libvirt.org/auth.html
#  If you wish to have unix-permissions based access rather than only polkit
#  access, create a group called libvirt and uncomment the line below:
#  patch -Np1 -i "$srcdir"/unixperms.patch

  [ $NOEXTRACT -eq 1 ] || patch -Np1 -i "$srcdir"/openbsd-netcat-default.patch

  # fixes for yajl 2.0 API changes
  [ $NOEXTRACT -eq 1 ] || patch -Np1 -i "$srcdir/yajl-2.x.patch"

  export LDFLAGS=-lX11
  [ -f Makefile ] || ./configure --prefix=/usr --libexec=/usr/lib/"$pkgname" \
	--with-storage-lvm --without-xen --with-udev --without-hal
  find -name Makefile -exec sed -i 's#-L /usr#-L/usr#' {} \;
  make -j1
  make DESTDIR="$pkgdir" install
  install -D -m755 "$srcdir"/libvirtd.rc.d "$pkgdir"/etc/rc.d/libvirtd
  install -D -m644 "$srcdir"/libvirtd.conf.d "$pkgdir"/etc/conf.d/libvirtd
  rm -rf $pkgdir/var/run
}
