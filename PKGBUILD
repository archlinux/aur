# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgname='concrnt-shared-config'
pkgdesc='Concrnt shared config file'
pkgver=1.6.6
_pkgver=v${pkgver}
pkgrel=1
arch=('any')
url="https://github.com/totegamma/concurrent"
license=('MIT')

source=("config.yaml-${_pkgver}::https://github.com/totegamma/concurrent/raw/refs/tags/${_pkgver}/_docs/etc/config/config.yaml"
        "code-of-conduct.txt-${_pkgver}::https://github.com/totegamma/concurrent/raw/refs/tags/${_pkgver}/_docs/etc/static/code-of-conduct.txt"
        "register-template.json-${_pkgver}::https://github.com/totegamma/concurrent/raw/refs/tags/${_pkgver}/_docs/etc/static/register-template.json"
        "tos.txt-${_pkgver}::https://github.com/totegamma/concurrent/raw/refs/tags/${_pkgver}/_docs/etc/static/tos.txt"
        "LICENSE-${_pkgver}::https://github.com/totegamma/concurrent/raw/refs/tags/${_pkgver}/LICENSE"
        "concrnt.sysusers"
        "concrnt-shared-config.tmpfiles")

sha512sums=('00e1baba1e610e71efe53357c8b020bea8f980d8e61a944f29b915fd0dd5217dddfe380a62b67ea95ea206c63c9d1bf871f1f79735afcb0332a14d9d86e7e723'
            '102ccbe40abcc3bcfec402433382b8e1700a8ba678a0f64610266a7f00f13ac0d9dc592651274dbbd1d2ad8775f5791caffda40e4feb668a8514ddae13eea738'
            '0a22a228785598f256b23bc9745f41ddf6851611d6898013884c7a1c1e27232920517fa738a5cb55e5b801c0cff599116958102724e0b513355469b81eea11db'
            'd5a9a9cad74bf6a5cf67af6bdd9db56f6344353560718f66042b4a29bc21ce43b7515c3bdd2669e60f22659cc4445439b980b89ab91e4bc6a187ac209e935d20'
            '6991f0cdffef328c29368d987a46e2d12d765b743cad04ae4c89469e1644f11f079fb495e5297b79d521f88b40d6fb3c5b972279c95f394bdb07cf4a2037f412'
            '20f767da477adcebbf3d09af431c5c1d8bbfe0395e8c5c921f1fe2fa012a314f3a0033af0251371e2831b59bb774cfcfe31834d365d4a202019068b377580c5d'
            '1a45f0d730d7f17c1d0bf254a7f59df1648cc69c7f3ab80b5fc74d255f45cdf946677aea0ca61394a0b086e416ee31b5509dc2e156e333c685c284ffc9ea985a')

backup=('etc/concrnt/config/config.yaml'
        'etc/concrnt/static/code-of-conduct.txt'
        'etc/concrnt/static/register-template.json'
        'etc/concrnt/static/tos.txt')

package() {
  install -Dm644 "${srcdir}/concrnt.sysusers" "${pkgdir}/usr/lib/sysusers.d/concrnt.conf"
  install -Dm644 "${srcdir}/concrnt-shared-config.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/concrnt-shared-config.conf"
  install -Dm644 "${srcdir}/config.yaml-${_pkgver}" "${pkgdir}/etc/concrnt/config/config.yaml"
  install -Dm644 "${srcdir}/code-of-conduct.txt-${_pkgver}" "${pkgdir}/etc/concrnt/static/code-of-conduct.txt"
  install -Dm644 "${srcdir}/register-template.json-${_pkgver}" "${pkgdir}/etc/concrnt/static/register-template.json"
  install -Dm644 "${srcdir}/tos.txt-${_pkgver}" "${pkgdir}/etc/concrnt/static/tos.txt"

  sed -i -E \
    -e "s/(memcached|redis):([0-9]+)/localhost:\2/g" \
    -e "s/([a-z]+):([0-9]+)/localhost:\2/g" \
    -e "s/host=db/host=localhost/" \
    -e "s/user=postgres/user=concrnt/" \
    -e "s/password=postgres/password=concrnt/" \
    -e "s/dbname=concurrent/dbname=concrnt/" \
    "${pkgdir}/etc/concrnt/config/config.yaml"

  install -Dm644 "${srcdir}/LICENSE-${_pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
