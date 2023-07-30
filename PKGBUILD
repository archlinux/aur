# Maintainer: Puqns67 <me@puqns67.icu>

pkgbase='juicity'
pkgname=(${pkgbase}-{client,server})
pkgver=0.1.0
pkgrel=1
pkgdesc='A quic based proxy protocol, inspired by tuic.'
url='https://github.com/juicity/juicity'
license=('AGPL3')
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'riscv64')
depends=('glibc')
makedepends=('go')

_config_example_hash='b0d68f1bd2ed22b103a77c7b73790adbc2941b97'

source=("${pkgbase}-${pkgver}-full-src.zip"::"${url}/releases/download/v${pkgver}/${pkgbase}-full-src.zip"
        "config_example-client.json"::"${url}/raw/${_config_example_hash}/install/example-client.json"
        "config_example-server.json"::"${url}/raw/${_config_example_hash}/install/example-server.json")

sha512sums=('28e58a8e83181985455ce3446a5399811025c8c309e49533ea91c31ca4e34a4d6b28e26c7195e4c2c244dbcdeb2785739f661af683f49e83be1cf6eebf3fd906'
            'db3a96735256713fbf439f5f6f2d4fa8fe250c49ebff4321a21c1e7d8ecc3ff4a49d4ef152ddca0cea81839ef79f27dc36e6cf0321a803c4af47bc1e4a5ceafc'
            'e66c4b218f148fb660da0db3c3a51a826b1437a3791589a523398a4380312b06109f5e248b36714d5c32934bd8ede489fbc57794f327c7c7f30c856824315110')

build() {
  GOFLAGS='-trimpath -modcacherw' GOMODCACHE="${srcdir}/go-mod" VERSION="${pkgver}" make -C "${srcdir}"
}

_package() {
  pkgdesc+=" (${pkgname//${pkgbase}-/})"
  provides=("${pkgname}")
  conflicts=("${pkgname}")
  backup=("etc/${pkgbase}/${pkgname//${pkgbase}-/}.json")

  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/install/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/config_example-${pkgname//${pkgbase}-/}.json" "${pkgdir}/etc/${pkgbase}/${pkgname//${pkgbase}-/}.json"
}

for _pkgname in "${pkgname[@]}"; do
  eval "package_${_pkgname}() {
    $(declare -f "_package")
    _package
  }"
done
