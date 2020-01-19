# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=autosuspend-git
pkgver=3.0.0.277
pkgrel=1
pkgdesc="A daemon to suspend your server in case of inactivity"
arch=(any)
url="https://github.com/languitar/autosuspend"
license=('GPL2')
depends=('python' 'python-psutil' 'python-portalocker')
optdepends=('python-dbus: logind session discovery'
            'python-mpd2: MPD playing status check'
            'python-requests: network-based checks'
            'python-lxml: XPath check'
            'python-dbus: logind-based checks'
            'python-icalendar: iCalendar checks'
            'python-dateutil: iCalendar checks'
            'python-tzlocal: iCalendar checks'
            'python-requests-file: file:// URL support'
            'iputils: ping check'
            'xprintidle: X server idle time check')
makedepends=('python-setuptools'
             'python-pytest-runner'
             'python-sphinx'
             'python-sphinx_rtd_theme'
             'python-sphinx-issues'
             'python-sphinxcontrib-plantuml'
             'python-sphinx-autodoc-typehints')
provides=('autosuspend')
conflicts=('autosuspend')
source=("git+https://github.com/languitar/autosuspend.git")
sha256sums=('SKIP')
install="${pkgname}.install"
backup=('etc/autosuspend.conf'
        'etc/autosuspend-logging.conf')

pkgver() {
    cd "autosuspend"
    rev="$(git rev-list --count HEAD)"
    base="$(cat VERSION | tail -n 1 | sed 's/\.dev.*//')"
    echo -n "${base}.${rev}"
}

build() {
    cd "autosuspend"
    export PYTHONPATH=$(pwd)/src
    python3 setup.py build_sphinx -a -b html
    python3 setup.py build_sphinx -a -b man
}

package() {
    cd "autosuspend"
    python3 setup.py install --root="$pkgdir/" --install-data=/usr
    # setuptools install_data is a nightmare, and cannot be made to respect the
    # filesystem hierarchy. Do things manually instead.
    mv "$pkgdir/usr/etc" "$pkgdir"

    # man pages
    mkdir -p "${pkgdir}/usr/share/man/man1"
    cp doc/build/man/autosuspend.1 "${pkgdir}/usr/share/man/man1"
    mkdir -p "${pkgdir}/usr/share/man/man5"
    cp doc/build/man/autosuspend.conf.5 "${pkgdir}/usr/share/man/man5"

    # HTML help
    mkdir -p "${pkgdir}/usr/share/doc"
    cp -R doc/build/html "${pkgdir}/usr/share/doc/${pkgname}"
}
