# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=autosuspend
pkgver=9.0.0
pkgrel=2
pkgdesc="A daemon to suspend and wake up a system based on configurable checks"
arch=(any)
url="https://github.com/languitar/autosuspend"
license=('GPL-2.0-only')
depends=('python' 'python-psutil' 'python-portalocker')
optdepends=('python-dbus: logind session discovery and system timer checks'
  'python-mpd2: MPD playing status check'
  'python-requests: network-based checks'
  'python-lxml: XPath check'
  'python-dbus: logind-based checks'
  'python-icalendar: iCalendar checks'
  'python-dateutil: iCalendar checks'
  'python-tzlocal: iCalendar checks'
  'python-tzdata: iCalendar checks'
  'python-requests-file: file:// URL support'
  'python-jsonpath-ng: JSONPath checks'
  'iputils: ping check'
  'xprintidle: X server idle time check')
makedepends=('python-setuptools'
  'python-build'
  'python-installer'
  'python-recommonmark'
  'python-sphinx'
  'python-sphinx-furo'
  'python-sphinx-issues'
  'python-sphinxcontrib-plantuml'
  'python-sphinx-autodoc-typehints')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/languitar/autosuspend/archive/v${pkgver}.tar.gz")
sha256sums=('79162c1b7957811df698886fde3ad8c76342d3ef77c8bc790a97fc440c8c9f9e')
backup=('etc/autosuspend.conf'
  'etc/autosuspend-logging.conf')

build() {
  cd "$pkgname-${pkgver}"
  python -m build --wheel --no-isolation
  export PYTHONPATH=$(pwd)/src
  sphinx-build -a -b html doc/source/ doc/build/html
  sphinx-build -a -b man doc/source/ doc/build/man
  rm -rf doc/build/html/.doctrees
}

package() {
  cd "$pkgname-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # setuptools install_data is a nightmare, and cannot be made to respect the
  # filesystem hierarchy. Do things manually instead.
  mv "$pkgdir/usr/etc" "$pkgdir"

  # # man pages
  mkdir -p "${pkgdir}/usr/share/man/man1"
  cp doc/build/man/autosuspend.1 "${pkgdir}/usr/share/man/man1"
  mkdir -p "${pkgdir}/usr/share/man/man5"
  cp doc/build/man/autosuspend.conf.5 "${pkgdir}/usr/share/man/man5"

  # # HTML help
  mkdir -p "${pkgdir}/usr/share/doc"
  cp -R doc/build/html "${pkgdir}/usr/share/doc/${pkgname}"
}
