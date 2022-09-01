# Maintainer: crab2313 <crab2313@gmail.com>
# Contributor: Stefan Agner <stefan@agner.ch>

pkgname=qemu-user-static
pkgdesc="Statically linked binaries of Qemu with user emulation. Useful for containers/chroot environment with binfmt."
pkgver=7.1.0
pkgrel=1
arch=(x86_64 aarch64)
license=(GPL2 LGPL2.1)
url="http://wiki.qemu.org/"
depends=()
makedepends=(python meson glib2-static pcre2-static)
source=(https://download.qemu.org/qemu-$pkgver.tar.xz{,.sig})
sha512sums=('c60c5ff8ec99b7552e485768908920658fdd8035ff7a6fa370fb6881957dc8b7e5f18ff1a8f49bd6aa22909ede2a7c084986d8244f12074ccd33ebe40a0c411f'
            'SKIP')
validpgpkeys=('CEACC9E15534EBABB82D3FA03353C9CEF108B584')

case $CARCH in
  i?86) _corearch=i386 ;;
  x86_64) _corearch=x86_64 ;;
esac

# If non empty, always run the configure script
: "${FORCE_CONFIGURE:=1}"

prepare() {
  mkdir -p build-user-static

  cd qemu-${pkgver}
  #sed -i 's/vte-2\.90/vte-2.91/g' configure
}

_configure() {
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
            --disable-libssh \
            --disable-vde \
            --disable-sdl \
            --disable-opengl \
            --disable-xen \
            --disable-fdt \
            --disable-vhost-net \
            --disable-vhost-crypto \
            --disable-vhost-user \
            --disable-vhost-kernel \
            --disable-tpm \
            --disable-qom-cast-debug \
            --disable-capstone \
            --disable-zstd \
            --disable-linux-io-uring \
            --disable-bpf \
            --static
}

build() (
  cd build-user-static
  [[ ! $FORCE_CONFIGURE && -e ../qemu-${pkgver}/config.log ]] || _configure
  make ARFLAGS="rc"
)

package() {
  provides=(qemu-user-static)
  options=(!strip)

  make -C build-user-static DESTDIR="$pkgdir" install "${@:2}"

  # remove conflicting /var/run directory
  cd "$pkgdir"
  rm -rf var

  # Remove BIOS files etc...
  rm -rf usr/share

  # Rename static qemu binaries
  cd "${pkgdir}/usr/bin/"
  tidy_strip
  ls -1 | while read f; do
    mv "$f" "$f-static"
  done
}

# vim:set ts=2 sw=2 et:
