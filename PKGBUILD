# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=libvirt
pkgver=0.9.9
pkgrel=1
pkgdesc="API for controlling virtualization engines (openvz,kvm,qemu,virtualbox,xen,etc)"
arch=('i686' 'x86_64')
url="http://libvirt.org/"
license=('LGPL')
depends=('e2fsprogs' 'gnutls' 'iptables' 'libxml2' 'parted' 'polkit' 'python2'
	 'avahi' 'yajl' 'libpciaccess' 'udev' 'dbus-core' 'libxau' 'libxdmcp' 'libpcap'
	 'curl' 'libsasl' 'libgcrypt' 'libgpg-error' 'openssl' 'libxcb' 'gcc-libs'
	 'iproute2' 'netcf')
makedepends=('pkgconfig' 'lvm2')
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
	openbsd-netcat-default.patch
	unixperms.patch
	yajl-2.x.patch)
md5sums=('37c4bf8cdd4c76150bc0c1d249945d27'
         'c43244c40a0437038c82089618e7beaa'
         '3ed0e24f5b5e25bf553f5427d64915e6'
         '737ec24aa56871fbabfa892789457db4'
         'bc2971dacdbac967fc3474e50affc345'
         'b0be50eb9dfe4d133decf23b60880f7d'
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
#  [ $NOEXTRACT -eq 1 ] || patch -Np1 -i "$srcdir/yajl-2.x.patch"

  export LDFLAGS=-lX11
  [ -f Makefile ] || ./configure --prefix=/usr --libexec=/usr/lib/"$pkgname" \
	--with-storage-lvm --without-xen --with-udev --without-hal
  find -name Makefile -exec sed -i 's#-L /usr#-L/usr#' {} \;
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -D -m755 "$srcdir"/libvirtd.rc.d "$pkgdir"/etc/rc.d/libvirtd
  install -D -m644 "$srcdir"/libvirtd.conf.d "$pkgdir"/etc/conf.d/libvirtd

  install -D -m755 "$srcdir"/libvirtd-guests.rc.d "$pkgdir"/etc/rc.d/libvirtd-guests
  install -D -m644 "$srcdir"/libvirtd-guests.conf.d "$pkgdir"/etc/conf.d/libvirtd-guests

  rm -rf $pkgdir/var/run
}
