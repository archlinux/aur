# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=claws-mail-git
pkgver=4.1.1.r1.g1e3b95e1d
pkgrel=1
pkgdesc='A GTK+ based e-mail client - git checkout'
arch=('i686' 'x86_64')
license=('GPL3')
url='https://www.claws-mail.org/'
depends=('gtk3' 'gnutls' 'startup-notification' 'enchant' 'gpgme'
         'libetpan' 'compface' 'libsm' 'dbus-glib')
makedepends=('git' 'spamassassin' 'bogofilter' 'networkmanager' 'valgrind'
             # dependencies for plugins
             'libgdata' 'libnotify' 'libcanberra' 'poppler-glib' 'libytnef' 'libical'
             'dillo' 'python' 'gumbo-parser'
             # deps to build the docs
             'docbook-utils' 'texlive-formatsextra' 'lynx')
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
conflicts=('claws-mail')
provides=('claws' 'claws-mail')
source=('claws-mail::git://git.claws-mail.org/claws.git'
        'bash_completion')
sha256sums=('SKIP'
            '3f6c248b8658cd7a62186bff572cce2525712a498f363cbbda1ed459021c28cb')

pkgver() {
	cd claws-mail/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

prepare() {
  cd claws-mail/

  # run autogen without options
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd claws-mail/

  ./configure --prefix=/usr --disable-static \
    --enable-enchant \
    --enable-gnutls \
    --enable-ldap \
    --enable-crash-dialog \
    --enable-pgpmime-plugin \
    --enable-spamassassin-plugin \
    --enable-bogofilter-plugin \
    --enable-fancy-plugin \
    --enable-manual
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make

}

package() {
  cd claws-mail/

  make DESTDIR="${pkgdir}" install

  install -Dm 644 "$srcdir"/bash_completion "${pkgdir}"/usr/share/bash-completion/completions/claws-mail

  # install extra tools
  cd tools
  install -m755 -d "${pkgdir}"/usr/lib/claws-mail/tools
  for files in *.pl *.py *.sh *.conf tb2claws-mail update-po uudec uuooffice README; do
    cp -arv $files "${pkgdir}"/usr/lib/claws-mail/tools/
  done
}

