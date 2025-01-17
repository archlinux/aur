# Maintainer: a821
# Contributor: louipc <base64:bG91aXBjQGdteC5jb20=>

pkgname=mutt-git
pkgver=2.2.13.r81.g423f5002
pkgrel=1
epoch=1
pkgdesc="A small but very powerful text-based mail client"
url="http://www.mutt.org/"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
depends=('gdbm'  'glibc'  'gpgme'  'krb5'  'libgpg-error'  'libidn2'  'libsasl'
         'mime-types'  'ncurses'  'openssl'  'sqlite'  'zlib')
makedepends=('docbook-xml'  'docbook-xsl'  'elinks'  'git'  'libxslt'  'lynx')
optdepends=(
  'perl: for smime_keys'
  'python: for experimental mutt_oath2.py'
  'smtp-forwarder: to send mail'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
backup=("etc/mutt/Muttrc")
source=("$pkgname::git+https://gitlab.com/muttmua/mutt.git")
md5sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long | sed 's/^mutt-\([0-9\-]\+\)-rel-/\1-r/;s/-/./g'
}

prepare() {
    cd $pkgname
    autoreconf -fiv
}

build() {
    local _configure_options=(
        --prefix=/usr
        --sysconfdir=/etc/mutt
        --enable-autocrypt
        --enable-compressed
        --enable-debug
        --enable-gpgme
        --enable-hcache
        --enable-imap
        --enable-pop
        --enable-sidebar
        --enable-smtp
        --with-gdbm
        --with-curses=/usr
        --with-gss=/usr
        --with-idn2
        --with-sasl
        --with-sqlite3
        --with-ssl=/usr
    )
    cd $pkgname
    ./configure "${_configure_options[@]}"
    make
}

package() {
    make DESTDIR="${pkgdir}" install -C $pkgname
    # Muttrc is backed up; a copy is not needed
    rm -v "$pkgdir/etc/mutt/Muttrc.dist"
    # mime types are provided by mailcap 
    rm -v "$pkgdir/etc/mutt/mime.types"{,.dist}
    ln -sv ../mime.types "$pkgdir/etc/mutt/mime.types"
}

# vim: set ts=4 sw=4 et:
