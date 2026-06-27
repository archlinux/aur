# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

pkgname=deeplx
pkgver=1.2.2
pkgrel=2
pkgdesc="Powerful free DeepL API, no token required"
arch=('x86_64' 'aarch64' 'i686' 'mips')
url="https://github.com/OwO-Network/DeepLX"
license=('MIT')
depends=('glibc')
makedepends=('go')
conflicts=("${pkgname}-bin" "${pkgname}-git")
install=deeplx.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "deeplx.install")
b2sums=('1b3bbd8d5030ddc1c5b1dac89db6b4fd63a0a625353e880ce3569636a786ea04878105aab9cfa2daf6a55c26af73548cdc3fc588cbefeee1d09e54361935bb0e'
        'd759538dd2271ce506dc146d22dbc60d79d34d35e24ddb7fe31029d1f61088f358a183d4eb140980a7f4ac2e707bd9c3c49449a2af03bffbca9f50a7863ae643')

export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

prepare() {
  cd "DeepLX-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  
  go mod download -modcacherw
}

build() {
  cd "DeepLX-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  
  mkdir -pv build/
  go build -o build/"${pkgname}" main.go
}

package() {
  cd "DeepLX-${pkgver}"
  
  install -Dm755 build/"${pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm644 deeplx.service -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
