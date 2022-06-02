# Maintainer: s3rj1k <evasive dot gyron at gmail dot com>
# Do not forget to run `makepkg --printsrcinfo > .SRCINFO`

_pkgname=libvirt
pkgname=${_pkgname}-remote-only
pkgver=8.4.0
pkgrel=5
pkgdesc="API for controlling virtualization engines (remote)"
arch=('x86_64')
url="https://libvirt.org/"
license=('LGPL' 'GPL3') #libvirt_parthelper links to libparted which is GPL3 only
depends=('gnutls' 'libxml2' 'openbsd-netcat')
replaces=("${_pkgname}")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('meson' 'libxslt' 'iproute2' 'rpcsvc-proto')
source=("https://libvirt.org/sources/${_pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('601a6e9bb03a43d05659f63e4a403df253ab0975b4a973f10a5607f3bbc018dd'
            'SKIP')
validpgpkeys=('453B65310595562855471199CA68BE8010084C9C') # Jiří Denemark <jdenemar@redhat.com>

build() {
  cd "${_pkgname}-${pkgver}"

  arch-meson build \
    --libexecdir=lib/libvirt \
    -Drunstatedir=/run \
    -Dapparmor=disabled \
    -Dapparmor_profiles=disabled \
    -Dattr=disabled \
    -Daudit=disabled \
    -Dbash_completion=disabled \
    -Dblkid=disabled \
    -Dcapng=disabled \
    -Dcurl=disabled \
    -Ddocs=disabled \
    -Ddriver_bhyve=disabled \
    -Ddriver_ch=disabled \
    -Ddriver_esx=disabled \
    -Ddriver_hyperv=disabled \
    -Ddriver_interface=disabled \
    -Ddriver_libvirtd=disabled \
    -Ddriver_libxl=disabled \
    -Ddriver_lxc=disabled \
    -Ddriver_network=disabled \
    -Ddriver_openvz=disabled \
    -Ddriver_qemu=disabled \
    -Ddriver_remote=enabled \
    -Ddriver_secrets=disabled \
    -Ddriver_test=disabled \
    -Ddriver_vbox=disabled \
    -Ddriver_vmware=disabled \
    -Ddriver_vz=disabled \
    -Ddtrace=disabled \
    -Dfirewalld=disabled \
    -Dfirewalld_zone=disabled \
    -Dfuse=disabled \
    -Dglusterfs=disabled \
    -Dhost_validate=disabled \
    -Dlibiscsi=disabled \
    -Dlibnl=disabled \
    -Dlibpcap=disabled \
    -Dlibssh2=disabled \
    -Dlibssh=disabled \
    -Dlogin_shell=disabled \
    -Dnetcf=disabled \
    -Dnls=disabled \
    -Dnss=disabled \
    -Dnumactl=disabled \
    -Dnumad=disabled \
    -Dopenwsman=disabled \
    -Dpciaccess=disabled \
    -Dpm_utils=disabled \
    -Dpolkit=disabled \
    -Dsanlock=disabled \
    -Dsasl=disabled \
    -Dsecdriver_apparmor=disabled \
    -Dsecdriver_selinux=disabled \
    -Dselinux=disabled \
    -Dstorage_dir=disabled \
    -Dstorage_disk=disabled \
    -Dstorage_fs=disabled \
    -Dstorage_gluster=disabled \
    -Dstorage_iscsi=disabled \
    -Dstorage_iscsi_direct=disabled \
    -Dstorage_lvm=disabled \
    -Dstorage_mpath=disabled \
    -Dstorage_rbd=disabled \
    -Dstorage_scsi=disabled \
    -Dstorage_sheepdog=disabled \
    -Dstorage_vstorage=disabled \
    -Dstorage_zfs=disabled \
    -Dsysctl_config=disabled \
    -Dtests=disabled \
    -Dudev=disabled \
    -Dwireshark_dissector=disabled \
    -Dyajl=disabled

  ninja -C build
}

package() {
  cd "${_pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install

  rm -vrf \
    "${pkgdir}/etc" \
    "${pkgdir}/run" \
    "${pkgdir}/usr/share/doc" \
    "${pkgdir}/var/cache/libvirt/qemu" \
    "${pkgdir}/var/lib/"
}
