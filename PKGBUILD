# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=diun
pkgver=4.33.1
pkgrel=1
pkgdesc="Receive notifications when an image is updated on a Docker registry."
arch=('x86_64')
url="https://github.com/crazy-max/diun"
conflicts=('diun-bin')
provides=('diun')
license=('MIT')
makedepends=('go>=1.17' 'git' 'gzip' 'tar' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crazy-max/${pkgname}/archive/v${pkgver}.tar.gz"
        "diun.service::https://gitlab.com/mapanare-labs/packages/archlinux/diun-bin/-/raw/main/diun.service"
        "diun.yml::https://gitlab.com/mapanare-labs/packages/archlinux/diun-bin/-/raw/main/diun.yml")
sha256sums=('8062809a14fa5e587267e9cffe66f578b06a6c33ce83f8679d2bca4855b55488'
            '5c16f7ae5b023407a443fbf1d0d811d236c94d191aae1af426e9540d22df3fa7'
            '00436d3e95e446211f9ffbaa36e6b9bc27ffe054745f1a687c4c1c46f1d7da14')

build() {
  mv diun.service diun.yml "${pkgname}-${pkgver}/"
	cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  # Upstream builds with Go 1.26; Go 1.27 breaks grpc (undefined: http2.TrailerPrefix).
  export GOTOOLCHAIN=go1.26.10
  export GOFLAGS="-buildmode=pie -buildvcs=false -trimpath -mod=readonly -modcacherw"
  go build -o build/${pkgname} -ldflags="-linkmode=external -X main.version=${pkgver}" ./cmd/
}

package() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
  install -Dm755 build/"${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm755 diun.service ${pkgdir}/etc/systemd/system/diun.service
  install -Dm644 diun.yml ${pkgdir}/etc/diun/diun.yml
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}

post_install() {
    echo 'Default configuration file `/etc/diun/diun.yml` is included in this package.'
    echo 'You must modify it with you own configuration following the Diun documentation.'
    echo 'See https://crazymax.dev/diun/config/ for more details.'
    echo ''
    echo 'Once the configuration is in place, you can start the Diun system'
    echo 'service or enable it to run on boot like with any other service, e.g.'
    echo '# systemctl enable --now diun.service'
}
