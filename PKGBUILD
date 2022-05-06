# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=claws-mail-gtk2
_pkgname=claws-mail
pkgver=3.19.0
pkgrel=1
pkgdesc="A GTK+ based e-mail client."
arch=('x86_64' 'i686')
license=('GPL3')
url="https://www.claws-mail.org"
depends=('gtk2' 'gnutls' 'startup-notification' 'enchant' 'gpgme' 
         'libetpan' 'compface' 'libsm' 'dbus-glib')
makedepends=('spamassassin' 'bogofilter' 'networkmanager' 'valgrind'
             # dependencies for plugins
             'libgdata' 'libnotify' 'libcanberra' 'poppler-glib' 'libytnef' 'libical'
             'dillo' 'python' 'gumbo-parser'
             # deps to build the docs
             'docbook-utils' 'texlive-formatsextra')
optdepends=('python:            needed for some tools'
            'perl:              needed for some tools and perl plugin'
            'spamassassin:      adds support for spamfiltering'
            'bogofilter:        adds support for spamfiltering'
            'libnotify:         for notification plugin'
            'libcanberra:       for notification plugin'
            'dbus:              for notification plugin'
            'libxml2:           for gtkhtml2_viewer and rssyl plugins'
            'curl:              for gtkhtml2_viewer, vcalendar, rssyl and spamreport plugins'
            'libarchive:        for archive plugin and various other plugins'
            'libytnef:          for tnef_parse plugin'
            'libgdata:          for gdata plugin'
            'poppler-glib:      for pdf viewer plugin'
            'ghostscript:       for pdf viewer plugin'
            'libical:           for vcalendar plugin'
            'dillo:             for html viewer plugin'
            'gumbo-parser:      for litehtml plugin')
provides=('claws' "$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(https://www.claws-mail.org/download.php?file=releases/claws-mail-$pkgver.tar.xz{,.asc}
        bash_completion)
sha256sums=('0d0c757a9975da1f97bf5309cd051c18ad6c765fefe9319276aa3a9e48229fa2'
            'SKIP'
            '3f6c248b8658cd7a62186bff572cce2525712a498f363cbbda1ed459021c28cb')
validpgpkeys=('8B3B297A03468356692F8D592CD716D654D6BBD4') # Paul <paul@claws-mail.org>

build() {
  cd "${_pkgname}"-${pkgver}
  ./configure --prefix=/usr --disable-static \
    --enable-enchant \
    --enable-gnutls \
    --enable-ldap \
    --enable-crash-dialog \
    --enable-pgpmime-plugin \
    --enable-spamassassin-plugin \
    --enable-bogofilter-plugin
  # Fight unused direct deps
  sed -i -e "s| -shared | $LDFLAGS\0 |g" libtool
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
