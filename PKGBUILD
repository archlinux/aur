# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: bsdice
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>
# Contributor: Ingo Gottwald <in dot gottwald at gmail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Shawn Nock <nock@nocko.se>

_pkgname=python-sipsimple
pkgname=python2-sipsimple
pkgver=3.5.0
pkgrel=1
pkgdesc="Python SDK for development of SIP end-points"
license=('custom:MIT' 'LGPL')
arch=('x86_64')
url="http://download.ag-projects.com/SipClient"
depends=('alsa-lib' 'util-linux' 'python2-dateutil' 'cython2' 'python2-cjson' 'openssl'
         'python2-dnspython' 'python2-eventlib' 'python2-msrplib' 'python2-xcaplib' 'python2-otr' 'ffmpeg')
options=('!makeflags')
source=("https://github.com/AGProjects/${_pkgname}/archive/release-${pkgver}.tar.gz"
        "pj_attr_gcc10.patch")
sha512sums=('80ccededddb9a7eae229cb032bfd4e6a37ecf402a1ceded9fa592695f92fa458d2635a4484f2ef350e76fcb37736f0660535286b3f9535681e73c8791e3745cb'
            '60703259bb829f7b13cb3645f4cbaf6dd5662cada2c0f2f3765cfc74456f8e60c5001793aed59d71fd12c3d2abcbf12be3b4260e5ad6c061abdf3df8c9de0740')

prepare() {
  cd  "${srcdir}"
  patch -p1 -i "${srcdir}"/pj_attr_gcc10.patch
}

build() {
  cd "${srcdir}/${_pkgname}-release-${pkgver}"
  # fix permissions
  chmod 755 "${srcdir}/${_pkgname}-release-${pkgver}/deps/pjsip/configure"
  chmod 755 "${srcdir}/${_pkgname}-release-${pkgver}/deps/pjsip/aconfigure"
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
