# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Petrov Roman <nwhisper@gmail.com>
# Contributor: Andrea Fagiani <andfagiani _at_ gmail dot com>
# Contributor: Larry Hajali <larryhaja@gmail.com>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgbase=calibre-git
pkgname=(calibre-common-git calibre-git calibre-python3-git)
pkgver=4.6.0.r6.g15e247f88a
pkgrel=1
_dictionaries_commit="libreoffice-6.4.0.0.beta1"
pkgdesc="Ebook management application"
arch=('i686' 'x86_64')
url="https://calibre-ebook.com/"
license=('GPL3')
_py_deps=('apsw' 'beautifulsoup4' 'cssselect' 'css-parser' 'dateutil' 'dbus' 'dnspython'
          'feedparser' 'html2text' 'html5-parser' 'lxml' 'markdown' 'mechanize' 'msgpack'
          'netifaces' 'unrardll' 'pillow' 'psutil' 'pygments' 'pyqt5' 'pyqtwebengine' 'regex')
_py3_deps=("${_py_deps[@]}" 'zeroconf')
depends=('chmlib' 'hunspell' 'hyphen' 'icu' 'jxrlib' 'libmtp' 'libusbx'
         'libwmf' 'mathjax2' 'mtdev' 'optipng' 'podofo' 'qt5-svg' 'udisks2')
makedepends=('git' "${_py_deps[@]/#/python2-}" "${_py3_deps[@]/#/python-}" 'qt5-x11extras'
             'sip' 'xdg-utils' 'rapydscript-ng' 'python2-sphinx')
checkdepends=('xorg-server-xvfb')
source=("git+https://github.com/kovidgoyal/${pkgbase%-git}.git?signed"
        "git+https://github.com/kovidgoyal/${pkgbase%-git}-translations.git?signed"
        "dictionaries-${_dictionaries_commit}.tar.gz::https://github.com/LibreOffice/dictionaries/archive/${_dictionaries_commit}.tar.gz"
        "calibre-alternatives.sh"
        "user-agent-data.json")
sha256sums=('SKIP'
            'SKIP'
            'ccfdb3ba622d59c99b305abfdc824a8e2f96f1930fe6f4e7f183297bc80ad3e8'
            '20dc4ff196423a7c7c8f644cb83fcfe07b4b5a64ba4addeb0750f94cd7aa9e8e'
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
    LANG='en_US.UTF-8' python2 setup.py resources \
        --path-to-mathjax /usr/share/mathjax2 --system-mathjax \
        --path-to-hyphenation "${srcdir}"/dictionaries-${_dictionaries_commit}
    LANG='en_US.UTF-8' python2 setup.py man_pages

    LANG='en_US.UTF-8' CALIBRE_PY3_PORT=1 python3 setup.py build

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

package_calibre-common-git() {
    pkgdesc+=" (common files)"
    optdepends=('poppler: required for converting pdf to html')
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}" "calibre<${pkgver}")
    install=calibre-common-git.install
    cd "${srcdir}/${pkgbase%-git}"

    # If this directory don't exist, zsh completion won't install.
    install -d "${pkgdir}/usr/share/zsh/site-functions"

    LANG='en_US.UTF-8' python2 setup.py install --staging-root="${pkgdir}/usr" \
        --prefix=/usr

    for bin in "${pkgdir}"/usr/bin/*; do
        ln -sfT "/usr/lib/calibre/bin/${bin##*/}" "${bin}"
    done

    install -Dm755 "${srcdir}"/calibre-alternatives.sh "${pkgdir}"/usr/bin/calibre-alternatives

    cp -a man-pages/ "${pkgdir}/usr/share/man"

    # not needed at runtime
    rm -r "${pkgdir}"/usr/share/calibre/rapydscript/

    #cleanup overlapping files
    rm -r "${pkgdir}"/usr/lib/python2.7
    rm -r "${pkgdir}"/usr/lib/calibre/calibre/plugins/
    find "${pkgdir}" -type f -name '*.py[co]' -delete
}

package_calibre-git() {
    pkgdesc+=" (python2 build)"
    depends=('calibre-common-git' "${_py_deps[@]/#/python2-}")
    optdepends+=('ipython2: to use calibre-debug')
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    install=calibre-git.install

    cd "${srcdir}/${pkgbase%-git}"

    LANG='en_US.UTF-8' python2 setup.py install \
        --staging-root="${pkgdir}/usr" \
        --prefix=/usr \
        --no-postinstall \
        --bindir=/usr/lib/calibre/bin-py2 \
        --staging-bindir="${pkgdir}/usr/lib/calibre/bin-py2" \
        --staging-sharedir="${srcdir}"/temp

    # Compiling bytecode FS#33392
    # This is kind of ugly but removes traces of the build root.
    while read -rd '' _file; do
        _destdir="$(dirname "${_file#${pkgdir}}")"
        python2 -m compileall -d "${_destdir}" "${_file}"
        python2 -O -m compileall -d "${_destdir}" "${_file}"
    done < <(find "${pkgdir}"/usr/lib/ -name '*.py' -print0)

    find "${pkgdir}"/usr/lib/calibre -name '*.py' -delete
    rm -r "${pkgdir}"/usr/lib/calibre/calibre/plugins/3/
}

package_calibre-python3-git() {
    pkgdesc+=" (experimental python3 port)"
    depends=('calibre-common-git' "${_py3_deps[@]/#/python-}")
    optdepends+=('ipython: to use calibre-debug')
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    install=calibre-git.install

    cd "${srcdir}/${pkgbase%-git}"

    LANG='en_US.UTF-8' CALIBRE_PY3_PORT=1 python3 setup.py install \
        --staging-root="${pkgdir}/usr" \
        --prefix=/usr \
        --no-postinstall \
        --bindir=/usr/lib/calibre/bin-py3 \
        --staging-bindir="${pkgdir}/usr/lib/calibre/bin-py3" \
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
