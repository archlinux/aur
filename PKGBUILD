# Maintainer: Alex Potapenko <opotapenko@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Petrov Roman <nwhisper@gmail.com>
# Contributor: Andrea Fagiani <andfagiani _at_ gmail dot com>
# Contributor: Larry Hajali <larryhaja@gmail.com>

pkgname=calibre-git
pkgver=9.3.1.r5.g0343c52821
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
         lxml-html-clean
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
         pykakasi
         pyqt6
         pyqt6-webengine
         regex
         unrardll
         xxhash
         zeroconf
         zstandard)
depends=(espeak-ng-git
         hunspell
         hyphen
         icu
         jxrlib
         libmtp
         libstemmer
         libusb
         libwmf
         mathjax
         mtdev
         onnxruntime-cpu
         optipng
         podofo
         protobuf
         "${_pydeps[@]/#/python-}"
         qt6-imageformats
         qt6-multimedia
         qt6-speech
         qt6-svg
         qt6-webengine
         ttf-liberation
         uchardet
         udisks2
         zstd)
makedepends=(cmake
             git
             pyqt-builder
             rapydscript-ng
             sip
             xdg-utils
             python-sphinx)
checkdepends=(poppler
              python-fonttools
              python-tzdata
              python-tzlocal
              speech-dispatcher
              tk)
optdepends=('poppler: required for converting pdf to html'
            'python-fonttools: required for font subset feature in epub editor'
            'speech-dispatcher: TTS support in the viewer')

provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}"
           calibre-common
           calibre-python3)
source=("git+https://github.com/kovidgoyal/${pkgname%-git}.git?signed"
        "git+https://github.com/kovidgoyal/${pkgname%-git}-translations.git?signed"
        user-agent-data.json
        parallel_build.py)
sha256sums=('SKIP'
            'SKIP'
            '77a3b62ae46566583c4a772aadd54b237c9f8b3635d40cd74eb7990c535340dc'
            '8232ade057e0dd8f9e2ba7668da7f920fdcbcf99552e00123e1a3848c50ad065')
# Kovid Goyal (New longer key) <kovid@kovidgoyal.net>:
# https://keyserver.ubuntu.com/pks/lookup?search=06BC317B515ACE7C&fingerprint=on&op=index
validpgpkeys=('3CE1780F78DD88DF45194FD706BC317B515ACE7C')
pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
	cd "${pkgname%-git}"
	python setup.py git_version
	# Link translations to build dir
	ln -sfT ../calibre-translations translations
	# Desktop integration (e.g. enforce arch defaults)
	# Use uppercase naming scheme, don't delete config files under fakeroot.
	sed -e "/import config_dir/,/os.rmdir(config_dir)/d" \
		-e "s/'ctc-posml'/'text' not in mt and 'pdf' not in mt and 'xhtml'/" \
		-e "s/^Name=calibre/Name=Calibre/g" \
		-i  src/calibre/linux.py
	# Use /usr/share/mathjax/input/tex.js instead of /usr/share/mathjax/input/tex-full.js
	sed -i 's/tex-full/tex/g' setup/mathjax.py
	# Remove unneeded files
	rm -f resources/$pkgname-portable.*
	# Fix ThreadPool/resource_tracker BrokenPipeError in chroot with Python 3.14
	cp -f "$srcdir/parallel_build.py" setup/parallel_build.py
}

check() {
	cd "${pkgname%-git}"
	export LANG='en_US.UTF-8'
	export CALIBRE_CONFIG_DIRECTORY="$(mktemp -d)"
	python setup.py test --under-sanitize --exclude-test-name test_websocket_basic
	python setup.py test_rs
 }

build() {
	cd "${pkgname%-git}"
	export LANG='en_US.UTF-8'
	python setup.py build
	python setup.py iso639
	python setup.py iso3166
	python setup.py gui
	python setup.py translations
	python setup.py hyphenation
	python setup.py liberation_fonts --system-liberation_fonts --path-to-liberation_fonts /usr/share/fonts/liberation
	python setup.py mathjax --system-mathjax --path-to-mathjax /usr/share/mathjax
	python setup.py man_pages
	python setup.py resources
}


package() {
	cd "${pkgname%-git}"
	export LANG='en_US.UTF-8'

	# If this directory doesn't exist, zsh completion won't install.
	install -d "${pkgdir}/usr/share/zsh/site-functions"

	python setup.py install \
		--staging-root="${pkgdir}/usr" \
		--prefix=/usr \
		--system-plugins-location=/usr/share/calibre/system-plugins

	cp -a man-pages/ "${pkgdir}/usr/share/man"

	cp -f "$srcdir/user-agent-data.json" "${pkgdir}/usr/share/calibre/user-agent-data.json"

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
