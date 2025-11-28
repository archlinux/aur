# Maintainer: Tristan Hill

pkgname=changedetection.io
pkgver=0.51.4
pkgrel=1
pkgdesc='change monitoring of web pages'
arch=(any)
url='https://github.com/dgtlmoon/changedetection.io'
license=('Apache 2.0')
makedepends=(python-setuptools python-pip)
depends=(# ordered per https://github.com/dgtlmoon/changedetection.io/blob/master/requirements.txt
         python-pyee
         python-flask-compress
         python-eventlet
         python-validators
         python-timeago
         python-inscriptis
         python-feedgen
         python-flask-compress
         python-flask-login
         python-flask-paginate
         python-flask-expects-json
         python-flask-restful
         python-flask-cors
         # python-janus # not working without janus 2
         python-flask-wtf
         python-flask
         python-flask-socketio
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
         python-beautifulsoup4 
         python-lxml
         python-elementpath
         python-werkzeug
         python-jinja-time
         python-types-python-dateutil # required by jinja-time
         python-openpyxl
         python-pillow
         python-openapi-core
         python-loguru
         python-extruct
         python-babel
         python-price-parser
         python-puremagic
         python-pluggy
         python-pysocks
         python-markupsafe)
optdepends=('python-playwright: for fetching pages with javascript')
source=(https://github.com/dgtlmoon/changedetection.io/archive/refs/tags/$pkgver.tar.gz
        sysusers
        tmpfiles
        service
        chromium.service)
sha512sums=('b8ab5328520f77ca0e5650bfedf5340af7e1bacf6fb626894e2643cc268ea3af519ec17e86aea38e19730dea781abeb3b5bc6ce1e75406d85e80bdc96c1504bd'
            '5ef8b215bddc02b04d55d3699f27ad043461d8771591be2ebf0ed6390c58ab881426214173c8e1cc8bb36ecd7acebc5d69d760fc65b8a3b191b2116150748f53'
            '92b0921bd7d2d297087238366ece919272c8cf1f6685631bbbb8a6ad3817f6c4d9fd95ed626991ac12284aff93c66c3f8c6e9b4b77e959c91c1646dca39b8212'
            'eecd4b25411f6f47b81dd6849aae233b0928e19342818b9c7857bf291850b2cefb33cd35aa5877be1675c9642a8feee53b35d2e318a255547ef4ce07a30c9e1b'
            '3eb76f394f629e3c7dd49001654075be4cdcb3fb1d5014ff3f9e0174a8e013fb6e79f9538eeed6bf2169bd03827c5573dee4abe3fd551cf1477fcefe234f40c0')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/[>~=]=.*//; /pyppeteer/d' requirements.txt
  python setup.py install --root="$pkgdir" --optimize=1
  # command per https://wiki.archlinux.org/title/Python_package_guidelines (now removed from page?)
  PIP_CONFIG_FILE=/dev/null pip install --isolated --target="$pkgdir/usr/lib/changedetection.io" --ignore-installed --no-deps panzi-json-logic janus
  python -O -m compileall -s ${pkgdir} "${pkgdir}/usr/lib/changedetection.io"
  install -Dm644 "${srcdir}/sysusers" "${pkgdir}/usr/lib/sysusers.d/changedetection.io.conf"
  install -Dm644 "${srcdir}/tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/changedetection.io.conf"
  install -Dm644 "${srcdir}/service" "${pkgdir}/usr/lib/systemd/system/changedetection.io.service"
  install -Dm644 "${srcdir}/chromium.service" "${pkgdir}/usr/lib/systemd/system/changedetection.io-chromium.service"
}
