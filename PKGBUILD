# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>
# Contributor: Ingo Gottwald <in dot gottwald at gmail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Shawn Nock <nock@nocko.se>

_pkgname=python-sipsimple
pkgname=python2-sipsimple
pkgver=3.1.1
pkgrel=5
pkgdesc="Python SDK for development of SIP end-points"
license=('custom:MIT' 'LGPL')
arch=('i686' 'x86_64')
url="http://download.ag-projects.com/SipClient"
depends=('alsa-lib' 'util-linux' 'python2-dateutil' 'cython2' 'python2-cjson' 'openssl-1.0'
         'python2-dnspython' 'python2-eventlib' 'python2-msrplib' 'python2-xcaplib' 'python2-otr' 'ffmpeg')
options=('!makeflags')
source=("https://github.com/AGProjects/${_pkgname}/archive/release-${pkgver}.tar.gz"
        "change_macro_name.patch")
sha512sums=('07505d969da916c61b8602e81c5e6583eb3863454915901a26f906eb755f13d9ab53999ebca2d14739342f328393659bc3d71ac5ce076b97c0f894184c59b9b1'
            '522c76434c09b856917a988b069f98f449e095e50191e6693f5b98c393c9f191b30de3137811b7b62f79291018b1aa3dd656674921693d95a2deefcacc913873')

prepare() {
  cd  "${srcdir}/${_pkgname}-release-${pkgver}"
  patch -p1 < "${srcdir}"/change_macro_name.patch
}

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
