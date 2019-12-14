# Maintainer: Frederic Bezies <fredbezies@gmail.com>
# Contributor: ajs124 < aur at ajs124 dot de>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sébastien "Seblu" Luttringer <seblu@seblu.net>

pkgname=virtiofsd
pkgdesc="QEMU VirtioFSd"
pkgver=0.3
pkgrel=1
arch=(i686 x86_64)
license=(GPL2 LGPL2.1)
url="https://virtio-fs.gitlab.io/"
makedepends=('pixman>=0.21.8' 'python2')
source=(
  "git+https://gitlab.com/virtio-fs/qemu.git#tag=virtio-fs-v${pkgver}"
  0001-add-time-to-seccomp.patch
  0002-libvhost-user-Fix-the-VHOST_USER_PROTOCOL_F_SLAVE_SE.patch
)
sha256sums=(
  'SKIP'
  '7801e6e947c4203e797c7befd6b381c23b69e07bf8ae91f77d5b621c7c059f1b'
  'bd5ca1495c998fac8988cdf0cab5677bf96d69ca19eea6252207a9a7c28afcdf'
)

prepare() {
  cd "${srcdir}/qemu"
  # https://github.com/kata-containers/packaging/tree/master/qemu/patches/virtiofsd needed for tag virtio-fs-v0.3
  patch -p1 <${srcdir}/0001-add-time-to-seccomp.patch
  patch -p1 <${srcdir}/0002-libvhost-user-Fix-the-VHOST_USER_PROTOCOL_F_SLAVE_SE.patch

  #cd "${srcdir}/${_gitname}"
  sed -i 's/vte-2\.90/vte-2.91/g' configure
}

build() (
  cd ${srcdir}/qemu

  # qemu vs. make 4 == bad
  export ARFLAGS=rv

  # http://permalink.gmane.org/gmane.comp.emulators.qemu/238740
  export CFLAGS+=" -fPIC"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/qemu \
    --disable-avx2 \
    --disable-bluez \
    --disable-brlapi \
    --disable-docs \
    --disable-curses \
    --disable-gtk \
    --disable-opengl \
    --disable-sdl \
    --disable-spice \
    --disable-vte \
    --disable-vnc \
    --disable-vnc-jpeg \
    --disable-vnc-png \
    --disable-vnc-sasl \
    --disable-auth-pam \
    --disable-fdt \
    --disable-glusterfs \
    --disable-libiscsi \
    --disable-libnfs \
    --disable-libssh \
    --disable-bzip2 \
    --disable-lzo \
    --disable-snappy \
    --disable-tpm \
    --disable-slirp \
    --disable-libusb \
    --disable-usb-redir \
    --disable-tcg \
    --disable-debug-tcg \
    --disable-tcg-interpreter \
    --disable-qom-cast-debug \
    --disable-tcmalloc \
    --disable-curl \
    --disable-rdma \
    --disable-tools \
    --disable-xen \
    --disable-linux-aio \
    --disable-libpmem \
    --disable-virglrenderer \
    --disable-replication \
    --disable-smartcard \
    --disable-guest-agent \
    --disable-guest-agent-msi \
    --disable-vvfat \
    --disable-vdi \
    --disable-qed \
    --disable-qcow1 \
    --disable-bochs \
    --disable-cloop \
    --disable-dmg \
    --disable-parallels \
    --disable-vxhs \
    --disable-capstone \
    --enable-kvm \
    --enable-vhost-net \
    --enable-virtfs \
    --enable-attr \
    --enable-cap-ng \
    --enable-malloc-trim \
    --target-list=x86_64-softmmu \
    --extra-cflags=" -O3 -falign-functions=32 -D_FORTIFY_SOURCE=2 -fPIE" \
    --extra-ldflags=" -pie -z noexecstack -z relro -z now" \
    --with-pkgversion=virtiofs-v0.3 \
    --python=/usr/bin/python2

  # vhost-user debugging in virtiofs
  #sed -i 's%#define LIBVHOST_USER_DEBUG 0%#define LIBVHOST_USER_DEBUG 1%' contrib/libvhost-user/libvhost-user.c
  make virtiofsd
)

package() {
  install -Dm755 {${srcdir}/qemu,${pkgdir}/usr/bin}/virtiofsd
}
