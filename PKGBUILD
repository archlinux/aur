# $Id: PKGBUILD 82286 2013-01-14 10:03:34Z spupykin $
# Maintainer: Arthur Borsboom <arthurborsboom@gmail.com>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=libvirt-git
pkgver=1.2.11.5.gc5a5491
pkgrel=1
pkgdesc="API for controlling virtualization engines (openvz,kvm,qemu,virtualbox,xen,etc)"
arch=('i686' 'x86_64')
url="http://libvirt.org/"
license=('LGPL')
depends=('e2fsprogs' 'gnutls' 'iptables' 'libxml2' 'parted' 'polkit' 'python'
	 'avahi' 'yajl' 'libpciaccess' 'udev' 'dbus-core' 'libxau' 'libxdmcp' 'libpcap'
	 'curl' 'libsasl' 'libgcrypt' 'libgpg-error' 'openssl' 'libxcb' 'gcc-libs'
	 'iproute2' 'libnl' 'libx11' 'perl-xml-xpath')
makedepends=('git' 'pkgconfig' 'lvm2' 'linux-api-headers' 'dnsmasq' 'libxslt' 'xhtml-docs')
optdepends=('bridge-utils: for briged networking (default)'
	    'dnsmasq: for NAT/DHCP for guests'
	    'openbsd-netcat: for remote management over ssh'
	    'qemu'
	    'radvd'
	    'dmidecode'
	    'ebtables'
	    'pm-utils: host power management'
	    'audit')
conflicts=('libvirt')
provides=('libvirt')
options=('emptydirs')
backup=('etc/conf.d/libvirt-guests'
	'etc/conf.d/libvirtd'
	'etc/libvirt/libvirt.conf'
	'etc/libvirt/libvirtd.conf'
	'etc/libvirt/lxc.conf'
	'etc/libvirt/nwfilter/allow-arp.xml'
	'etc/libvirt/nwfilter/allow-dhcp-server.xml'
	'etc/libvirt/nwfilter/allow-dhcp.xml'
	'etc/libvirt/nwfilter/allow-incoming-ipv4.xml'
	'etc/libvirt/nwfilter/allow-ipv4.xml'
	'etc/libvirt/nwfilter/clean-traffic.xml'
	'etc/libvirt/nwfilter/no-arp-ip-spoofing.xml'
	'etc/libvirt/nwfilter/no-arp-mac-spoofing.xml'
	'etc/libvirt/nwfilter/no-arp-spoofing.xml'
	'etc/libvirt/nwfilter/no-ip-multicast.xml'
	'etc/libvirt/nwfilter/no-ip-spoofing.xml'
	'etc/libvirt/nwfilter/no-mac-broadcast.xml'
	'etc/libvirt/nwfilter/no-mac-spoofing.xml'
	'etc/libvirt/nwfilter/no-other-l2-traffic.xml'
	'etc/libvirt/nwfilter/no-other-rarp-traffic.xml'
	'etc/libvirt/nwfilter/qemu-announce-self-rarp.xml'
	'etc/libvirt/nwfilter/qemu-announce-self.xml'
	'etc/libvirt/qemu-lockd.conf'
	'etc/libvirt/qemu.conf'
	'etc/libvirt/qemu/networks/autostart/default.xml'
	'etc/libvirt/qemu/networks/default.xml'
	'etc/libvirt/virt-login-shell.conf'
	'etc/libvirt/virtlockd.conf'
	'etc/logrotate.d/libvirtd'
	'etc/logrotate.d/libvirtd.lxc'
	'etc/logrotate.d/libvirtd.qemu'
	'etc/logrotate.d/libvirtd.uml'
	'etc/sasl2/libvirt.conf')
install="libvirt.install"
source=('git+git://libvirt.org/libvirt.git'
	libvirtd.conf.d
	libvirtd-guests.conf.d
	libvirt.tmpfiles.d)
sha512sums=('SKIP'
	    'eebc616fcdf3c92338f3967f99701ed2d156d4a3835c31aebe8299b2f5fe00717f09ee2da79b3d5810348033f0b82ff05c70a775a8309d886919e75fa862e302'
	    '9012a2bd2b262a6f95d739f97b6ebc6938310616aca05d501efd9d3fc69d71500366dcfe9046a37f8ce30929bcd6eea9cf6770cf757998ecce4b475a25914801'
	    '9e3e9f479b17528d70e812e6851cf4209ad73b577d478170bf7d80f075be4f2ee2e28adbe1e542002bbaea15e34830ff60e4ca2e34a5ac5a925440ca25864c31')

pkgver() {
  cd "$SRCDEST/libvirt"
  git describe --always | sed 's|-|.|g' | sed 's/^.//'
}

build() {
  cd "$srcdir/libvirt"

  export LDFLAGS=-lX11
  export RADVD=/usr/bin/radvd
  NOCONFIGURE=1 ./autogen.sh 
  #./configure --prefix=/usr --libexec=/usr/lib/"$pkgname" --sbindir=/usr/bin \
  #./configure --prefix=/usr --libexec=/usr/lib/"${pkgname/-git/}" --sbindir=/usr/bin \
	#--with-storage-lvm --without-xen --with-udev --without-hal --disable-static \
	#--with-init-script=systemd --with-audit \
	#--with-qemu-user=nobody --with-qemu-group=nobody \
	#--without-netcf --with-interface --with-lxc
  ./configure --prefix=/usr --libexec=/usr/lib/"${pkgname/-git/}" --sbindir=/usr/bin --with-init-script=systemd
  make

  sed -i 's|/etc/sysconfig/|/etc/conf.d/|' daemon/libvirtd.service tools/libvirt-guests.service
  sed -i 's|@sbindir@|/usr/bin|g' src/virtlockd.service
  # sed -i 's|#group =.*|group="kvm"|' src/qemu/qemu.conf
}

package() {
  cd "$srcdir/libvirt"
  make DESTDIR="$pkgdir" install

  install -D -m644 "$srcdir"/libvirtd.conf.d "$pkgdir"/etc/conf.d/libvirtd
  install -D -m644 "$srcdir"/libvirtd-guests.conf.d "$pkgdir"/etc/conf.d/libvirt-guests

  # systemd stuff
  install -D -m644 "$srcdir"/libvirt.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/libvirt.conf

  rm -rf \
	"$pkgdir"/var/run \
	"$pkgdir"/etc/sysconfig \
	"$pkgdir"/etc/rc.d/init.d \
	"$pkgdir"/lib \
	"$pkgdir"/etc/sysctl.d
}
