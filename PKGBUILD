# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=libvirt
pkgver=0.8.1
pkgrel=1
pkgdesc="API for controlling virtualization engines (openvz,kvm,qemu,virtualbox,xen,etc)"
arch=('i686' 'x86_64')
url="http://libvirt.org/"
license=('LGPL')
depends=('e2fsprogs' 'gnutls' 'iptables' 'libxml2' 'parted' 'polkit' 'python'
	 'avahi' 'yajl' 'libpciaccess')
makedepends=('avahi' 'libsasl' 'pkgconfig' 'lvm2')
optdepends=('avahi: for network discovery'
	    'bridge-utils: for briged networking (default)'
	    'dnsmasq: for NAT/DHCP for guests'
	    'hal'
	    'kernel26-ovz24: for openvz guests'
	    'kvm'
	    'libsasl: for sasl support'
	    'lxc' 'openbsd-netcat: for remote management over ssh'
	    'qemu'
	    'user-mode-linux'
	    'virtualbox_bin'
	    'virtualbox-ose'
	    'xen')
options=("emptydirs")
backup=('/etc/conf.d/libvirtd' '/etc/libvirt/libvirtd.conf' '/etc/libvirt/qemu.conf' '/etc/sasl2/libvirt.conf')
install="libvirt.install"
source=("http://libvirt.org/sources/$pkgname-$pkgver.tar.gz"
	libvirtd.rc.d
	libvirtd.conf.d
	unixperms.patch)
md5sums=('2557c08801dfccf07871e4e2e35ccfcd'
         '5ffe22be0f43ed7c6468b79cd1a9f114'
         'cb4e9bc6b209c1f3077d3698bf1d4437'
         'db95aecdf2ccf3693fef5821cdcb7eba')

build() {
  cd "$srcdir/$pkgname-$pkgver" || return 1

#  for more information on authentication see http://libvirt.org/auth.html
#  If you wish to have unix-permissions based access rather than only polkit
#  access, create a group called libvirt and uncomment the line below:
#  patch -Np1 -i "$srcdir"/unixperms.patch || return 1

  export LDFLAGS=-lX11
  ./configure --prefix=/usr --libexec=/usr/lib/"$pkgname" \
	--with-storage-lvm --without-xen || return 1
  find -name Makefile -exec sed -i 's#-L /usr#-L/usr#' {} \;
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
  install -D -m755 "$startdir"/libvirtd.rc.d "$pkgdir"/etc/rc.d/libvirtd || return 1
  install -D -m644 "$startdir"/libvirtd.conf.d "$pkgdir"/etc/conf.d/libvirtd || return 1
}
