# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgname='concrnt-activitypub'
pkgdesc='Concrnt ActivityPub bridge module'
pkgver=0.4.1
_pkgver=v${pkgver}
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/totegamma/concurrent"
license=('MIT')
makedepends=('go')

source=("${pkgname}-${pkgver}::https://github.com/concrnt/ccworld-ap-bridge/archive/refs/tags/${_pkgver}.tar.gz"
        "concrnt-activitypub.hook"
        "concrnt-activitypub.install"
        "concrnt-activitypub.service"
        "concrnt-activitypub.tmpfiles"
        "apconfig.yaml-${_pkgver}::https://raw.githubusercontent.com/totegamma/concurrent/c14d20383ec642ba19a2f063709149a563d8a096/_docs/etc/config/apconfig.yaml")

sha512sums=('2a6c1ca71615f9f83746802215e0eadf68410fa0db5540ed90a65fa29950dc08c47ec8aa2b74756cdde97c63e83ad6a3a926e27614867328806a7442417050ce'
            'cb966ab96a7799bb603e80ce46a4e8446697e4fa5cc9002f065fb126e909ee68c030c2232ce75e355454f18862997282c3465b0456b14addcdfd93168506a99b'
            'a30de37161dca32fb86dab319c39537f91a68d328ccfc765614bc742bc66ecc92e63f6bcd371af67f4e37a92b96c7f63d8e327c2be37be3c239f24955b2b25b8'
            '8b25307bc102e181bc04ad1c625385086506186203b39bb0c939e6bf9ccc9fb5397daaca8a740a1eff188cc582469bf54ff4548cb38ba8f76250ec35768c6c5c'
            '2ad3d6cbfc46e0c804ed7d8d93e4a9be3085c9a94c7cf4281ec571272e9f0e03f9e2b61a216dbf5af74252ec3f3e0eebeb7cb4705a87d4537987b28fbce15e22'
            '565b421ca79f47b58e0c5e9c6dbc3955e440ec6e35f708d3ad1b53701b3a6a817eb07b0bf1d2a960b8d01589133034b961fff7537d4ca9655506041ccb527f50')

install="concrnt-activitypub.install"

build() {
	cd "${srcdir}/ccworld-ap-bridge-${pkgver}"

	go mod download

	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	export CONCRNT_LDFLAGS="-s -w -X main.version=${_pkgver} -X \"main.buildMachine=$(uname -srmo)\" -X \"main.buildTime=$(date)\" -X \"main.goVersion=$(go version)\""

	go build -ldflags="${CONCRNT_LDFLAGS}" -o ccactivitypub ./cmd
}

package() {
  depends=('concrnt-gateway')
  backup=('etc/concrnt/config/apconfig.yaml')

  install -Dm755 "${srcdir}/ccworld-ap-bridge-${pkgver}/ccactivitypub" "${pkgdir}/usr/bin/ccactivitypub"
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

  install -Dm644 "${srcdir}/ccworld-ap-bridge-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
