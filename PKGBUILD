# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Sebastian Ullrich <echo c2ViYXN0aUBudWxscmkuY2gK|base64 -d>
# Contributor: lishengming.zju <lishengming.zju@gmail.com>

pkgname=('pidgin-hg' 'libpurple-hg' 'finch-hg')
_hgname=pidgin
pkgver=3.r38582.878de3ba891b
pkgrel=1
pkgdesc="Multi-protocol instant messaging client. Latest mercurial build."
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
makedepends=('mercurial' 'python2' 'avahi' 'tk' 'ca-certificates' 'intltool'
             'tk' 'ca-certificates' 'intltool' 'networkmanager'
             'startup-notification' 'gtkspell' 'libxss' 'libsm'
             'hicolor-icon-theme' 'dbus-glib' 'webkitgtk' 'json-glib'
             'farstream' 'libsasl' 'libidn' 'dbus-glib' 'nss'
             'libgnome-keyring' 'gplugin')
makedepends+=('libx11' 'python' 'meson')
options=('!libtool')
source=('pidgin::hg+https://bitbucket.org/pidgin/main#branch=default')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/pidgin

  printf "3.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$srcdir"/"$_hgname"
  rm -rf ../build
  mkdir ../build
  NOCONFIGURE=1 ./autogen.sh
 

build() {
  cd "$srcdir"/build
   meson --prefix=/usr \ --builtype=release ../${_hgname}
    --sysconfdir=/etc \
    --disable-meanwhile \
    --enable-cyrus-sasl \
    --disable-kwallet \
    --with-python=/usr/bin/python \
    --with-system-ssl-certs=/etc/ssl/certs
  ninja
  }
  make
}

package_pidgin-hg() {
  pkgdesc="Multi-protocol instant messaging client"
  depends=('libpurple-hg' 'startup-notification' 'gtkspell' 'libxss' 'libsm'
           'hicolor-icon-theme' 'dbus-glib' 'webkitgtk3' 'json-glib')
  optdepends=('aspell: for spelling correction')
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
              'python-dbus: for purple-remote and purple-url-handler'
              'tk: Tcl/Tk scripting support')
  provides=('libpurple')
  conflicts=('libpurple')

  cd "$srcdir"/$_hgname

  for _dir in libpurple share/sounds share/ca-certs m4macros po; do
    make -C "$_dir" DESTDIR="$pkgdir" install
  done
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
