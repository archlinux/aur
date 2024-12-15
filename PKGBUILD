# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgname='concrnt-activitypub-bin'
pkgdesc='Concrnt ActivityPub bridge module'
pkgver=0.3.1
_pkgver=v${pkgver}
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://github.com/totegamma/concurrent"
license=('MIT')
depends=('concrnt-gateway')

provides=('concrnt-activitypub')
conflicts=('concrnt-activitypub')

options=('strip' '!debug')

source=("concrnt-activitypub.hook"
        "concrnt-activitypub.install"
        "concrnt-activitypub.service"
        "concrnt-activitypub.tmpfiles"
        # same license as the main server
        "https://raw.githubusercontent.com/totegamma/concurrent/c14d20383ec642ba19a2f063709149a563d8a096/LICENSE"
        "https://raw.githubusercontent.com/totegamma/concurrent/c14d20383ec642ba19a2f063709149a563d8a096/_docs/etc/config/apconfig.yaml"
)
source_x86_64=("ccactivitypub-x86_64-${pkgver}::https://github.com/concrnt/ccworld-ap-bridge/releases/download/${_pkgver}/ccworld-ap-bridge-linux-amd64")
source_aarch64=("ccactivitypub-aarch64-${pkgver}::https://github.com/concrnt/ccworld-ap-bridge/releases/download/${_pkgver}/ccworld-ap-bridge-linux-arm64")

sha512sums=('4f1659dfee68c17326f979171fffb15dc8c03ae9b5c952d6c374d52d8b749bd138bae51dd8ed2238d06d30e4431ef5e376ca5115bbea73882c532257dcf4dbdf'
            'a30de37161dca32fb86dab319c39537f91a68d328ccfc765614bc742bc66ecc92e63f6bcd371af67f4e37a92b96c7f63d8e327c2be37be3c239f24955b2b25b8'
            '8b25307bc102e181bc04ad1c625385086506186203b39bb0c939e6bf9ccc9fb5397daaca8a740a1eff188cc582469bf54ff4548cb38ba8f76250ec35768c6c5c'
            '2ad3d6cbfc46e0c804ed7d8d93e4a9be3085c9a94c7cf4281ec571272e9f0e03f9e2b61a216dbf5af74252ec3f3e0eebeb7cb4705a87d4537987b28fbce15e22'
            '6991f0cdffef328c29368d987a46e2d12d765b743cad04ae4c89469e1644f11f079fb495e5297b79d521f88b40d6fb3c5b972279c95f394bdb07cf4a2037f412'
            '565b421ca79f47b58e0c5e9c6dbc3955e440ec6e35f708d3ad1b53701b3a6a817eb07b0bf1d2a960b8d01589133034b961fff7537d4ca9655506041ccb527f50')
sha512sums_x86_64=('d02cb394234a67acba5429bd25da8dbf90698f3a597eeeb7cfe82395380846dcdd1ec1314798176a603f01de148232956278512325515d47222f61db8aaf6624')
sha512sums_aarch64=('34f7d7888d4ade5ad1e9465e57a1a5249332a7af4f5616be42e2b16ea12a9a68fdd2612d419d7ddb784b92d1f94fee93727a155829c22d57ef03b776a1570f12')

backup=('etc/concrnt/config/apconfig.yaml')

install="concrnt-activitypub.install"

package() {
  backup=('etc/concrnt/config/apconfig.yaml')

  install -Dm755 "${srcdir}/ccactivitypub-${arch}-${pkgver}" "${pkgdir}/usr/bin/ccactivitypub"
  install -Dm644 "${srcdir}/concrnt-activitypub.service" "${pkgdir}/usr/lib/systemd/system/concrnt-activitypub.service"
  install -Dm644 "${srcdir}/concrnt-activitypub.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/concrnt-activitypub.conf"
  install -Dm644 "${srcdir}/concrnt-activitypub.hook" "${pkgdir}/usr/share/libalpm/hooks/concrnt-activitypub.hook"
  install -Dm640 "${srcdir}/apconfig.yaml" "${pkgdir}/etc/concrnt/config/apconfig.yaml"
  sed -i -E \
    -e "s/([a-z]+):([0-9]+)/localhost:\2/g" \
    -e "s/host=db/host=localhost/" \
    -e "s/user=postgres/user=concrnt/" \
    -e "s/password=postgres/password=concrnt/" \
    -e "s/dbname=concurrent/dbname=concrnt/" \
    "${pkgdir}/etc/concrnt/config/apconfig.yaml"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
