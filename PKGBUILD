# Maintainer: exkc <exxxxkc@getgoogleoff.me>
# Contributor: exkc <exxxxkc@tilde.club>

pkgname=qemu-loongarch64-static-git
_pkgname=qemu-loongarch64-static
pkgdesc="Statically linked binaries of Qemu with loongarch64 user emulation. Useful for containers/chroot environment with binfmt."
pkgver=7.0.50.r97536.g8ec4bc3c8c
pkgrel=1
provides=( ${_pkgname} )
conflicts=( ${_pkgname} )
arch=(x86_64 aarch64)
license=(GPL2 LGPL2.1)
url="http://wiki.qemu.org/"
depends=()
makedepends=(python meson glib2-static pcre-static)
source=('git+https://github.com/qemu/qemu')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/qemu"
  
  printf "7.0.50.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

case $CARCH in
  i?86) _corearch=i386 ;;
  x86_64) _corearch=x86_64 ;;
esac

# If non empty, always run the configure script
: "${FORCE_CONFIGURE:=1}"

prepare() {
  mkdir -p build-user-static

  cd qemu
}

_configure() {
    ../qemu/configure \
            --prefix=/usr \
            --sysconfdir=/etc \
            --localstatedir=/var \
            --libexecdir=/usr/lib/qemu \
            --target-list=loongarch64-linux-user \
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

  make -C build-user-static DESTDIR="$pkgdir" install "${@:2}"

  # remove conflicting /var/run directory
  cd "$pkgdir"
  rm -rf var

  # Remove BIOS files etc...
  rm -rf usr/share

  # Rename static qemu binaries
  cd "${pkgdir}/usr/bin/"
  mv qemu-loongarch64 qemu-loongarch64-static
}
