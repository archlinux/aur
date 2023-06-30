# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Petrov Roman <nwhisper@gmail.com>
# Contributor: Andrea Fagiani <andfagiani _at_ gmail dot com>
# Contributor: Larry Hajali <larryhaja@gmail.com>

pkgbase=calibre-git
pkgname=calibre-git
pkgver=6.22.0.r1.gca2b4e02ed
pkgrel=1
pkgdesc='Ebook management application'
arch=(x86_64 i686)
url=https://calibre-ebook.com
license=(GPL3)
_pydeps=(apsw
         beautifulsoup4
         faust-cchardet
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
             git
             pyqt-builder
             rapydscript-ng
             sip
             xdg-utils)
optdepends=('poppler: required for converting pdf to html'
            'python-fonttools: required for font subset feature in epub editor'
            'speech-dispatcher: TTS support in the viewer')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}"
           calibre-common
           calibre-python3)
replaces=(calibre-common-git
          calibre-python3-git)
source=("git+https://github.com/kovidgoyal/${pkgbase%-git}.git?signed"
        "git+https://github.com/kovidgoyal/${pkgbase%-git}-translations.git?signed"
        user-agent-data.json)
sha256sums=('SKIP'
            'SKIP'
            '26e00a8de411f3a134735d508f4bb7b85f9c1abe5b9d031d3d50d59450e74bd6')
validpgpkeys=('3CE1780F78DD88DF45194FD706BC317B515ACE7C') # Kovid Goyal (New longer key) <kovid@kovidgoyal.net>

pkgver() {
	cd "${pkgbase%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
	cd "${pkgbase%-git}"
	python setup.py git_version

	# Link translations to build dir
	ln -sfT ../calibre-translations translations

	# Desktop integration (e.g. enforce arch defaults)
	# Use uppercase naming scheme, don't delete config files under fakeroot.
	sed -e "/import config_dir/,/os.rmdir(config_dir)/d" \
		-e "s/'ctc-posml'/'text' not in mt and 'pdf' not in mt and 'xhtml'/" \
		-e "s/^Name=calibre/Name=Calibre/g" \
		-i  src/calibre/linux.py

	# Remove unneeded files
	rm -f resources/$pkgname-portable.*
}

build() {
	cd "${pkgbase%-git}"
	export LANG='en_US.UTF-8'
	python setup.py build
	python setup.py iso639
	python setup.py iso3166
	python setup.py resources \
		--system-liberation_fonts --path-to-liberation_fonts /usr/share/fonts/liberation \
		--system-mathjax --path-to-mathjax /usr/share/mathjax
	python setup.py gui
}

check() {
	cd "${pkgbase%-git}"
	export LANG='en_US.UTF-8'
	python -m unittest discover
}

package() {
	cd "${pkgbase%-git}"
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
