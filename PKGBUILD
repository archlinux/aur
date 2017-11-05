# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>
# Contributor: Ingo Gottwald <in dot gottwald at gmail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=python-sipsimple
pkgname=python2-sipsimple
pkgver=3.1.1
pkgrel=2
pkgdesc="Python SDK for development of SIP end-points"
license=('custom:MIT' 'LGPL')
arch=('i686' 'x86_64')
url="http://download.ag-projects.com/SipClient"
depends=('alsa-lib' 'util-linux' 'python2-dateutil' 'cython2' 'python2-cjson' 'openssl-1.0'
         'python2-dnspython' 'python2-eventlib' 'python2-msrplib' 'python2-xcaplib' 'python2-otr-git' 'ffmpeg')
makedepends=('ffmpeg2.8')
options=('!makeflags')
source=("https://github.com/AGProjects/${_pkgname}/archive/release-${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b58936acc596761020d41a8b3e617a9240e74607d8f1d07d0e87cb28eebf206a')

build() {
  cd "${srcdir}/${_pkgname}-release-${pkgver}"
  # fix permissions
  chmod 755 "${srcdir}/${_pkgname}-release-${pkgver}/deps/pjsip/configure"
  chmod 755 "${srcdir}/${_pkgname}-release-${pkgver}/deps/pjsip/aconfigure"

  # use openssl 1.0
  export CFLAGS="-I/usr/include/openssl-1.0"
  export LDFLAGS="-L/usr/lib/openssl-1.0"

  # build
  python2 setup.py build_ext --pjsip-clean-compile
}

package() {
  cd "${srcdir}/${_pkgname}-release-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1

  # license
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
