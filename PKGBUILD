# Maintainer: Stefan Agner <stefan@agner.ch>

pkgname=qemu-user-static
pkgdesc="Statically linked binaries of Qemu with user emulation. Useful for containers/chroot environment with binfmt."
pkgver=3.1.0
pkgrel=1
arch=(x86_64)
license=(GPL2 LGPL2.1)
url="http://wiki.qemu.org/"
depends=()
makedepends=(python2 glib2-static pcre-static)
source=(https://download.qemu.org/qemu-$pkgver.tar.xz{,.sig})
sha512sums=('7e8dae823937cfac2f0c60406bd3bdcb89df40313dab2a4bed327d5198f7fcc68ac8b31e44692caa09299cc71256ee0b8c17e4f49f78ada8043d424f5daf82fe'
            'SKIP')
validpgpkeys=('CEACC9E15534EBABB82D3FA03353C9CEF108B584')

case $CARCH in
  i?86) _corearch=i386 ;;
  x86_64) _corearch=x86_64 ;;
esac

prepare() {
  mkdir build-user-static

  cd qemu-${pkgver}
  sed -i 's/vte-2\.90/vte-2.91/g' configure
}

build() (
  cd build-user-static

  ../qemu-${pkgver}/configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/qemu \
    --enable-linux-user \
    --disable-debug-info \
    --disable-bsd-user \
    --disable-werror \
    --disable-system \
    --disable-tools \
    --disable-docs \
    --disable-gtk \
    --disable-gnutls \
    --disable-nettle \
    --disable-gcrypt \
    --disable-glusterfs \
    --disable-libnfs \
    --disable-libiscsi \
    --disable-vnc \
    --disable-kvm \
    --disable-libssh2 \
    --disable-libxml2 \
    --disable-vde \
    --disable-sdl \
    --disable-opengl \
    --disable-xen \
    --disable-kvm \
    --disable-fdt \
    --disable-vhost-net \
    --disable-vhost-crypto \
    --disable-vhost-user \
    --disable-vhost-vsock \
    --disable-vhost-scsi \
    --disable-tpm \
    --disable-qom-cast-debug \
    --disable-capstone \
    --static

  make ARFLAGS="rc"
)

package() {
  provides=(qemu-user-static)
  options=(!strip)

  make -C build-user-static DESTDIR="$pkgdir" install "${@:2}"

  # remove conflicting /var/run directory
  cd "$pkgdir"
  rm -r var

  # Remove BIOS files etc...
  rm -r usr/share

  # Rename static qemu binaries
  cd "${pkgdir}/usr/bin/"
  tidy_strip
  ls -1 | while read f; do
    mv "$f" "$f-static"
  done
}

# vim:set ts=2 sw=2 et:
