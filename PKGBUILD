# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=autosuspend
pkgver=2.0.4
pkgrel=1
pkgdesc="A daemon to suspend and wake up a system based on configurable checks"
arch=(any)
url="https://github.com/languitar/autosuspend"
license=('GPL2')
depends=('python' 'python-psutil')
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
makedepends=('python-setuptools' 'python-pytest-runner' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-sphinx-issues')
source=("https://github.com/languitar/autosuspend/archive/v${pkgver}.tar.gz")
sha256sums=('b4793d4dcf90a3f0499fce62cace5192457b532a3a441ea20307ce8d7d7a9ab3')
backup=('etc/autosuspend.conf'
        'etc/autosuspend-logging.conf')

build() {
    cd "$pkgname-${pkgver}"
    python3 setup.py build_sphinx -a -b html
    python3 setup.py build_sphinx -a -b man
}

package() {
    cd "$pkgname-${pkgver}"
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
