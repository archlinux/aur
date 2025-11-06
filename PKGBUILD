# Maintainer: Edmund Lodewijks <edmund@proteamail.com>
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=claws-mail-git
pkgver=4.3.1.r173.g85f0e2c65
pkgrel=1
pkgdesc='A GTK+ based e-mail client - git checkout'
arch=('i686' 'x86_64')
license=('GPL-3.0-or-later')
url='https://www.claws-mail.org/'
depends=('gtk3' 'gnutls' 'startup-notification' 'enchant' 'gpgme'
         'libetpan' 'compface' 'libsm' 'dbus-glib' 'webkit2gtk' 'perl')
makedepends=('git' 'glib2-devel' 'spamassassin' 'bogofilter' 'networkmanager'
             # dependencies for plugins
             'libgdata' 'libnotify' 'libcanberra' 'poppler-glib' 'libytnef' 'libical'
             'python' 'gumbo-parser'
             # deps to build the docs
             'docbook-utils' 'texlive-formatsextra' 'lynx')
optdepends=('python:           needed for some tools'
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
            'gumbo-parser:      for litehtml plugin')
conflicts=('claws-mail')
provides=('claws' 'claws-mail')
source=(
    'claws-mail::git://git.claws-mail.org/claws.git'
    'bash_completion'
)
b2sums=('SKIP'
        '20de724d8c10e4c5e9bf22abbd71a71a4da68e0cf1009fb1b9858ea5e55e74aaffadad6689f4f6669532e492c6ee08100800474a90af6b8dcb8b590358858a2b')

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
    autopoint -f
    autoreconf -fvi
}

build() {
  cd claws-mail/

  ./configure \
    --prefix=/usr \
    --disable-static \
    --disable-dependency-tracking \
    --disable-rpath \
    --enable-acpi_notifier-plugin \
    --enable-address-keeper-plugin \
    --enable-archive-plugin \
    --enable-att_remover-plugin \
    --enable-attachwarner-plugin \
    --enable-bogofilter-plugin \
    --enable-enchant \
    --enable-fancy-plugin \
    --enable-gnutls \
    --enable-ldap \
    --enable-libetpan \
    --enable-litehtml_viewer-plugin \
    --enable-plugins-fetchinfo \
    --enable-plugins-libravatar \
    --enable-plugins-managesieve \
    --enable-plugins-newmail \
    --enable-plugins-notification \
    --enable-plugins-pdf-viewer \
    --enable-plugins-spam-report \
    --enable-plugins-vcalendar \
    --enable-pgpmime-plugin \
    --enable-smime-plugin \
    --enable-spamassassin-plugin \
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

