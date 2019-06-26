# Maintainer: Stefan Agner <stefan@agner.ch>

pkgname=qemu-user-static
pkgdesc="Statically linked binaries of Qemu with user emulation. Useful for containers/chroot environment with binfmt."
pkgver=4.0.0
pkgrel=1
arch=(x86_64)
license=(GPL2 LGPL2.1)
url="http://wiki.qemu.org/"
depends=()
makedepends=(python2 glib2-static pcre-static)
source=(https://download.qemu.org/qemu-$pkgver.tar.xz{,.sig})
sha512sums=(
  '952e94194ce9e64c15388c59035cb31fb9f761d30095c2fb9441012b609c18c9976285727b93bf37b95e15675802d73f8e1c4619ebecd23606675bb503646b13'
  'SKIP'
)
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
