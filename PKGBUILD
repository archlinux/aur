# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgname='concrnt-shared-config'
pkgdesc='Concrnt shared config file'
pkgver=1.6.0
_pkgver=v${pkgver}
pkgrel=2
arch=('any')
url="https://github.com/totegamma/concurrent"
license=('MIT')

source=("concrnt-${_pkgver}::https://github.com/totegamma/concurrent/archive/refs/tags/${_pkgver}.tar.gz"
        "concrnt.sysusers"
	    "concrnt-shared-config.tmpfiles"
	    # v1.6.0 release tarball does not yet contain LICENSE file
	    "https://raw.githubusercontent.com/totegamma/concurrent/refs/heads/develop/LICENSE")

sha512sums=('742982dc1344449bdaf560cf6f6ea724b3d2d52dbd5031876398961f79e02718c9d4b875557f204349e39b7dca83a8716a32415b812eb68dabef70926e743d95'
            '20f767da477adcebbf3d09af431c5c1d8bbfe0395e8c5c921f1fe2fa012a314f3a0033af0251371e2831b59bb774cfcfe31834d365d4a202019068b377580c5d'
            '0b487a501747f94b3cc3bb8abba4dcd2e4c702a6d0cd5250249077855af05a52456fcdab57d1e973540dde7f330d0436475171b7d33f77b7e4e2981762707976'
            '6991f0cdffef328c29368d987a46e2d12d765b743cad04ae4c89469e1644f11f079fb495e5297b79d521f88b40d6fb3c5b972279c95f394bdb07cf4a2037f412')

backup=('etc/concrnt/config/config.yaml'
        'etc/concrnt/static/code-of-conduct.txt'
        'etc/concrnt/static/register-template.json'
        'etc/concrnt/static/tos.txt')

package() {
  install -Dm644 "${srcdir}/concrnt.sysusers" "${pkgdir}/usr/lib/sysusers.d/concrnt.conf"
  install -Dm644 "${srcdir}/concrnt-shared-config.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/concrnt-shared-config.conf"
  install -Dm644 "${srcdir}/concurrent-${pkgver}/_docs/etc/config/config.yaml" "${pkgdir}/etc/concrnt/config/config.yaml"
  install -Dm644 "${srcdir}/concurrent-${pkgver}/_docs/etc/static/code-of-conduct.txt" "${pkgdir}/etc/concrnt/static/code-of-conduct.txt"
  install -Dm644 "${srcdir}/concurrent-${pkgver}/_docs/etc/static/register-template.json" "${pkgdir}/etc/concrnt/static/register-template.json"
  install -Dm644 "${srcdir}/concurrent-${pkgver}/_docs/etc/static/tos.txt" "${pkgdir}/etc/concrnt/static/tos.txt"

  sed -i -E \
    -e "s/(memcached|redis):([0-9]+)/localhost:\2/g" \
    -e "s/([a-z]+):([0-9]+)/localhost:\2/g" \
    -e "s/host=db/host=localhost/" \
    -e "s/user=postgres/user=concrnt/" \
    -e "s/password=postgres/password=concrnt/" \
    -e "s/dbname=concurrent/dbname=concrnt/" \
    "${pkgdir}/etc/concrnt/config/config.yaml"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
