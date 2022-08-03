# Maintainer: exkc <exxxxkc@getgoogleoff.me>
# Contributor: exkc <exxxxkc@tilde.club>

pkgname=qemu-system-loongarch64-git
_pkgname=qemu-system-loongarch64
pkgdesc="QEMU system emulator for loongarch64"
pkgver=7.0.50.r97536.g8ec4bc3c8c
pkgrel=1
provides=( ${_pkgname} )
conflicts=( ${_pkgname} )
arch=(x86_64 aarch64)
license=(GPL2 LGPL2.1)
url="http://wiki.qemu.org/"
arch=(i686 x86_64)
depends=( "qemu" "edk2-ovmf-loongarch64")
makedepends=(
  alsa-lib
  brltty
  bzip2
  cairo
  ceph
  curl
  cdrtools
  dtc
  fuse3
  gcc-libs
  gdk-pixbuf2
  git
  glib2
  glusterfs
  gnutls
  gtk3
  jack
  libaio
  libbpf
  libcacard
  libcap-ng
  libepoxy
  libiscsi
  libnfs
  libpng
  libpulse
  libsasl
  libseccomp
  libslirp
  libssh
  liburing
  libusb
  libx11
  libxkbcommon
  lzo
  mesa
  meson
  ncurses
  ndctl
  numactl
  pam
  python
  python-sphinx
  python-sphinx_rtd_theme
  sdl2
  sdl2_image
  seabios
  snappy
  spice-protocol
  spice
  systemd
  usbredir
  vde2
  virglrenderer
  vte3 libvte-2.91.so
  xfsprogs
  zlib
  zstd 
)
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

  cd qemu
}

_configure() {
    ../qemu/configure \
            --prefix=/usr \
            --sysconfdir=/etc \
            --localstatedir=/var \
            --libexecdir=/usr/lib/qemu \
            --target-list=loongarch64-softmmu
}

build() (
 mkdir -p build
  cd build
  [[ ! $FORCE_CONFIGURE && -e ../qemu-${pkgver}/config.log ]] || _configure
  make ARFLAGS="rc"
)

package() {
#bash
mkdir -p $pkgdir/usr/bin
install -Dm755 ./build/qemu-system-loongarch64 $pkgdir/usr/bin/

}
