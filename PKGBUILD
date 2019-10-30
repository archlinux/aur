# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Petrov Roman <nwhisper@gmail.com>
# Contributor: Andrea Fagiani <andfagiani _at_ gmail dot com>
# Contributor: Larry Hajali <larryhaja@gmail.com>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgbase=calibre-git
pkgname=(calibre-git calibre-python3-git)
pkgver=3.48.0.r412.g380ccbc2d4
pkgrel=1
pkgdesc="Ebook management application"
arch=('i686' 'x86_64')
url="https://calibre-ebook.com/"
license=('GPL3')
_py_deps=('apsw' 'beautifulsoup4' 'cssselect' 'css-parser' 'dateutil' 'dbus' 'dnspython'
          'feedparser' 'html2text' 'html5-parser' 'lxml' 'markdown' 'mechanize' 'msgpack'
          'netifaces' 'unrardll' 'pillow' 'psutil' 'pygments' 'pyqt5' 'pyqtwebengine' 'regex')
_py3_deps=("${_py_deps[@]}" 'zeroconf')
depends=('chmlib' 'hunspell' 'icu' 'jxrlib' 'libmtp' 'libusbx' 'libwmf' 'mathjax2' 'mtdev' 'optipng'
         'podofo' 'qt5-svg' 'udisks2')
makedepends=('git' "${_py_deps[@]/#/python2-}" "${_py3_deps[@]/#/python-}" 'qt5-x11extras'
             'sip' 'xdg-utils' 'rapydscript-ng') #'python2-sphinx')
checkdepends=('xorg-server-xvfb')
optdepends=('poppler: required for converting pdf to html')
source=("git+https://github.com/kovidgoyal/${pkgbase%-git}.git?signed"
        "git+https://github.com/kovidgoyal/${pkgbase%-git}-translations.git?signed"
        "user-agent-data.json")
sha256sums=('SKIP'
            'SKIP'
            'd17a1fff7bf441db8d1ec826afd8661352869ec4e5edd2a17f917ef2fbf01043')
validpgpkeys=('3CE1780F78DD88DF45194FD706BC317B515ACE7C') # Kovid Goyal (New longer key) <kovid@kovidgoyal.net>

pkgver() {
    cd "${srcdir}/${pkgbase%-git}"

    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
    cd "${srcdir}/${pkgbase%-git}"

    python2 setup.py git_version

    # Link translations to build dir
    ln -sfT ../calibre-translations translations

    # Desktop integration (e.g. enforce arch defaults)
    # Use uppercase naming scheme, don't delete config files under fakeroot.
    sed -e "/import config_dir/,/os.rmdir(config_dir)/d" \
        -e "s/^Name=calibre/Name=Calibre/g" \
        -i  src/calibre/linux.py

    # cherry-picked bits of python2-backports.functools_lru_cache
    # needed for frozen builds + beautifulsoup4
    # see https://github.com/kovidgoyal/calibre/commit/b177f0a1096b4fdabd8772dd9edc66662a69e683#commitcomment-33169700
    rm -r src/backports
}

build() {
    cd "${srcdir}/${pkgbase%-git}"

    # Don't use the bootstrapper, since it tries to checkout/pull the
    # translations repo and generally touch the internet. Instead call each
    # *needed* subcommmand.
    # LANG='en_US.UTF-8' python2 setup.py bootstrap

    LANG='en_US.UTF-8' python2 setup.py build
    LANG='en_US.UTF-8' python2 setup.py iso639
    LANG='en_US.UTF-8' python2 setup.py iso3166
    LANG='en_US.UTF-8' python2 setup.py translations
    LANG='en_US.UTF-8' python2 setup.py gui
    LANG='en_US.UTF-8' python2 setup.py resources --path-to-mathjax /usr/share/mathjax2 --system-mathjax

    LANG='en_US.UTF-8' CALIBRE_PY3_PORT=1 python3 setup.py build

    # manpages simply don't build at the moment:
    # https://github.com/sphinx-doc/sphinx/issues/5150
    #LANG='en_US.UTF-8' python2 setup.py man_pages

    # This tries to download new user-agent data, so pre-seed a
    # recently-generated copy to allow offline builds.
    cp ../user-agent-data.json resources/
    LANG='en_US.UTF-8' python2 setup.py recent_uas || true
}

check() {
    cd "${srcdir}/${pkgbase%-git}"

    # without xvfb-run this fails with much "Control socket failed to recv(), resetting"
    # ERROR: test_websocket_perf (calibre.srv.tests.web_sockets.WebSocketTest)
    # one or two tests are a bit flaky, but the python3 build seems to succeed more often
    LANG='en_US.UTF-8' xvfb-run env CALIBRE_PY3_PORT=1 python3 setup.py test
    LANG='en_US.UTF-8' xvfb-run python2 setup.py test
}

package_calibre-git() {
    depends+=("${_py_deps[@]/#/python2-}")
    optdepends+=('ipython2: to use calibre-debug')
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")

    cd "${srcdir}/${pkgbase%-git}"

    # If this directory don't exist, zsh completion won't install.
    install -d "${pkgdir}/usr/share/zsh/site-functions"

    LANG='en_US.UTF-8' python2 setup.py install \
        --staging-root="${pkgdir}/usr" \
        --prefix=/usr
    rm -r "${pkgdir}"/usr/lib/calibre/calibre/plugins/3/

    #cp -a man-pages/ "${pkgdir}/usr/share/man"

    # not needed at runtime
    rm -r "${pkgdir}"/usr/share/calibre/rapydscript/

    # Compiling bytecode FS#33392
    # This is kind of ugly but removes traces of the build root.
    while read -rd '' _file; do
        _destdir="$(dirname "${_file#${pkgdir}}")"
        python2 -m compileall -d "${_destdir}" "${_file}"
        python2 -O -m compileall -d "${_destdir}" "${_file}"
    done < <(find "${pkgdir}"/usr/lib/ -name '*.py' -print0)
}

package_calibre-python3-git() {
    depends+=("${_py3_deps[@]/#/python-}" 'calibre-git')
    optdepends+=('ipython: to use calibre-debug')
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")

    cd "${srcdir}/${pkgbase%-git}"

    LANG='en_US.UTF-8' CALIBRE_PY3_PORT=1 python3 setup.py install \
        --staging-root="${pkgdir}/usr" \
        --prefix=/usr \
        --no-postinstall \
        --bindir=/opt/calibre-python3 \
        --staging-bindir="${pkgdir}"/opt/calibre-python3 \
        --staging-sharedir="${srcdir}"/temp

    # Compiling bytecode FS#33392
    # This is kind of ugly but removes traces of the build root.
    while read -rd '' _file; do
        _destdir="$(dirname "${_file#${pkgdir}}")"
        python3 -m compileall -d "${_destdir}" "${_file}"
        python3 -O -m compileall -d "${_destdir}" "${_file}"
    done < <(find "${pkgdir}"/usr/lib/ -name '*.py' -print0)

    # cleanup overlapping files
    find "${pkgdir}"/usr/lib/calibre -name '*.py' -delete
    rm "${pkgdir}"/usr/lib/calibre/calibre/plugins/*.so
}
