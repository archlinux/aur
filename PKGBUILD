# Maintainer: Alessio Sergi <asergi at archlinux dot us>
# Contributor: tobias [tobias [at] archlinux.org]
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=mutt-sidebar
pkgver=1.6.0
pkgrel=1
pkgdesc='Small but very powerful text-based mail client'
arch=('i686' 'x86_64' 'armv7h' 'armv7l')
url='http://www.mutt.org/'
license=('GPL')
depends=('gpgme' 'krb5' 'libidn' 'mime-types')
optdepends=('smtp-forwarder: to send mail')
conflicts=('mutt')
provides=('mutt')
source=("https://bitbucket.org/mutt/mutt/downloads/mutt-${pkgver}.tar.gz"
        "trash-folder.patch"
        "sidebar.patch"
        "sidebar-delimnullwide.patch"
        "sidebar-newonly.patch"
        "sidebar-compose.patch"
       )
validpgpkeys=('8975A9B33AA37910385C5308ADEF768480316BDA')

prepare() {
  cd "$srcdir/mutt-$pkgver"

  # patch to add trash folder support
  # patch -Np1 -i "$srcdir"/trashfolder-1.5.22.diff0
  patch -Np1 -i "$srcdir"/trash-folder.patch

  # patch to add sidebar support
  patch -p 1 -i "$srcdir"/sidebar.patch
  patch -p 1 -i "$srcdir"/sidebar-delimnullwide.patch
  patch -p 1 -i "$srcdir"/sidebar-newonly.patch
  patch -p 1 -i "$srcdir"/sidebar-compose.patch

  # fix automake issue
  autoreconf -vfi
}

build() {
  cd "$srcdir/mutt-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
              --enable-gpgme --enable-pop \
              --enable-imap --enable-smtp \
              --enable-hcache --with-curses=/usr \
              --with-regex --with-gss=/usr \
              --with-ssl=/usr --with-sasl \
              --with-idn
  make
}

package() {
  cd "$srcdir/mutt-$pkgver"
  make DESTDIR="$pkgdir" install

  # remove unneeded or conflicting files
  rm "$pkgdir"/etc/mime.types{,.dist}
  rm "$pkgdir"/usr/bin/{flea,muttbug}
  rm "$pkgdir"/usr/share/man/man1/{flea,muttbug}.1
}
sha512sums=('601d5f70c7cd30903799714cd85b80f9650a029e621d044075e123656411dde809d5cef24a40ba49860bc242cf4a0b914c703deb5a7125b3a24eeb93f4ae3c4c'
            '13f2f6402d3bb407d5e0a04049f7be27c9dbc0ccb9681fe7640d060cc3c13d76a8cf9985da8daa680058603b317f9dbf1b2125aa9e103c625add0d8d530b2538'
            '636309d514834c16ae51691aec757d35fb999404fd29ad41f80bd70f9b9370cb74a2ee84000599ffbd6f197a5316a89567ced9ac6dedaf6270b9aa4fbc90be71'
            'defb96553dd26e7909ec06964729217c75a1bbb88bb00b6c4a07703b4c64952d06bfe1cd9f1c1aa9a6bf6cfbc5b0cc3933002387ca3b55b6399b1445474bd929'
            'b0f9184564eb75c36c3f807a7088f2c83a72fcfc1b91feed94919e98bbbbcc74fb07776d730871ca4caa87a044fbd00f906dfbb1928b8fd5f23d1526d6375dbd'
            'c7c1df28937b64777e66ef86a198bb168532093066c00c8aa349d76aa7a7d7f799fcc1fe0d7eb5e59a73223a43cdb4c38ab1881d644fd5ae5467844f44cb2dd9')
