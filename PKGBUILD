# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Petrov Roman <nwhisper@gmail.com>
# Contributor: Andrea Fagiani <andfagiani _at_ gmail dot com>
# Contributor: Larry Hajali <larryhaja@gmail.com>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgbase=calibre-git
pkgname=calibre-git
pkgver=5.22.1.r16.g4dc0502a29
pkgrel=1
_dictionaries_commit="8cd38fb5138f2e456506aaa889ec2b7042a7439e"
pkgdesc="Ebook management application"
arch=('i686' 'x86_64')
url="https://calibre-ebook.com/"
license=('GPL3')
_py_deps=('apsw' 'beautifulsoup4' 'cchardet' 'cssselect' 'css-parser' 'dateutil' 'dnspython'
          'feedparser' 'html2text' 'html5-parser' 'jeepney' 'lxml' 'markdown' 'mechanize' 'msgpack'
          'netifaces' 'unrardll' 'pillow' 'psutil' 'py7zr' 'pychm' 'pygments' 'pyqt5'
          'pyqtwebengine' 'regex' 'zeroconf')
depends=('hunspell' 'hyphen' 'icu' 'jxrlib' 'libmtp' 'libstemmer' 'libusb'
         'libwmf' 'mathjax' 'mtdev' 'optipng' 'podofo'
         "${_py_deps[@]/#/python-}" 'qt5-imageformats' 'qt5-svg' 'ttf-liberation' 'udisks2')
makedepends=('git' 'qt5-x11extras' 'sip' 'pyqt-builder' 'xdg-utils' 'rapydscript-ng' 'python-sphinx')
checkdepends=('xorg-server-xvfb')
optdepends=('poppler: required for converting pdf to html')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'calibre-common' 'calibre-python3')
replaces=('calibre-common-git' 'calibre-python3-git')
source=("git+https://github.com/kovidgoyal/${pkgbase%-git}.git?signed"
        "git+https://github.com/kovidgoyal/${pkgbase%-git}-translations.git?signed"
        "dictionaries-${_dictionaries_commit}.tar.gz::https://github.com/LibreOffice/dictionaries/archive/${_dictionaries_commit}.tar.gz"
        "user-agent-data.json")
sha256sums=('SKIP'
            'SKIP'
            '50a90de207ce177cb415e3694d16906cfcb7bdb0f8602b8a23bca25f8276d46a'
            '26e00a8de411f3a134735d508f4bb7b85f9c1abe5b9d031d3d50d59450e74bd6')
validpgpkeys=('3CE1780F78DD88DF45194FD706BC317B515ACE7C') # Kovid Goyal (New longer key) <kovid@kovidgoyal.net>

pkgver() {
    cd "${srcdir}/${pkgbase%-git}"

    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
    cd "${srcdir}/${pkgbase%-git}"

    python setup.py git_version

    # Link translations to build dir
    ln -sfT ../calibre-translations translations

    # Desktop integration (e.g. enforce arch defaults)
    # Use uppercase naming scheme, don't delete config files under fakeroot.
    sed -e "/import config_dir/,/os.rmdir(config_dir)/d" \
        -e "s/^Name=calibre/Name=Calibre/g" \
        -i  src/calibre/linux.py
}

build() {
    cd "${srcdir}/${pkgbase%-git}"

    # Don't use the bootstrapper, since it tries to checkout/pull the
    # translations repo and generally touch the internet. Instead call each
    # *needed* subcommmand.
    # LANG='en_US.UTF-8' python2 setup.py bootstrap

    LANG='en_US.UTF-8' python setup.py build
    LANG='en_US.UTF-8' python setup.py iso639
    LANG='en_US.UTF-8' python setup.py iso3166
    LANG='en_US.UTF-8' python setup.py translations
    LANG='en_US.UTF-8' python setup.py gui
    LANG='en_US.UTF-8' python setup.py resources \
        --path-to-liberation_fonts /usr/share/fonts/liberation --system-liberation_fonts \
        --path-to-mathjax /usr/share/mathjax --system-mathjax \
        --path-to-hyphenation "${srcdir}"/dictionaries-${_dictionaries_commit}
    LANG='en_US.UTF-8' python setup.py man_pages

    # This tries to download new user-agent data, so pre-seed a
    # recently-generated copy to allow offline builds.
    cp ../user-agent-data.json resources/
    LANG='en_US.UTF-8' python setup.py recent_uas || true
}

check() {
    cd "${srcdir}/${pkgbase%-git}"

    _test_excludes=(
        # merely testing if a runtime-optional feature works, but is not
        # operative yet e.g. only tries checking if the optdepend is importable
        'speech_dispatcher'
        # tests if a completely unused module is bundled
        'pycryptodome'
    )

    # without xvfb-run this fails with much "Control socket failed to recv(), resetting"
    # ERROR: test_websocket_perf (calibre.srv.tests.web_sockets.WebSocketTest)
    # one or two tests are a bit flaky, but the python3 build seems to succeed more often
    LANG='en_US.UTF-8' xvfb-run python setup.py test "${_test_excludes[@]/#/--exclude-test-name=}"
}

package() {
    cd "${srcdir}/${pkgbase%-git}"

    # If this directory doesn't exist, zsh completion won't install.
    install -d "${pkgdir}/usr/share/zsh/site-functions"

    LANG='en_US.UTF-8' python setup.py install \
        --staging-root="${pkgdir}/usr" \
        --prefix=/usr \
        --system-plugins-location /usr/share/calibre/system-plugins

    cp -a man-pages/ "${pkgdir}/usr/share/man"

    # not needed at runtime
    rm -r "${pkgdir}"/usr/share/calibre/rapydscript/

    while read -rd '' _file; do
        _destdir="$(dirname "${_file#${pkgdir}}")"
        python3 -m compileall -d "${_destdir}" "${_file}"
        python3 -O -m compileall -d "${_destdir}" "${_file}"
    done < <(find "${pkgdir}"/usr/lib/ -name '*.py' -print0)
}
