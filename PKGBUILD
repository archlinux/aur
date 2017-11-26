# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=autosuspend
pkgver=1.0.0
pkgrel=1
pkgdesc="A daemon to suspend your server in case of inactivity"
arch=(any)
url="https://github.com/languitar/autosuspend"
license=('GPL2')
depends=('python' 'python-psutil')
optdepends=('python-mpd2: MPD playing status check'
            'python-requests: Kodi playing status and XPath check'
            'python-lxml: XPath check'
            'xprintidle: X server idle time check')
makedepends=('python-setuptools' 'python-pytest-runner' 'python-sphinx' 'python-sphinx_rtd_theme')
source=("https://github.com/languitar/autosuspend/archive/v${pkgver}.tar.gz")
sha256sums=('eaeffa164655e7246378bdc79fcaf8eaf481e71ec20ce29128a7d38804392a7e')
install="${pkgname}.install"
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
