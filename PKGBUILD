# Maintainer: Tristan Hill

pkgname=changedetection.io
pkgver=0.45.23
pkgrel=2
pkgdesc='change monitoring of web pages'
arch=(any)
url='https://github.com/dgtlmoon/changedetection.io'
license=('Apache 2.0')
makedepends=(python-setuptools)
depends=(# ordered per https://github.com/dgtlmoon/changedetection.io/blob/master/requirements.txt
         python-pyee
         python-flask-compress
         python-eventlet
         # out of date - python-validators
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
         python-pysocks
         # below for pyppeteer-ng
         python-aenum
         python-appdirs
         python-typing_inspect
         python-tqdm
         python-websockets)
source=(https://github.com/dgtlmoon/changedetection.io/archive/refs/tags/$pkgver.tar.gz
        sysusers
        tmpfiles
        service)
sha512sums=('314aa91c559da3e59a270277d42d60d03e25411f7a7b642ce6dd31a0a6acba7671903742f5b9f79386478c66008c32399b959f00f5372d1b7fd2be15376ba5af'
            '5ef8b215bddc02b04d55d3699f27ad043461d8771591be2ebf0ed6390c58ab881426214173c8e1cc8bb36ecd7acebc5d69d760fc65b8a3b191b2116150748f53'
            '62a684e35c3b479b8ab139b2d79f83f408bede0d4e0f1e500ee75f13126456fa5b574d8cb826c8c56ff0da488dec4ed3562854d0f05d44814beaa3b726bcd318'
            'd640ada5e7a0a82d551221a51c307abd37104361efe0ae4b805c58bd9092b21d8eb55e87e55cff8fb13bbb397ad98231edf1f6db99cfdb318de5e82cb0ed77bc')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/[~=]=.*//' requirements.txt
  python setup.py install --root="$pkgdir" --optimize=1
  # command per https://wiki.archlinux.org/title/Python_package_guidelines (now removed from page?)
  PIP_CONFIG_FILE=/dev/null pip install --isolated --target="$pkgdir/usr/lib/changedetection.io" --ignore-installed --no-deps pyppeteer-ng==2.0.0rc5 validators pyppeteerstealth
  sed -Ei '/Requires-Dist: (aenum|typing_extensions|typing_inspect|websockets)/s/\(.*//' "$pkgdir"/usr/lib/changedetection.io/pyppeteer_ng-2.0.0rc5.dist-info/METADATA
  python -O -m compileall -s ${pkgdir} "${pkgdir}/usr/lib/changedetection.io"
  install -Dm644 "${srcdir}/sysusers" "${pkgdir}/usr/lib/sysusers.d/changedetection.io.conf"
  install -Dm644 "${srcdir}/tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/changedetection.io.conf"
  install -Dm644 "${srcdir}/service" "${pkgdir}/usr/lib/systemd/system/changedetection.io.service"
}
