# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Andrew Kelley <superjoe30@gmail.com>
# Contributor: superjoe <superjoe30@gmail.com>
#
# makepkg warns "Package contains reference to $pkgdir". This is OK. See:
# https://github.com/andrewrk/groovebasin/issues/214

pkgname=nodejs-groovebasin
_pkgname="${pkgname#nodejs-}"
pkgver=1.5.1
pkgrel=1
pkgdesc='Music player server with a web-based user interface inspired by Amarok 1.4'
arch=('i686' 'x86_64')
url='http://groovebasin.com/'
license=(MIT)
depends=(nodejs libgroove)
makedepends=(python2 npm)
backup='etc/groovebasin.json'
install=groovebasin.install
source=("https://github.com/andrewrk/groovebasin/archive/${pkgver}.tar.gz"
        groovebasin
        groovebasin.json
        groovebasin.service)
sha256sums=('6414302c6c6109ccec5626780c6187511325d85c5ccf95e93adc52fa72769905'
            '5169f64bbe305959d6c2c76f73b10c3a604586cb884c78e9b620e476f45132df'
            'd4e6f06b601b16304199f61bce662ccc8e34842ddb0f8f688eae6e0be150e8df'
            'fca2b5d94cef9e5b70936bdb47c4a69724050d657fe72f471f989dce933a1caa')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  npm \
    --python=python2 \
    run build
}

package() {
  npm \
    --python=python2 \
    install \
    --user root \
    --global \
    --prefix "${pkgdir}/usr" \
    "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/groovebasin" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d -g 49 -o 49 "${pkgdir}/var/lib/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.json" "${pkgdir}/etc/${_pkgname}.json"
  ln -sf "/etc/${_pkgname}.json" "${pkgdir}/var/lib/${_pkgname}/config.json"

  install -d -g 49 -o 49 "${pkgdir}"/var/lib/groovebasin/certs
  ln -sf /usr/lib/node_modules/groovebasin/certs/self-signed-key.pem \
    "${pkgdir}"/var/lib/groovebasin/certs
  ln -sf /usr/lib/node_modules/groovebasin/certs/self-signed-cert.pem \
    "${pkgdir}"/var/lib/groovebasin/certs

  install -Dm644 "${srcdir}"/groovebasin.service \
    "${pkgdir}"/usr/lib/systemd/system/groovebasin.service
}

# vim:set ts=2 sw=2 et:
