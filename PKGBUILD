# Maintainer: Tristan Hill

pkgname=changedetection.io
pkgver=0.47.05
pkgrel=1
pkgdesc='change monitoring of web pages'
arch=(any)
url='https://github.com/dgtlmoon/changedetection.io'
license=('Apache 2.0')
makedepends=(python-setuptools)
depends=(# ordered per https://github.com/dgtlmoon/changedetection.io/blob/master/requirements.txt
         python-pyee
         python-flask-compress
         python-eventlet
         # python-validators # waiting for package update - needs at least 0.21
         python-timeago
         python-inscriptis
         python-feedgen
         python-flask-compress
         python-flask-login
         python-flask-paginate
         python-flask-expects-json
         python-flask-restful
         python-flask-cors
         python-flask-wtf
         python-flask
         python-pytz
         python-requests
         python-urllib3
         python-chardet
         python-wtforms
         python-jsonpath-ng
         python-jq
         apprise
         python-paho-mqtt
         python-cryptography
         python-bs4
         python-lxml
         python-elementpath
         python-selenium
         python-werkzeug
         python-jinja-time
         python-types-python-dateutil # required by jinja-time
         python-openpyxl
         python-pillow
         python-pytest-flask
         python-loguru
         python-pysocks)
optdepends=('python-playwright: for fetching pages with javascript')
source=(https://github.com/dgtlmoon/changedetection.io/archive/refs/tags/$pkgver.tar.gz
        sysusers
        tmpfiles
        service
        chromium.service)
sha512sums=('5b80df57832112a64f8d01c58203a3e859afe15bae32cdad0e06a14acc8567e5e4e85175beceb211b48ce5ce4dfd9a050785a99414524eed8a82dcfa76d5038c'
            '5ef8b215bddc02b04d55d3699f27ad043461d8771591be2ebf0ed6390c58ab881426214173c8e1cc8bb36ecd7acebc5d69d760fc65b8a3b191b2116150748f53'
            '62a684e35c3b479b8ab139b2d79f83f408bede0d4e0f1e500ee75f13126456fa5b574d8cb826c8c56ff0da488dec4ed3562854d0f05d44814beaa3b726bcd318'
            'eecd4b25411f6f47b81dd6849aae233b0928e19342818b9c7857bf291850b2cefb33cd35aa5877be1675c9642a8feee53b35d2e318a255547ef4ce07a30c9e1b'
            '3eb76f394f629e3c7dd49001654075be4cdcb3fb1d5014ff3f9e0174a8e013fb6e79f9538eeed6bf2169bd03827c5573dee4abe3fd551cf1477fcefe234f40c0')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/[>~=]=.*//; /pyppeteer/d' requirements.txt
  python setup.py install --root="$pkgdir" --optimize=1
  # command per https://wiki.archlinux.org/title/Python_package_guidelines (now removed from page?)
  PIP_CONFIG_FILE=/dev/null pip install --isolated --target="$pkgdir/usr/lib/changedetection.io" --ignore-installed --no-deps validators
  python -O -m compileall -s ${pkgdir} "${pkgdir}/usr/lib/changedetection.io"
  install -Dm644 "${srcdir}/sysusers" "${pkgdir}/usr/lib/sysusers.d/changedetection.io.conf"
  install -Dm644 "${srcdir}/tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/changedetection.io.conf"
  install -Dm644 "${srcdir}/service" "${pkgdir}/usr/lib/systemd/system/changedetection.io.service"
  install -Dm644 "${srcdir}/chromium.service" "${pkgdir}/usr/lib/systemd/system/changedetection.io-chromium.service"
}
