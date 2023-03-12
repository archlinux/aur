# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Petrov Roman <nwhisper@gmail.com>
# Contributor: Andrea Fagiani <andfagiani _at_ gmail dot com>
# Contributor: Larry Hajali <larryhaja@gmail.com>

_pkgname=calibre
pkgname=calibre-unicode-path
pkgver=6.14.0
pkgrel=1
pkgdesc='Ebook management application. With unicode filename and path patch.'
arch=(x86_64)
url=https://calibre-ebook.com
license=(GPL3)
_pydeps=(apsw
         beautifulsoup4
         cchardet
         css-parser
         cssselect
         dateutil
         dnspython
         feedparser
         html2text
         html5-parser
         jeepney
         lxml
         markdown
         mechanize
         msgpack
         netifaces
         pdftotext
         pillow
         psutil
         py7zr
         pychm
         pycryptodome
         pygments
         pyqt6
         pyqt6-webengine
         regex
         unrardll
         zeroconf)
depends=(hunspell
         hyphen
         icu
         jxrlib
         libmtp
         libstemmer
         libusb
         libwmf
         mathjax
         mtdev
         optipng
         podofo
         "${_pydeps[@]/#/python-}"
         qt6-imageformats
         qt6-svg
         qt6-webengine
         ttf-liberation
         uchardet
         udisks2)
makedepends=(cmake
             pyqt-builder
             rapydscript-ng
             sip
             xdg-utils)
optdepends=('poppler: required for converting pdf to html'
            'speech-dispatcher: TTS support in the viewer')
provides=("$_pkgname")
conflicts=("$_pkgname"
           calibre-common
           calibre-python3)
replaces=("${conflicts[@]}")
_archive="$_pkgname-$pkgver"
source=("https://download.calibre-ebook.com/$pkgver/$_archive.tar.xz"
        "$url/signatures/$_archive.tar.xz.sig"
        "000-fix-unicode-filename.patch")
sha256sums=('6c66f245554d35b58aa84b6cf3e30f1e3506cd50427f1454a11017f1ae931a2b'
            'SKIP'
            'SKIP')
validpgpkeys=('3CE1780F78DD88DF45194FD706BC317B515ACE7C') # Kovid Goyal (New longer key) <kovid@kovidgoyal.net>

prepare(){
	cd "$_archive"

	# Desktop integration (e.g. enforce arch defaults)
	# Use uppercase naming scheme, don't delete config files under fakeroot.
	sed -e "/import config_dir/,/os.rmdir(config_dir)/d" \
		-e "s/'ctc-posml'/'text' not in mt and 'pdf' not in mt and 'xhtml'/" \
		-e "s/^Name=calibre/Name=Calibre/g" \
		-i  src/calibre/linux.py

  patch -p1 < "${srcdir}/000-fix-unicode-filename.patch"

	# Remove unneeded files
	rm -f resources/$pkgname-portable.*
}

build() {
	cd "$_archive"
	export LANG='en_US.UTF-8'
	python setup.py build
	python setup.py gui
	python setup.py liberation_fonts --system-liberation_fonts --path-to-liberation_fonts /usr/share/fonts/liberation
	python setup.py mathjax --system-mathjax --path-to-mathjax /usr/share/mathjax
	python setup.py iso639
	python setup.py iso3166
	python setup.py translations
	python setup.py resources
}

check() {
	cd "$_archive"
	export LANG='en_US.UTF-8'
	python -m unittest discover
}

package() {
	cd "$_archive"
        export LANG='en_US.UTF-8'

	# If this directory doesn't exist, zsh completion won't install.
	install -d "${pkgdir}/usr/share/zsh/site-functions"

	python setup.py install \
		--staging-root="${pkgdir}/usr" \
		--prefix=/usr \
		--system-plugins-location=/usr/share/calibre/system-plugins

	cp -a man-pages/ "${pkgdir}/usr/share/man"

	# not needed at runtime
	rm -r "${pkgdir}"/usr/share/calibre/rapydscript/

	# Compiling bytecode FS#33392
	# This is kind of ugly but removes traces of the build root.
	while read -rd '' _file; do
		_destdir="$(dirname "${_file#${pkgdir}}")"
		python -m compileall -d "${_destdir}" "${_file}"
		python -O -m compileall -d "${_destdir}" "${_file}"
	done < <(find "${pkgdir}"/usr/lib/ -name '*.py' -print0)
}
