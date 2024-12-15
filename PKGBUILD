# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgbase='concrnt'
pkgdesc='Concrnt is a next-gen decentralized social network platform designed to make your world richer.'
pkgname=('concrnt-gateway' 'concrnt-api')
pkgver=1.6.0
_pkgver=v${pkgver}
pkgrel=4
arch=('x86_64' 'aarch64')
url="https://github.com/totegamma/concurrent"
license=('MIT')
makedepends=('go')

source=("${pkgbase}-${pkgver}::https://github.com/totegamma/concurrent/archive/refs/tags/${_pkgver}.tar.gz"
        "concrnt-api.hook"
        "concrnt-api.service"
        "concrnt-gateway.hook"
        "concrnt-gateway.service"
        "concrnt-gateway.tmpfiles"
        "concrnt.install"
        # v1.6.0 release tarball does not yet contain LICENSE file
        "https://raw.githubusercontent.com/totegamma/concurrent/refs/heads/develop/LICENSE")

sha512sums=('742982dc1344449bdaf560cf6f6ea724b3d2d52dbd5031876398961f79e02718c9d4b875557f204349e39b7dca83a8716a32415b812eb68dabef70926e743d95'
            '4ba819a0b00e481353e0e38a1bd9fe4d01a4de63fa724407040b8ab79a2cf69ee335b4cd871e28cd48f4be82838c6ec45d615e2c4e3119d27f5aa75bb70d58f5'
            '919f85b34faef68dff1ee1b43fa5351b2a8bcfbb166b20d6f75336e2eaba39b03bfe85ba3a8e13051e47f9b08763937b24ee2fb5818fcd4de47b19b77095f25f'
            '052b85d29ab0cb9713ecac06935344af25376f99e69765cd8992bbb5c73e84c8b2d40890b859f5a81a83bb66693f3d6aa1a93ab29f5aa177b294583fde8f95e6'
            '5a53b1a0f3ba05305da0ad5fe0a69d5b55197fba88078b9dd41f15aadf2698fa77df85edf05a1209c03e09bfa824836534ba5a274bd075610706a2a9d900b4e3'
            '1d24a8d23e057029d97e51296fcd91af870d8d30f77739d2a078aaaac4a2103a42b376e06b9302ddb360b6b68791221e48349341f78b845f74a9e031facb3c94'
            'e882308a22defa308a1dae9331b2a39e39e44496bba679350f968637409ab7889b5a3038fcd6dd9b8a248063da1e6e35fe019ef69007c7aadcc9ca3b251267b6'
            '6991f0cdffef328c29368d987a46e2d12d765b743cad04ae4c89469e1644f11f079fb495e5297b79d521f88b40d6fb3c5b972279c95f394bdb07cf4a2037f412')

build() {
  cd "${srcdir}/concurrent-${pkgver}"

  go mod download

  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export CONCRNT_LDFLAGS="-s -w -X main.version=${_pkgver} -X \"main.buildMachine=$(uname -srmo)\" -X \"main.buildTime=$(date)\" -X \"main.goVersion=$(go version)\""

  go build -ldflags="${CONCRNT_LDFLAGS}" -o ccapi ./cmd/api
  go build -ldflags="${CONCRNT_LDFLAGS}" -o ccgateway ./cmd/gateway
}

package_concrnt-gateway() {
  depends=('concrnt-shared-config'
           'redis'
           'memcached'
           'postgresql'
           'concrnt-api')
  optdepends=('concrnt-conctl: Command-line tool for managing Concrnt services'
              'concrnt-webui: Provides registration page and admin panel'
              'concrnt-hyperproxy: URL Summary and image proxy'
              'concrnt-activitypub: ActivityPub integration')
  backup=('etc/concrnt/config/gateway.yaml')

  install="concrnt.install"

  install -Dm755 "${srcdir}/concurrent-${pkgver}/ccgateway" "${pkgdir}/usr/bin/ccgateway"
  install -Dm644 "${srcdir}/concrnt-gateway.service" "${pkgdir}/usr/lib/systemd/system/concrnt-gateway.service"
  install -Dm644 "${srcdir}/concrnt-gateway.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/concrnt-gateway.conf"
  install -Dm644 "${srcdir}/concrnt-gateway.hook" "${pkgdir}/usr/share/libalpm/hooks/concrnt-gateway.hook"
  install -Dm640 "${srcdir}/concurrent-${pkgver}/_docs/etc/config/gateway.yaml" "${pkgdir}/etc/concrnt/config/gateway.yaml"

  sed -i -E 's/host: .*/host: localhost/g' "${pkgdir}/etc/concrnt/config/gateway.yaml"

  # replace port
  sed -i -E \
    -e '/name: net\.concrnt\.api/{N;N;s/port: [0-9]+/port: 28281/}' \
    -e '/name: net\.concrnt\.webui/{N;N;s/port: [0-9]+/port: 28282/}' \
    -e '/name: world\.concrnt\.hyperproxy\.summary/{N;N;s/port: [0-9]+/port: 28283/}' \
    -e '/name: world\.concrnt\.hyperproxy\.image/{N;N;s/port: [0-9]+/port: 28283/}' \
    -e '/name: world\.concrnt\.ap-bridge/{N;N;s/port: [0-9]+/port: 28284/}' \
    -e '/name: world\.concrnt\.webfinger/{N;N;s/port: [0-9]+/port: 28284/}' \
    -e '/name: world\.concrnt\.mediaserver/{N;N;s/port: [0-9]+/port: 28285/}' \
    "${pkgdir}/etc/concrnt/config/gateway.yaml"


  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

package_concrnt-api() {
  depends=('concrnt-shared-config'
           'concrnt-gateway'
           'redis'
           'memcached'
           'postgresql')

  install -Dm755 "${srcdir}/concurrent-${pkgver}/ccapi" "${pkgdir}/usr/bin/ccapi"
  install -Dm644 "${srcdir}/concrnt-api.service" "${pkgdir}/usr/lib/systemd/system/concrnt-api.service"
  install -Dm644 "${srcdir}/concrnt-api.hook" "${pkgdir}/usr/share/libalpm/hooks/concrnt-api.hook"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
