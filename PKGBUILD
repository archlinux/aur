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
pkgver=3.4.2
pkgrel=1
pkgdesc="Python SDK for development of SIP end-points"
license=('custom:MIT' 'LGPL')
arch=('x86_64')
url="http://download.ag-projects.com/SipClient"
depends=('alsa-lib' 'util-linux' 'python2-dateutil' 'cython2' 'python2-cjson' 'openssl'
         'python2-dnspython' 'python2-eventlib' 'python2-msrplib' 'python2-xcaplib' 'python2-otr' 'ffmpeg')
options=('!makeflags')
source=("https://github.com/AGProjects/${_pkgname}/archive/release-${pkgver}.tar.gz"
        "snd_pcm_drop.patch")
sha512sums=('007205bf5a88b2ebfa32541e3a3dc47effa1854648371d8fcc90b07a302fffe5bde4c2f8e2231fdf24df397bc237d7bd1e6414f17fc4d9b6486137bcb98fccc7'
            '887cb3cfee82280c07bf4ba1779aebc2fbc49e2afff87ed3cd1e58b5ac8973e6d7f93e86284511dfef154a1f991bc985b4c97fc3b7d327d6791b72a124526683')

prepare() {
  cd  "${srcdir}/${_pkgname}-release-${pkgver}"
  patch -p1 < "${srcdir}"/snd_pcm_drop.patch
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
