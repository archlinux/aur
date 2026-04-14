# Maintainer (Arch): Evangelos Foutras <evangelos@foutrelis.com>
# Contributor (Arch): Ionut Biru <ibiru@archlinux.org>
# Contributor (Arch): Andrea Scarpino <andrea@archlinux.org>
# Contributor (Arch): Alexander Fehr <pizzapunk gmail com>
# Contributor (Arch): Lucien Immink <l.immink@student.fnt.hvu.nl>
# Maintainer (Hyperbola): Tobias Dausend <throgh@hyperbola.info>
# Maintainer: Miaoyu Cookies <zoe963988@mailtion.xyz>

pkgbase=pidgin-privacy
_pkgbase=pidgin
pkgname=('pidgin-privacy' 'libpurple-privacy')
_pkgname=pidgin
_pkglibname=libpurple
pkgver=2.14.14
_debver=$pkgver
_debrel=1
pkgrel=4
arch=('i686' 'x86_64')
url='https://pidgin.im/'
license=('GPL-2.0-or-later')
#makedepends=('startup-notification' 'libxss' 'nss' 'libsasl' 'libsm'
#             'libidn' 'python' 'hicolor-icon-theme' 'arc-icon-theme' 'tk' 'libnsl' 'ca-certificates'
#             'intltool' 'libxcrypt' 'perl' 'quilt' 'gtk2')
source=(https://downloads.sourceforge.net/project/pidgin/Pidgin/$pkgver/${_pkgbase}-${pkgver}.tar.bz2
        https://deb.debian.org/debian/pool/main/p/pidgin/pidgin_${_debver}-${_debrel}.debian.tar.xz
        https://git.hyperbola.info:50100/packages/extra.git/plain/pidgin/privacy.patch)
sha512sums=('2d1ee55e701983871762b5307a2c13fa4431b388229aee7c27522ba593a4c79df729be04cda91f44b3cc9663ca0579bf66b722cdcbd71cae3b8c2dbe75c1f24d'
            '0077f59f1f0586b227d5dcfdc361f36876707d0e4371c3af2c380c26858139e0612c1f5be7562d1b48912a96c03199ad1d70c7a2fce0234b0d2d345ab03291b1'
            '36ffb6ca6e5feb86583af0679cb47a4a36cfdcf2e30dfa8b02fd316c4fc6daf7d5c008109a3af426f62f18d9af58122b9d61c32ee324d52309dbaef14247f453')

prepare() {
  cd $_pkgbase-$pkgver

  if [[ ${pkgver%.*} = ${_debver%.*} ]]; then
    # Debian patches
    export QUILT_PATCHES=debian/patches
    export QUILT_REFRESH_ARGS='-p ab --no-timestamps --no-index'
    export QUILT_DIFF_ARGS='--no-timestamps'

    mv "$srcdir"/debian .

    quilt push -av
  fi

  # additional fixes
  patch -Np1 -i $srcdir/privacy.patch
}

build() {
  cd $_pkgbase-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-cyrus-sasl \
    --disable-gtkspell \
    --disable-schemas-install \
    --disable-meanwhile \
    --disable-gnutls \
    --disable-doxygen \
    --disable-nm \
    --disable-avahi \
    --disable-dbus \
    --disable-farstream \
    --disable-vv \
    --disable-gstreamer \
    --disable-gstreamer-video \
    --disable-gstreamer-interfaces \
    --with-system-ssl-certs=/etc/ssl/certs \
    --with-dynamic-prpls=irc,jabber,silc,simple,zephyr \
    --disable-gevolution
  make
}

package_pidgin-privacy(){
  pkgdesc="Multi-protocol instant messaging client with enhanced privacy"
  depends=('libpurple-privacy' 'startup-notification' 'libxss' 'libsm' 'hicolor-icon-theme' 'gtk2')
  optdepends=('aspell: for spelling correction'
              'pidgin-otr: for Off-the-Record Messaging support'
              'arc-icon-theme: for better icon')
  provides=('pidgin')
  conflicts=('pidgin')

  cd $_pkgbase-$pkgver

  # For linking
  make -C libpurple DESTDIR="$pkgdir" install-libLTLIBRARIES

  make -C pidgin DESTDIR="$pkgdir" install
  make -C doc DESTDIR="$pkgdir" install

  # Remove files that are packaged in libpurle
  make -C libpurple DESTDIR="$pkgdir" uninstall-libLTLIBRARIES

  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

package_libpurple-privacy(){
  pkgdesc="IM library extracted from Pidgin with enhanced privacy"
  depends=('libsasl' 'libidn' 'libnsl' 'nss' 'libxcrypt')
  optdepends=('ca-certificates: SSL CA certificates'
              'tk: Tcl/Tk scripting support')
  provides=('libpurple')
  conflicts=('libpurple')

  cd $_pkgbase-$pkgver

  for _dir in libpurple share/sounds share/ca-certs m4macros po; do
    make -C "$_dir" DESTDIR="$pkgdir" install
  done

  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${_pkglibname}"
}