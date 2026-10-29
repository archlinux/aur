# Maintainer: Luke Alonso <lalonso@gmail.com>
# Contributor: Ragu Manjegowda <github.com/ragu-manjegowda>
pkgname=openconnect-gp-git
_pkgname=openconnect
pkgver=70d1e79d1e55849dfc71dcc199b1edb535b547e4
pkgrel=3
pkgdesc="Open client for Cisco AnyConnect VPN with GlobalProtect CAS and external-browser support"
arch=('i686' 'x86_64')
license=('LGPL-2.1-only')
url="https://www.infradead.org/openconnect.html"
depends=('glibc' 'krb5' 'libproxy' 'libxml2' 'lz4' 'oath-toolkit' 'openssl'
         'pcsclite' 'stoken' 'vpnc' 'zlib')
optdepends=('xdg-utils: open the default browser for GlobalProtect authentication')
makedepends=('intltool' 'python' 'git' 'autoconf' 'automake' 'libtool')
options=('!emptydirs')
provides=("$_pkgname" 'libopenconnect.so')
conflicts=("$_pkgname")
commit=70d1e79d1e55849dfc71dcc199b1edb535b547e4
# Community changes from ragu-manjegowda/openconnect-git-gp at 250113c1f0e2.
source=("$pkgname::git+https://gitlab.com/openconnect/openconnect.git/#commit=$commit"
        'gp-cas-callback.patch'
        'gp-browser-safety.patch'
        'gp_browser_helper.c'
        'gp_browser_helper.desktop')
sha256sums=('SKIP'
            '2aabe3e2e5bf3b3c272a73b2c7ca411781c53bdf28b61c0963d18a7b9103c036'
            '16aa297d2bdeba37f77fde88b0e809d1300cac296b74749b585cf4adbfbcc3dd'
            '9fab2b7cee50c1a83816cb5377c25a258d182cab558d089a441dbc6607a144e0'
            'a4a0f71834f2f6b61a68bde087803fcb8fd07cc7ef957a22674c3f1ecdb5704c')

pkgver() {
  echo "$commit"
}

prepare() {
  cd "$pkgname"
  cp "$srcdir/gp_browser_helper.c" "$srcdir/gp_browser_helper.desktop" .
  patch -p1 < "$srcdir/gp-cas-callback.patch"
  patch -p1 < "$srcdir/gp-browser-safety.patch"
}

build() {
  cd "$pkgname"

  ./autogen.sh

  PYTHON=/usr/bin/python ./configure --prefix=/usr \
      --sbindir=/usr/bin \
      --libexecdir=/usr/lib \
      --disable-static \
      --without-gnutls \
      --with-vpnc-script=/etc/vpnc/vpnc-script
  # Fight unused direct deps
  sed -i -e "s/ -shared / $LDFLAGS\0 /g" libtool
  sed -i 's|update-desktop-database|true|' Makefile

  make V=0
}

check() {
  cd "$pkgname"
  make check
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
