# This is a clone of transmission3-cli with miniupnpc removed.
# Please use that package instead.

# Maintainer: wgetisnotacrime <transmission-cli@proton.me>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_pkgname=transmission
parent_pkgname=transmission3-cli
pkgname=transmission3-cli-noupnp
pkgver=3.00
pkgrel=2
arch=('x86_64')
url="https://www.transmissionbt.com/"
pkgdesc='Fast, easy, and free BitTorrent client (CLI tools, daemon and web client)'
license=('MIT')

# all depends found with ldd
depends=('brotli' 'curl' 'e2fsprogs' 'glibc' 'keyutils' 'krb5'
	 'libb64' 'libevent' 'libidn2' 'libnatpmp' 'libnghttp2'
	 'libpsl' 'libssh2' 'libsystemd' 'libunistring'
	 'openssl' 'zlib' 'zstd')

makedepends=('intltool' 'dht')
provides=('transmission-cli' 'transmission3-cli')
conflicts=('transmission-cli' 'transmission3-cli')
source=(https://github.com/transmission/transmission-releases/raw/master/transmission-${pkgver}.tar.xz
	transmission-3.00-disable-missing-lang.patch
	transmission-3.00-openssl-3.patch
	transmission-3.00-fdlimit.patch
        transmission3-cli.sysusers
        transmission3-cli.tmpfiles)
sha256sums=('9144652fe742f7f7dd6657716e378da60b751aaeda8bef8344b3eefc4db255f2'
            '0bfcee3fda9c1ea7b13075bd0dfa5ab66cac355a1dda05b5d1b5413cc8398092'
            'a5e56b906724f007db0bdb9835fbf5088bb56a521ec2971aec0ea44578d5955b'
            'ed4bafd2b20dc2ae68820ea2a40b79e7f5510f9854d6e022e8746a0d230c99cb'
            '641310fb0590d40e00bea1b5b9c843953ab78edf019109f276be9c6a7bdaf5b2'
            '1266032bb07e47d6bcdc7dabd74df2557cc466c33bf983a5881316a4cc098451')

prepare() {
  cd $_pkgname-$pkgver

  # disable po_PT (patch from Alpine)
  patch -Np1 -i ../transmission-3.00-disable-missing-lang.patch

  # Fix compatibility with OpenSSL 3.0 (patch from Gentoo)
  # https://github.com/transmission/transmission/issues/1777
  patch -Np1 -i ../transmission-3.00-openssl-3.patch

  # Lift 1024 open files limit (switch to curl polling API)
  # https://github.com/transmission/transmission/pull/893
  patch -Np1 -i ../transmission-3.00-fdlimit.patch

  # Fix build with autoconf 2.70
  sed -i '16i m4_pattern_allow([AM_NLS])' configure.ac
  sed -i 's/\[IT_PROG_INTLTOOL(\[/[\nIT_PROG_INTLTOOL(\[/' configure.ac
  rm -f m4/glib-gettext.m4
  autoreconf -fi
}

build() {
  export CFLAGS+=" -ffat-lto-objects"
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr \
    --disable-gtk \
    --disable-qt \
    --enable-external-dht \
    --enable-external-b64 \
    --enable-external-natpmp
  make
}

package() {
  cd $_pkgname-$pkgver

  for dir in daemon cli web utils; do
    make -C "$dir" DESTDIR="$pkgdir" install
  done

  install -Dm644 daemon/transmission-daemon.service \
    "$pkgdir/usr/lib/systemd/system/transmission.service"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-cli/COPYING"

  install -Dm644 "$srcdir/$parent_pkgname.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/transmission.conf"
  install -Dm644 "$srcdir/$parent_pkgname.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/transmission.conf"
}
