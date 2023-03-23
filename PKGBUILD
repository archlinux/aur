# Maintainer: William Huang <wp@nerde.pw>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_pkgname=claws-mail
pkgname=$_pkgname-title-superset
pkgver=4.1.1
pkgrel=1
pkgdesc="A GTK+ based e-mail client - patched to use charset supersets to decode titles"
arch=('x86_64')
license=('GPL3')
url="https://www.claws-mail.org"
depends=('gtk3' 'gnutls' 'startup-notification' 'enchant' 'gpgme'
         'libetpan' 'compface' 'libsm' 'dbus-glib')
makedepends=('spamassassin' 'bogofilter' 'networkmanager' 'valgrind'
             # dependencies for plugins
             'libgdata' 'libnotify' 'libcanberra' 'poppler-glib' 'libytnef' 'libical'
             'dillo' 'python' 'gumbo-parser'
             # deps to build the docs
             'docbook-utils' 'texlive-formatsextra')
optdepends=('python:           needed for some tools'
            'perl:              needed for some tools and perl plugin'
            'spamassassin:      adds support for spamfiltering'
            'bogofilter:        adds support for spamfiltering'
            'libnotify:         for notification plugin'
            'libcanberra:       for notification plugin'
            'dbus:              for notification plugin'
            'libxml2:           for rssyl plugins'
            'curl:              for vcalendar, rssyl and spamreport plugins'
            'libarchive:        for archive plugin and various other plugins'
            'libytnef:          for tnef_parse plugin'
            'libgdata:          for gdata plugin'
            'poppler-glib:      for pdf viewer plugin'
            'ghostscript:       for pdf viewer plugin'
            'libical:           for vcalendar plugin'
            'dillo:             for dillo html viewer plugin'
            'webkit2gtk:        for fancy webkit html viewer plugin'
            'gumbo-parser:      for litehtml plugin')
provides=('claws' 'claws-mail')
conflicts=('claws-mail')
install=$_pkgname.install
source=(https://www.claws-mail.org/download.php?file=releases/claws-mail-$pkgver.tar.xz{,.asc}
        0001_encoding.diff
        bash_completion)
sha256sums=('b189e700c1896f5e0deb0b76d4bfa820eb7ac1935ee10aa9afbada3cf53a0344'
            'SKIP'
            '79e2b664d039f5cc0cf642359923e3d100ffc4ab070fc54c02d5792b624e26f6'
            '3f6c248b8658cd7a62186bff572cce2525712a498f363cbbda1ed459021c28cb')
validpgpkeys=('8B3B297A03468356692F8D592CD716D654D6BBD4') # Paul <paul@claws-mail.org>

prepare() {
  cd "${_pkgname}"-${pkgver}
  patch -Np1 -i ../0001_encoding.diff
}

build() {
  cd "${_pkgname}"-${pkgver}
  ./configure --prefix=/usr --disable-static \
    --enable-enchant \
    --enable-gnutls \
    --enable-ldap \
    --enable-crash-dialog \
    --enable-pgpmime-plugin \
    --enable-spamassassin-plugin \
    --enable-bogofilter-plugin \
    --enable-manual
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${_pkgname}"-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm 644 "$srcdir"/bash_completion "${pkgdir}"/usr/share/bash-completion/completions/claws-mail

  # install extra tools
  cd tools
  install -m755 -d "${pkgdir}"/usr/lib/claws-mail/tools
  for files in *.pl *.py *.sh *.conf tb2claws-mail update-po uudec uuooffice README; do
    cp -arv $files "${pkgdir}"/usr/lib/claws-mail/tools/
  done
}
