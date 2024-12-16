# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgname='concrnt-hyperproxy'
pkgdesc='Concrnt URL summary and image proxy module'
pkgver=0.1.0
_pkgver=v${pkgver}
pkgrel=3
arch=('x86_64' 'aarch64')
url="https://github.com/totegamma/concurrent"
license=('MIT')
makedepends=('go')

source=("${pkgname}-${pkgver}::https://github.com/concrnt/hyperproxy/archive/refs/tags/${_pkgver}.tar.gz"
        "concrnt-hyperproxy.hook"
        "concrnt-hyperproxy.install"
        "concrnt-hyperproxy.service"
        "https://raw.githubusercontent.com/concrnt/hyperproxy/4f874df6522e6efb6c1b80d42a85d46f69984066/LICENSE")

sha512sums=('fe4457b3540841a8fd9d01351be582aff34afec4122dd0734f20a9c8b273286ae1eb80d6ee56bdac670d883cca5a39fbdac4cc09cabb8a6401dbdd7066539446'
            'a8e3bef29bf0599369ca3c129545265a8c7f019f78bb2245269ec3f3e0432beeb25f880698882bba3c43e06d89391a9be4c0ab9a2231cd7ef862f44c49d12088'
            '8e588e058708bd2e1b87949b4692b9db19ae2d8947769e273c9351dbd60d947cd087b3d411b68764d40ff4264b8426d97bf65cc79ebbf8a45f6a338476ebee22'
            '13fb3d0dd136f3c291b6482f47ce28ef40b438610cec3a0bff039b489afb4d30b8cbfd7eabf0a709b9356a478e07c6e3d4d99d57a50b4035eadae5e45228e2e0'
            '6991f0cdffef328c29368d987a46e2d12d765b743cad04ae4c89469e1644f11f079fb495e5297b79d521f88b40d6fb3c5b972279c95f394bdb07cf4a2037f412')

install="concrnt-hyperproxy.install"

build() {
	cd "${srcdir}/hyperproxy-${pkgver}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go mod download
	go build -o hyperproxy
}

package() {
  depends=('concrnt-gateway' 'concrnt-shared-config')

  install -Dm755 "${srcdir}/hyperproxy-${pkgver}/hyperproxy" "${pkgdir}/usr/bin/hyperproxy"
  install -Dm644 "${srcdir}/concrnt-hyperproxy.service" "${pkgdir}/usr/lib/systemd/system/concrnt-hyperproxy.service"
  install -Dm644 "${srcdir}/concrnt-hyperproxy.hook" "${pkgdir}/usr/share/libalpm/hooks/concrnt-hyperproxy.hook"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
