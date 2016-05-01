# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>
# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=atom-editor-beta
_pkgrel=3
_pkgver=1.8.0
pkgver="${_pkgver}.${_pkgrel}"
pkgrel=1
pkgdesc='Chrome-based text editor from GitHub - Beta Channel'
arch=('x86_64' 'i686')
url='https://github.com/atom/atom'
license=('MIT')
depends=('alsa-lib' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python2')
optdepends=('gvfs: file deletion support')
makedepends=('git' 'npm')
conflicts=('atom-editor-beta-bin')
install=atom.install
source=("https://github.com/atom/atom/archive/v${_pkgver}-beta${_pkgrel}.tar.gz")
sha256sums=('58c79049787a0b844c434d1364bb25ed2ce8176eaf565efaf9312bc6e68bca99')

prepare() {
	cd "$srcdir/atom-${_pkgver}-beta${_pkgrel}"

	sed -i -e "/exception-reporting/d" \
	       -e "/metrics/d" \
         -e "s/0.36.8/0.36.12/g" package.json

	chmod 755 -R package.json

  sed -e "s/<%= description %>/$pkgdesc/" \
      -e "s|<%= appName %>|Atom Beta|"\
      -e "s|<%= installDir %>/share/<%= appFileName %>/atom|/usr/bin/atom-beta|"\
      -e "s|<%= iconPath %>|atom-beta.png|"\
      -e "s|GNOME;||" \
      -e "s|text/plain;|application/javascript;application/json;application/postscript;application/x-csh;application/x-desktop;application/x-httpd-eruby;application/x-httpd-php;application/x-httpd-php3;application/x-httpd-php4;application/x-httpd-php5;application/x-latex;application/x-msdos-program;application/x-ruby;application/x-sh;application/x-shellscript;application/x-sql;application/x-tcl;application/x-tex;application/xhtml+xml;application/xml;application/xml-dtd;application/xslt+xml;text/css;text/csv;text/html;text/plain;text/xml;text/xml-dtd;text/x-asm;text/x-bibtex;text/x-boo;text/x-c++;text/x-c++hdr;text/x-c++src;text/x-c;text/x-chdr;text/x-csh;text/x-csrc;text/x-dsrc;text/x-diff;text/x-eiffel;text/x-fortran;text/x-go;text/x-haskell;text/x-java;text/x-java-source;text/x-lua;text/x-makefile;text/x-markdown;text/x-objc;text/x-pascal;text/x-perl;text/x-php;text/x-python;text/x-ruby;text/x-scala;text/x-scheme;text/x-sh;text/x-tcl;text/x-tex;text/x-vala;text/yaml;|" \
      resources/linux/atom.desktop.in > resources/linux/atom-beta.desktop
}

build() {
	cd "$srcdir/atom-${_pkgver}-beta${_pkgrel}"

	export PYTHON=/usr/bin/python2
	until ./script/build --build-dir "$srcdir/atom-build"; do :; done
}

package() {
	cd "$srcdir/atom-${_pkgver}-beta${_pkgrel}"

	script/grunt install --build-dir "$srcdir/atom-build" --install-dir "$pkgdir/usr"

	if [[ -d "$pkgdir/usr/share/atom" ]]; then
  	mv "$pkgdir/usr/share/atom" "$pkgdir/usr/share/atom-beta"
	fi

  if [[ -f "$pkgdir/usr/bin/atom" ]]; then
		mv "$pkgdir/usr/bin/atom" "$pkgdir/usr/bin/atom-beta"
  fi

	if [[ -f "$pkgdir/usr/bin/apm" ]]; then
		rm "$pkgdir/usr/bin/apm"
	fi

	ln -sf "${pkgdir}/usr/share/atom-beta/resources/app/apm/node_modules/.bin/apm" "${pkgdir}/usr/bin/apm-beta"

	if [[ -f "$pkgdir/usr/share/applications/atom.desktop" ]]; then
  	rm "$pkgdir/usr/share/applications/atom.desktop"
	fi

	install -Dm644 resources/linux/atom-beta.desktop "$pkgdir/usr/share/applications/atom-beta.desktop"
	install -Dm644 resources/app-icons/beta/png/1024.png "$pkgdir/usr/share/pixmaps/atom-beta.png"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
