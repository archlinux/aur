# Maintainer: Alessio Sergi <asergi at archlinux dot us>
# Contributor: tobias [tobias [at] archlinux.org]
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=mutt-sidebar
pkgver=1.5.24
pkgrel=2
pkgdesc='Small but very powerful text-based mail client'
url='http://www.mutt.org/'
license=('GPL')
backup=('etc/Muttrc')
arch=('i686' 'x86_64' 'armv7h' 'armv7l')
optdepends=('smtp-forwarder: to send mail')
depends=('gpgme' 'ncurses' 'openssl' 'libsasl' 'gdbm' 'libidn' 'mime-types' 'krb5')
conflicts=('mutt')
provides=('mutt')
source=("http://ftp.mutt.org/pub/mutt/mutt-${pkgver}.tar.gz"
        "sidebar-compose.patch"
        "sidebar-delimnullwide.patch"
        "sidebar-dotpathsep.patch"
        "sidebar-newonly.patch"
        "sidebar-new.patch"
        "sidebar.patch"
        "sidebar-utf8.patch"
        "trash-folder.patch"
        )
sha512sums=('f7fe7edf9d1701a8e92761b1f5e6ef2e3a3b513af7898872cbe36a8800714cb76945788a60d2008820c57bc5344a4147e2686f690da42cfc8a912e3a432452b1'
            'b4d330d9bad044744c6ff8e68514b58d813c1c77c91766c22b813f3a5e2471c4333bd620b845e3f708a1e6c68871b9428d8a9c5f18dc4dd51810c15bb0e8e5ea'
            '7888ee538fa07425f78dfc8fe098ab0f67f8def9a4c76657c7bf6e33a1590ed7ad2142b3f68663e198d87779b0e9de3229f576c6d95795255767be0311757db1'
            '3266a39fccdbc45562dda4d9765ca825f6dd70f7c3d19edb5eff9baf3d00b13fc103dedf83b2c022b7fd2d1d217d98c367e11b3eb86a06ae86f4fdb2b38d0545'
            '3026988531c312593aac5ce5842d2092998fe33b2950c8961a87bbefe9f3285e41538774261136fb1cbfae7f0e4b183899598905b60dff1ceb0231718cf33dfa'
            '15b92e3319c002a0c44630e11aa9394534179df4aacfd3da53e9a5c91f7e679a31d7940a6f6a08aab7b5149e97143bb4f999a85ea0af8beb61788d6b099fe855'
            '4c2b2901e3c6b4aefcbbdc4573d1821601c7e4ddeb14c72b9c1325dec03f8c8e1f0299a7a0f0f57305eab0c7d1d69e0f043edcbffe09278c3af655db58e8f19e'
            '3668d1080fa485c6a54d3a9ddc72692c58bc343a29c9f3409108768632b412b509188965c1c270abc277d4e7b732a9dbb77d9b5b601925e7933079f86cde9021'
            '13f2f6402d3bb407d5e0a04049f7be27c9dbc0ccb9681fe7640d060cc3c13d76a8cf9985da8daa680058603b317f9dbf1b2125aa9e103c625add0d8d530b2538')

prepare() {
  cd "$srcdir/mutt-$pkgver"

  patch -Np1 -i "${srcdir}/trash-folder.patch"
  patch -Np1 -i "${srcdir}/sidebar.patch"
  patch -Np1 -i "${srcdir}/sidebar-dotpathsep.patch"
  patch -Np1 -i "${srcdir}/sidebar-utf8.patch"
  patch -Np1 -i "${srcdir}/sidebar-newonly.patch"
  patch -Np1 -i "${srcdir}/sidebar-delimnullwide.patch"
  patch -Np1 -i "${srcdir}/sidebar-compose.patch"
  patch -Np1 -i "${srcdir}/sidebar-new.patch"

  # fix automake issue
  autoreconf -vfi
}

build() {
  cd "$srcdir/mutt-$pkgver"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-gpgme \
              --enable-pop \
              --enable-imap \
              --enable-smtp \
              --enable-hcache \
              --with-curses=/usr \
              --with-regex \
              --with-gss=/usr \
              --with-ssl=/usr \
              --with-sasl \
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

  # install Muttrc.gpg file
  install -D -m 644 contrib/gpg.rc "$pkgdir"/etc/Muttrc.gpg.dist
}
