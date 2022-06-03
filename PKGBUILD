# Maintainer: s3rj1k <evasive dot gyron at gmail dot com>
# Do not forget to run `makepkg --printsrcinfo > .SRCINFO`

pkgname=libvirt-vnc
pkgver=8.4.0
pkgrel=1
pkgdesc='Libvirt runtime libraries and headers exclusively for VNC support.'
arch=('x86_64')
url="https://gitlab.com/libvirt/libvirt"
license=(
  'LGPL2.1'
)
depends=(
  'gnutls'
  'libxml2'
)
makedepends=(
  'intltool'
  'libxslt'
  'meson'
  'python'
  'python-docutils'
  'rpcsvc-proto'
)
conflicts=(
  'libvirt'
)
source=(
  "https://libvirt.org/sources/libvirt-${pkgver}.tar.xz"{,.asc}
  "libvirt-meson.build.patch"
  "libvirt-tools-meson.build.patch"
  "libvirt-src-meson.build.patch"
)
sha256sums=(
  '601a6e9bb03a43d05659f63e4a403df253ab0975b4a973f10a5607f3bbc018dd'
  'SKIP'
  '9c6dc059fa0a716d35cc6fa43b470bd5feb0aec476472bfbb8747c40f8105984'
  'bfcaff2fb2b1c24d7d04e0cc747c6ce288770b814aeee54ab8449cf24c9eab0c'
  'f0517979df85bde1f9f98d2ad22e5464d00e3c778f2829bdd7b258bbb6ee470b'
)
validpgpkeys=(
  '453B65310595562855471199CA68BE8010084C9C' # Jiří Denemark <jdenemar@redhat.com>
  'DAF3A6FDB26B62912D0E8E3FBE86EBB415104FDF' # Daniel P. Berrange <dan@berrange.com>
)

prepare() {
  cd "${srcdir}/libvirt-${pkgver}"
  patch meson.build < "${srcdir}/libvirt-meson.build.patch"
  patch tools/meson.build < "${srcdir}/libvirt-tools-meson.build.patch"
  patch src/meson.build < "${srcdir}/libvirt-src-meson.build.patch"
}

build() {
  cd "${srcdir}/libvirt-${pkgver}"

  arch-meson build \
    --buildtype=plain \
    --libexecdir=lib/libvirt \
    --auto-features disabled \
    -Dapparmor=disabled \
    -Dapparmor_profiles=disabled \
    -Dattr=disabled \
    -Daudit=disabled \
    -Dbash_completion=disabled \
    -Dblkid=disabled \
    -Dcapng=disabled \
    -Dcurl=disabled \
    -Ddocs=enabled \
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
    -Drunstatedir=/run \
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
  cd "${srcdir}/libvirt-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install

  rm -vrf \
    "${pkgdir}/etc" \
    "${pkgdir}/usr/share/doc" \
    "${pkgdir}/usr/share/libvirt/api/libvirt-admin-api.xml" \
    "${pkgdir}/usr/share/libvirt/cpu_map" \
    "${pkgdir}/usr/share/libvirt/schemas" \
    "${pkgdir}/usr/share/man" \
    "${pkgdir}/var"
}
