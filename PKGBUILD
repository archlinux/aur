# Maintainer: Tristan Hill

pkgname=changedetection.io
pkgver=0.39.17.2
pkgrel=1
pkgdesc='change monitoring of web pages'
arch=('any')
url='https://github.com/dgtlmoon/changedetection.io'
license=('Apache 2.0')
makedepends=('python-setuptools' 'python-pip')
depends=(# see https://github.com/dgtlmoon/changedetection.io/blob/master/requirements.txt
         'python-flask'
         'python-flask-wtf'
         'python-flask-restful'
         'python-eventlet'
         'python-validators'
         'python-timeago'
         # inscriptis
         'python-feedgen'
         'python-flask-login'
         'python-pytz'
         'python-requests'
         'python-urllib3'
         'python-chardet'
         'python-wtforms'
         'python-jsonpath-ng'
         'python-apprise'
         'python-cryptography'
         'python-beautifulsoup4'
         'python-selenium')
source=("https://github.com/dgtlmoon/changedetection.io/archive/refs/tags/$pkgver.tar.gz"
        'sysusers'
        'tmpfiles'
        'service')
sha512sums=('5247f275692834307cd37f68d0ce01bcc989dc3e6dff4624a7c3815308024735d2cfd3d123002e0bee10094694b477812fa4b262c1da6a3034afcea6201656cf'
            '5ef8b215bddc02b04d55d3699f27ad043461d8771591be2ebf0ed6390c58ab881426214173c8e1cc8bb36ecd7acebc5d69d760fc65b8a3b191b2116150748f53'
            '62a684e35c3b479b8ab139b2d79f83f408bede0d4e0f1e500ee75f13126456fa5b574d8cb826c8c56ff0da488dec4ed3562854d0f05d44814beaa3b726bcd318'
            '5dba78fafd77fe41b69d73849529ed4f086879cd3a6e4ada126a320d249bb730bcf6a0b49e5b987699a2420e7083c7c6d1a0b921c49c932ec33f30bda083b506')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  # command per https://wiki.archlinux.org/title/Python_package_guidelines (now removed from page?)
  PIP_CONFIG_FILE=/dev/null pip install --isolated --target="$pkgdir/usr/lib/changedetection.io" --ignore-installed --no-deps inscriptis
  python -O -m compileall -s ${pkgdir} "${pkgdir}/usr/lib/changedetection.io"
  install -Dm644 "${srcdir}/sysusers" "${pkgdir}/usr/lib/sysusers.d/changedetection.io.conf"
  install -Dm644 "${srcdir}/tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/changedetection.io.conf"
  install -Dm644 "${srcdir}/service" "${pkgdir}/usr/lib/systemd/system/changedetection.io.service"
}
