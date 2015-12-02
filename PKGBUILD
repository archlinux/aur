# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Sebastian Ullrich <echo c2ViYXN0aUBudWxscmkuY2gK|base64 -d>
# Contributor: lishengming.zju <lishengming.zju@gmail.com>

pkgname=('pidgin-hg' 'libpurple-hg' 'finch-hg')
_hgname=pidgin
pkgver=latest
pkgrel=4
pkgdesc="Multi-protocol instant messaging client. Latest mercurial build."
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
makedepends=('mercurial' 'python2' 'avahi' 'tk' 'ca-certificates' 'intltool'
             'tk' 'ca-certificates' 'intltool' 'networkmanager'
             'startup-notification' 'gtkspell' 'libxss' 'libsm'
             'hicolor-icon-theme' 'dbus-glib' 'webkitgtk3' 'json-glib'
             'farstream' 'libsasl' 'libidn' 'dbus-glib' 'nss'
             'libgnome-keyring' 'gplugin')
makedepends+=('libx11' 'python2')
options=('!libtool')
source=('pidgin::hg+https://hg.pidgin.im/pidgin/main')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/pidgin

  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

prepare() {
  cd "$srcdir"/$_hgname

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-schemas-install \
    --disable-meanwhile \
    --disable-gnutls \
    --enable-cyrus-sasl \
    --disable-doxygen \
    --enable-nm \
    --disable-kwallet \
    --with-python=/usr/bin/python2 \
    --with-system-ssl-certs=/etc/ssl/certs
}

build() {
  cd "$srcdir"/$_hgname
  make
}

package_pidgin-hg() {
  pkgdesc="Multi-protocol instant messaging client"
  depends=('libpurple-hg' 'startup-notification' 'gtkspell' 'libxss' 'libsm'
           'hicolor-icon-theme' 'dbus-glib' 'webkitgtk3' 'json-glib')
  optdepends=('aspell: for spelling correction')
  install=$pkgname.install
  provides=('pidgin')
  conflicts=('pidgin')

  cd "$srcdir"/$_hgname

  # For linking
  make -C libpurple DESTDIR="$pkgdir" install-libLTLIBRARIES

  make -C pidgin DESTDIR="$pkgdir" install
  make -C doc DESTDIR="$pkgdir" install

  # Remove files that are packaged in libpurple
  make -C libpurple DESTDIR="$pkgdir" uninstall-libLTLIBRARIES

  install -Dm644 pidgin/data/pidgin.desktop "$pkgdir"/usr/share/applications/pidgin.desktop

  rm "$pkgdir/usr/share/man/man1/finch.1"
}

package_libpurple-hg() {
  pkgdesc="IM library extracted from Pidgin"
  depends=('farstream' 'libsasl' 'libidn' 'dbus-glib' 'nss'
           'libgnome-keyring')
  optdepends=('avahi: Bonjour protocol support'
              'ca-certificates: SSL CA certificates'
              'python2-dbus: for purple-remote and purple-url-handler'
              'tk: Tcl/Tk scripting support')
  provides=('libpurple')
  conflicts=('libpurple')

  cd "$srcdir"/$_hgname

  for _dir in libpurple share/sounds share/ca-certs m4macros po; do
    make -C "$_dir" DESTDIR="$pkgdir" install
  done

  # Remove GConf schema file
  rm "$pkgdir/etc/gconf/schemas/purple.schemas"
  rmdir "$pkgdir"/etc{/gconf{/schemas,},}
}

package_finch-hg() {
  pkgdesc="A ncurses-based messaging client"
  depends=("libpurple-hg=$pkgver-$pkgrel" 'libx11' 'python2')
  provides=('finch')
  conflicts=('finch')

  cd "$srcdir"/$_hgname

  # For linking
  make -C libpurple DESTDIR="$pkgdir" install-libLTLIBRARIES

  make -C finch DESTDIR="$pkgdir" install
  make -C doc DESTDIR="$pkgdir" install

  # Remove files that are packaged in libpurple
  make -C libpurple DESTDIR="$pkgdir" uninstall-libLTLIBRARIES

  rm "$pkgdir"/usr/share/man/man1/pidgin.1
}
