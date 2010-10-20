# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=libvirt
pkgver=0.8.4
pkgrel=3
pkgdesc="API for controlling virtualization engines (openvz,kvm,qemu,virtualbox,xen,etc)"
arch=('i686' 'x86_64')
url="http://libvirt.org/"
license=('LGPL')
depends=('e2fsprogs' 'gnutls' 'iptables' 'libxml2' 'parted' 'polkit' 'python2'
	 'avahi' 'yajl' 'libpciaccess')
makedepends=('avahi' 'libsasl' 'pkgconfig' 'lvm2')
optdepends=('avahi: for network discovery'
	    'bridge-utils: for briged networking (default)'
	    'dnsmasq: for NAT/DHCP for guests'
	    'hal'
	    'kernel26-ovz24: for openvz guests'
	    'kvm'
	    'libsasl: for sasl support'
	    'lxc'
	    'openbsd-netcat: for remote management over ssh'
	    'qemu'
	    'user-mode-linux'
	    'virtualbox_bin'
	    'virtualbox-ose'
	    'xen')
options=("emptydirs")
backup=('etc/conf.d/libvirtd' 'etc/libvirt/libvirtd.conf' 'etc/libvirt/qemu.conf' 'etc/sasl2/libvirt.conf')
install="libvirt.install"
source=("http://libvirt.org/sources/$pkgname-$pkgver.tar.gz"
	libvirtd.rc.d
	libvirtd.conf.d
	unixperms.patch)
md5sums=('a9300a068a07bcd72f86e4967d7f4d69'
         '5ffe22be0f43ed7c6468b79cd1a9f114'
         'cb4e9bc6b209c1f3077d3698bf1d4437'
         'db95aecdf2ccf3693fef5821cdcb7eba')

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

  export LDFLAGS=-lX11
  ./configure --prefix=/usr --libexec=/usr/lib/"$pkgname" \
	--with-storage-lvm --without-xen
  find -name Makefile -exec sed -i 's#-L /usr#-L/usr#' {} \;
  make -j1
  make DESTDIR="$pkgdir" install
  install -D -m755 "$srcdir"/libvirtd.rc.d "$pkgdir"/etc/rc.d/libvirtd
  install -D -m644 "$srcdir"/libvirtd.conf.d "$pkgdir"/etc/conf.d/libvirtd
}
