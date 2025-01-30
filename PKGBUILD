# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgname='concrnt-activitypub-bin'
pkgdesc='Concrnt ActivityPub bridge module'
pkgver=0.4.1
_pkgver=v${pkgver}
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/totegamma/concurrent"
license=('MIT')

provides=('concrnt-activitypub')
conflicts=('concrnt-activitypub')

options=('strip' '!debug')

source=("concrnt-activitypub.hook"
        "concrnt-activitypub.install"
        "concrnt-activitypub.service"
        "concrnt-activitypub.tmpfiles"
        "https://github.com/concrnt/ccworld-ap-bridge/raw/7446247e77bc56a53b4c3d7fb3441f15fa14c219/LICENSE"
        "apconfig.yaml-${_pkgver}::https://raw.githubusercontent.com/totegamma/concurrent/c14d20383ec642ba19a2f063709149a563d8a096/_docs/etc/config/apconfig.yaml")
        
source_x86_64=("ccactivitypub-x86_64-${pkgver}::https://github.com/concrnt/ccworld-ap-bridge/releases/download/${_pkgver}/ccworld-ap-bridge-linux-amd64")
source_aarch64=("ccactivitypub-aarch64-${pkgver}::https://github.com/concrnt/ccworld-ap-bridge/releases/download/${_pkgver}/ccworld-ap-bridge-linux-arm64")

sha512sums=('4f1659dfee68c17326f979171fffb15dc8c03ae9b5c952d6c374d52d8b749bd138bae51dd8ed2238d06d30e4431ef5e376ca5115bbea73882c532257dcf4dbdf'
            'a30de37161dca32fb86dab319c39537f91a68d328ccfc765614bc742bc66ecc92e63f6bcd371af67f4e37a92b96c7f63d8e327c2be37be3c239f24955b2b25b8'
            '8b25307bc102e181bc04ad1c625385086506186203b39bb0c939e6bf9ccc9fb5397daaca8a740a1eff188cc582469bf54ff4548cb38ba8f76250ec35768c6c5c'
            '2ad3d6cbfc46e0c804ed7d8d93e4a9be3085c9a94c7cf4281ec571272e9f0e03f9e2b61a216dbf5af74252ec3f3e0eebeb7cb4705a87d4537987b28fbce15e22'
            '6991f0cdffef328c29368d987a46e2d12d765b743cad04ae4c89469e1644f11f079fb495e5297b79d521f88b40d6fb3c5b972279c95f394bdb07cf4a2037f412'
            '565b421ca79f47b58e0c5e9c6dbc3955e440ec6e35f708d3ad1b53701b3a6a817eb07b0bf1d2a960b8d01589133034b961fff7537d4ca9655506041ccb527f50')
sha512sums_x86_64=('95607bb141649ec1d131ea9322622d17524756eac7dc6fc39f24166a7e818a86a1f39950f97d39e0d0bc539cdbb302ad8fd4fe6f71054b49c9e5689239901d3a')
sha512sums_aarch64=('e7195a70ebb0505df69e1469a4df3221dc6fca026a496bf050698db9f85d5cc80bfb1a44b634025472f21f10c082393663063281473d333d26fed57ab00b8aee')

backup=('etc/concrnt/config/apconfig.yaml')

install="concrnt-activitypub.install"

package() {
  depends=('concrnt-gateway')
  backup=('etc/concrnt/config/apconfig.yaml')

  install -Dm755 "${srcdir}/ccactivitypub-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/ccactivitypub"
  install -Dm644 "${srcdir}/concrnt-activitypub.service" "${pkgdir}/usr/lib/systemd/system/concrnt-activitypub.service"
  install -Dm644 "${srcdir}/concrnt-activitypub.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/concrnt-activitypub.conf"
  install -Dm644 "${srcdir}/concrnt-activitypub.hook" "${pkgdir}/usr/share/libalpm/hooks/concrnt-activitypub.hook"
  install -Dm640 "${srcdir}/apconfig.yaml-${_pkgver}" "${pkgdir}/etc/concrnt/config/apconfig.yaml"
  sed -i -E \
    -e "s/([a-z]+):([0-9]+)/localhost:\2/g" \
    -e "s/host=db/host=localhost/" \
    -e "s/user=postgres/user=concrnt/" \
    -e "s/password=postgres/password=concrnt/" \
    -e "s/dbname=concurrent/dbname=concrnt/" \
    "${pkgdir}/etc/concrnt/config/apconfig.yaml"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
