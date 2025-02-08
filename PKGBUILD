# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgdesc='Concrnt is a next-gen decentralized social network platform designed to make your world richer.'
pkgname=('concrnt-gateway-bin')
pkgver=1.6.6
_pkgver=v${pkgver}
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/totegamma/concurrent"
license=('MIT')
optdepends=('concrnt-conctl: Command-line tool for managing Concrnt services'
            'concrnt-webui: Provides registration page and admin panel'
            'concrnt-hyperproxy: URL Summary and image preview'
            'concrnt-activitypub: ActivityPub integration')

provides=('concrnt-gateway')
conflicts=('concrnt-gateway')

options=('!debug')

backup=('etc/concrnt/config/gateway.yaml')

source=("concrnt-gateway.hook"
        "concrnt-gateway.service"
        "concrnt-gateway.tmpfiles"
        "concrnt.install"
        "gateway.yaml-${pkgver}::https://raw.githubusercontent.com/totegamma/concurrent/refs/tags/${_pkgver}/_docs/etc/config/gateway.yaml"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/totegamma/concurrent/refs/tags/${_pkgver}/LICENSE")

source_x86_64=("ccgateway-x86_64-${pkgver}::https://github.com/totegamma/concurrent/releases/download/${_pkgver}/gateway-linux-amd64")
source_aarch64=("ccgateway-aarch64-${pkgver}::https://github.com/totegamma/concurrent/releases/download/${_pkgver}/gateway-linux-arm64")

sha512sums=('c847d5d656639f001ba8320a7f667b68f147f69352efe12a289c4191fc4c2053d145e19d48b5f26f8d439d4c095fec3e5b53c0c984651021e287380662fbe9a0'
            '1261a2f847d67ea90a8325d19de43ec5600c44f8b5a9aceff6e90fc1f1920e6717bf67ff769b7c47032ed7a15b991d73666d9ab1b9d889a77c9eed9a91af00bb'
            '1d24a8d23e057029d97e51296fcd91af870d8d30f77739d2a078aaaac4a2103a42b376e06b9302ddb360b6b68791221e48349341f78b845f74a9e031facb3c94'
            'e882308a22defa308a1dae9331b2a39e39e44496bba679350f968637409ab7889b5a3038fcd6dd9b8a248063da1e6e35fe019ef69007c7aadcc9ca3b251267b6'
            '6b1858721887294442e22b3d94e58a6fdf018b6e22b994ad9740d91e1571b0f5f634895d16a7bdeb1f9f01a2608bcca94807c73684f34a0f63ff48d9475e4558'
            '6991f0cdffef328c29368d987a46e2d12d765b743cad04ae4c89469e1644f11f079fb495e5297b79d521f88b40d6fb3c5b972279c95f394bdb07cf4a2037f412')
sha512sums_x86_64=('b4e4c7c7a2c85f23a4a97deebddd51865d507a29a10b0a53fa8b3c364e28f34190a67de7d910a6fa1eb797f400c3c701c5c3d3ef658f7ca5d1a5f427124c742c')
sha512sums_aarch64=('3f1390630453de996e2f1f819a0b25726bd7f8b3f14bdd4f50fceb4d82ad3c5ed25b9c11a46eca27a1fb643742fe0279e0db2d44fba008ee99184f83a607a938')

install="concrnt.install"

package() {
  depends=('glibc'
           'concrnt-shared-config')
  optdepends=('redis: Local cache server support'
              'memcached: Local cache server support'
              'postgresql: Local database server support'
              'concrnt-api: Provides API service'
              'concrnt-webui: Provides registration page and admin panel'
              'concrnt-hyperproxy: URL Summary and image proxy'
              'concrnt-activitypub: ActivityPub integration')

  install -Dm755 "${srcdir}/ccgateway-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/ccgateway"
  install -Dm644 "${srcdir}/concrnt-gateway.service" "${pkgdir}/usr/lib/systemd/system/concrnt-gateway.service"
  install -Dm644 "${srcdir}/concrnt-gateway.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/concrnt-gateway.conf"
  install -Dm644 "${srcdir}/concrnt-gateway.hook" "${pkgdir}/usr/share/libalpm/hooks/concrnt-gateway.hook"
  install -Dm644 "${srcdir}/gateway.yaml-${pkgver}" "${pkgdir}/etc/concrnt/config/gateway.yaml"
  
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

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
