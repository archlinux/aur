# $Id$
# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Arthur Borsboom <arthurborsboom@gmail.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=libvirt-git
pkgver=6.5.0.rc2.r0.ge7998ebeaf
pkgrel=1
pkgdesc="API for controlling virtualization engines (openvz,kvm,qemu,virtualbox,xen,etc)"
arch=('i686' 'x86_64')
url="http://libvirt.org/"
license=('LGPL' 'GPL3')
depends=('libpciaccess' 'yajl' 'fuse2' 'gnutls' 'parted' 'libssh' 'libxml2' 'numactl' 'polkit' 'netcf')
makedepends=('libxslt' 'python-docutils' 'lvm2' 'open-iscsi' 'libiscsi' 'ceph-libs' 'glusterfs'
             'bash-completion' 'rpcsvc-proto' 'dnsmasq' 'iproute2' 'qemu-headless' 'git')
checkdepends=('ebtables')
optdepends=('libvirt-storage-gluster: Gluster storage backend'
            'libvirt-storage-iscsi-direct: iSCSI-direct storage backend'
            'libvirt-storage-rbd: RBD storage backend'
            'gettext: required for libvirt-guests.service'
            'openbsd-netcat: for remote management over ssh'
            'dmidecode: DMI system info support'
            'dnsmasq: required for default NAT/DHCP for guests'
            'radvd: IPv6 RAD support'
            'ebtables: required for default NAT networking'
            'qemu: QEMU/KVM support'
            'lvm2: Logical Volume Manager support'
            'open-iscsi: iSCSI support via iscsiadm')
conflicts=('libvirt')
provides=('libvirt')
options=('emptydirs')
backup=(
  'etc/conf.d/libvirtd'
  'etc/conf.d/libvirt-guests'
  'etc/conf.d/virtinterfaced'
  'etc/conf.d/virtlockd'
  'etc/conf.d/virtlogd'
  'etc/conf.d/virtlxcd'
  'etc/conf.d/virtnetworkd'
  'etc/conf.d/virtnodedevd'
  'etc/conf.d/virtnwfilterd'
  'etc/conf.d/virtproxyd'
  'etc/conf.d/virtqemud'
  'etc/conf.d/virtsecretd'
  'etc/conf.d/virtstoraged'
  'etc/conf.d/virtvboxd'
  'etc/libvirt/libvirt-admin.conf'
  'etc/libvirt/libvirt.conf'
  'etc/libvirt/libvirtd.conf'
  'etc/libvirt/lxc.conf'
  'etc/libvirt/nwfilter/allow-arp.xml'
  'etc/libvirt/nwfilter/allow-dhcp-server.xml'
  'etc/libvirt/nwfilter/allow-dhcp.xml'
  'etc/libvirt/nwfilter/allow-incoming-ipv4.xml'
  'etc/libvirt/nwfilter/allow-ipv4.xml'
  'etc/libvirt/nwfilter/clean-traffic-gateway.xml'
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
  'etc/libvirt/qemu.conf'
  'etc/libvirt/qemu-lockd.conf'
  'etc/libvirt/qemu/networks/default.xml'
  'etc/libvirt/virtinterfaced.conf'
  'etc/libvirt/virtlockd.conf'
  'etc/libvirt/virtlogd.conf'
  'etc/libvirt/virt-login-shell.conf'
  'etc/libvirt/virtlxcd.conf'
  'etc/libvirt/virtnetworkd.conf'
  'etc/libvirt/virtnodedevd.conf'
  'etc/libvirt/virtnwfilterd.conf'
  'etc/libvirt/virtproxyd.conf'
  'etc/libvirt/virtqemud.conf'
  'etc/libvirt/virtsecretd.conf'
  'etc/libvirt/virtstoraged.conf'
  'etc/libvirt/virtvboxd.conf'
  'etc/logrotate.d/libvirtd'
  'etc/logrotate.d/libvirtd.lxc'
  'etc/logrotate.d/libvirtd.qemu'
  'etc/sasl2/libvirt.conf'
)
install="libvirt.install"
source=('git+git://libvirt.org/libvirt.git'
    libvirtd.conf.d
    libvirtd-guests.conf.d
    libvirt.tmpfiles.d)

  
pkgver() {
  cd "$SRCDEST/${pkgname/-git/}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

prepare() {
  cd "$srcdir/${pkgname/-git/}"

  for file in $(find . -name '*.py' -print); do
    sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python_' $file
    sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python_' $file
  done

  sed -i 's|/sysconfig/|/conf.d/|g' \
    src/remote/libvirtd.service.in \
    tools/{libvirt-guests.service,libvirt-guests.sh,virt-pki-validate}.in \
    src/locking/virtlockd.service.in
  sed -i 's|@sbindir@|/usr/bin|g' src/locking/virtlockd.service.in
  # 78 is kvm group: https://wiki.archlinux.org/index.php/DeveloperWiki:UID_/_GID_Database
  sed -i 's|#group =.*|group="78"|' src/qemu/qemu.conf
  sed -i 's|/usr/libexec/qemu-bridge-helper|/usr/lib/qemu/qemu-bridge-helper|g' \
    src/qemu/qemu{.conf,_conf.c} \
    src/qemu/test_libvirtd_qemu.aug.in

  sed -i 's/notify/simple/' src/remote/libvirtd.service.in
}

build() {
  cd "$srcdir/${pkgname/-git/}"

  export PYTHON=`which python`
  export LDFLAGS=-lX11
  export RADVD=/usr/bin/radvd
  NOCONFIGURE=1 ./autogen.sh
  sed -i 's|libsystemd-daemon|libsystemd|g' configure
  mkdir build && cd build

  [ -f Makefile ] || ../configure --prefix=/usr --libexec=/usr/lib/"${pkgname/-git/}" --sbindir=/usr/bin \
    --with-storage-lvm --with-udev --without-hal --disable-static \
    --with-init-script=systemd \
    --with-qemu-user=nobody --with-qemu-group=nobody \
    --with-netcf --with-interface \
    --without-wireshark-dissector # working around bug 63828
  make
}

package() {
  cd "$srcdir/${pkgname/-git/}/build"

  make DESTDIR="$pkgdir" install

  install -D -m644 "$srcdir"/libvirtd.conf.d "$pkgdir"/etc/conf.d/libvirtd
  install -D -m644 "$srcdir"/libvirtd-guests.conf.d "$pkgdir"/etc/conf.d/libvirt-guests
  install -D -m644 "$srcdir"/libvirt.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/libvirt.conf

  chown -R 0:78 "$pkgdir"/var/lib/libvirt/qemu
  chmod 0770 "$pkgdir"/var/lib/libvirt/qemu

  chown 0:102 "$pkgdir"/usr/share/polkit-1/rules.d
  chmod 0750 "$pkgdir"/usr/share/polkit-1/rules.d

  rm -rf \
    "$pkgdir"/var/run \
    "$pkgdir"/etc/sysconfig \
    "$pkgdir"/etc/rc.d
}
sha256sums=('SKIP'
            '9d0597bbf2bd7892420cebaf0563236fe1483b83ae95ee6263c1ce7f44a44134'
            '0896c30100e9e40aee1eb4a2cf0cac2c0bdd5fd7b077b9d2680d90e77435ea66'
            '5c26353833944db8dc97aa63843734519d6521bd8d88497d94d910ee9d3169d8')
