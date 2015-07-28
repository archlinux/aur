# Maintainer: Tom Kuther <archlinux@kuther.net>
# Contributor: Stefan Brand <seiichiro@seiichiro0185.org>

pkgname=dovecot2-antispam-hg
pkgver=51
pkgrel=1
pkgdesc="Integrates DSPAM into dovecot IMAP server. Mercurial Version for dovecot >= 2.1"
arch=( 'i686' 'x86_64' )
url="http://hg.dovecot.org/dovecot-antispam-plugin/"
license=('GPL')
depends=('dovecot>=2.2.0')
makedepends=('mercurial')
conflicts=(dovecot-antispam)
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_hgroot="http://hg.dovecot.org/dovecot-antispam-plugin"
_hgrepo="dovecot-antispam-plugin"

build() {
  cd "$srcdir"

  cd "$srcdir"
  msg "Connecting to Mercurial server...."

	if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -r 51 -u
		msg "The local files are updated."
	else
	  hg clone -r 51 "$_hgroot" "$_hgrepo"
	fi

	msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"


  ./autogen.sh
  ./configure --prefix=/usr --with-dovecot=/usr/lib/dovecot

  sed -i -e 's/install -o/install -D -o/' -e 's|$(INSTALLDIR)/|$(INSTALLDIR)/$(LIBRARY_NAME)|' Makefile

  make
}

package() {
  cd "$srcdir/$_hgrepo-build"
  make DESTDIR="$pkgdir/" install
} 
