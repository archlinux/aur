# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgbase='concrnt'
pkgdesc='Concrnt is a next-gen decentralized social network platform designed to make your world richer.'
pkgname=('concrnt-gateway' 'concrnt-api')
pkgver=1.7.4
_pkgver=v${pkgver}
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/concrnt/concrnt"
license=('MIT')
depends=('glibc')
makedepends=('go')

source=("${pkgbase}-${pkgver}::https://github.com/concrnt/concrnt/archive/refs/tags/${_pkgver}.tar.gz"
        "concrnt-api.hook"
        "concrnt-api.service"
        "concrnt-gateway.hook"
        "concrnt-gateway.service"
        "concrnt-gateway.tmpfiles"
        "concrnt.install")

sha512sums=('95f619409288f50bb52896018c31e68db61524bda704cbcd7a614f8b9907a6ec9744566c8346b8bc280a7ecd2e88b5d9a520e3a1514af05d7a7f0f68117b7ddc'
            '4ba819a0b00e481353e0e38a1bd9fe4d01a4de63fa724407040b8ab79a2cf69ee335b4cd871e28cd48f4be82838c6ec45d615e2c4e3119d27f5aa75bb70d58f5'
            '919f85b34faef68dff1ee1b43fa5351b2a8bcfbb166b20d6f75336e2eaba39b03bfe85ba3a8e13051e47f9b08763937b24ee2fb5818fcd4de47b19b77095f25f'
            '052b85d29ab0cb9713ecac06935344af25376f99e69765cd8992bbb5c73e84c8b2d40890b859f5a81a83bb66693f3d6aa1a93ab29f5aa177b294583fde8f95e6'
            '5a53b1a0f3ba05305da0ad5fe0a69d5b55197fba88078b9dd41f15aadf2698fa77df85edf05a1209c03e09bfa824836534ba5a274bd075610706a2a9d900b4e3'
            '1d24a8d23e057029d97e51296fcd91af870d8d30f77739d2a078aaaac4a2103a42b376e06b9302ddb360b6b68791221e48349341f78b845f74a9e031facb3c94'
            'e882308a22defa308a1dae9331b2a39e39e44496bba679350f968637409ab7889b5a3038fcd6dd9b8a248063da1e6e35fe019ef69007c7aadcc9ca3b251267b6')

build() {
  cd "${srcdir}/concrnt-${pkgver}"

  go mod download

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export CONCRNT_LDFLAGS="-s -w -linkmode external"
  CONCRNT_LDFLAGS+=" -X main.version=${_pkgver} -X \"main.buildMachine=$(uname -srmo)\" -X \"main.buildTime=$(date)\" -X \"main.goVersion=$(go version)\""
  CONCRNT_LDFLAGS+=" -extldflags \"${LDFLAGS}\""

  go build -ldflags="${CONCRNT_LDFLAGS}" -o ccapi ./cmd/api
  go build -ldflags="${CONCRNT_LDFLAGS}" -o ccgateway ./cmd/gateway
}

package_concrnt-gateway() {
  depends+=('concrnt-shared-config') # runtime dependencies
  optdepends=('redis: Local cache server support'
              'memcached: Local cache server support'
              'postgresql: Local database server support'
              'concrnt-api: Provides API service'
              'concrnt-webui: Provides registration page and admin panel'
              'concrnt-hyperproxy: URL Summary and image proxy'
              'concrnt-activitypub: ActivityPub integration')
  backup=('etc/concrnt/config/gateway.yaml')

  install="concrnt.install"

  install -Dm755 "${srcdir}/concrnt-${pkgver}/ccgateway" "${pkgdir}/usr/bin/ccgateway"
  install -Dm644 "${srcdir}/concrnt-gateway.service" "${pkgdir}/usr/lib/systemd/system/concrnt-gateway.service"
  install -Dm644 "${srcdir}/concrnt-gateway.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/concrnt-gateway.conf"
  install -Dm644 "${srcdir}/concrnt-gateway.hook" "${pkgdir}/usr/share/libalpm/hooks/concrnt-gateway.hook"
  install -Dm644 "${srcdir}/concrnt-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

package_concrnt-api() {
  depends+=('concrnt-shared-config') # runtime dependencies
  optdepends=('concrnt-gateway: Concrnt Gateway server'
              'redis: Local cache support'
              'memcached: Local cache support'
              'postgresql: Local database support')

  install -Dm755 "${srcdir}/concrnt-${pkgver}/ccapi" "${pkgdir}/usr/bin/ccapi"
  install -Dm644 "${srcdir}/concrnt-api.service" "${pkgdir}/usr/lib/systemd/system/concrnt-api.service"
  install -Dm644 "${srcdir}/concrnt-api.hook" "${pkgdir}/usr/share/libalpm/hooks/concrnt-api.hook"

  install -Dm644 "${srcdir}/concrnt-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
