# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

pkgname=dlx
_binary=deeplx
pkgver=1.2.5
pkgrel=1
pkgdesc="Self-hosted translation API server. Unofficial; not affiliated with DeepL SE"
arch=('x86_64' 'aarch64' 'i686' 'mips')
url="https://github.com/OwO-Network/DLX"
license=('MIT')
depends=('glibc')
makedepends=('go')
provides=("${_binary}")
replaces=("${_binary}")
conflicts=("${_binary}" "${_binary}-bin" "${_binary}-git" 
           "${pkgname}-bin" "${pkgname}-git")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.install")
b2sums=('c9ad1836d677c04b9fce2f6cf4a502fbb797439f360ff13510460e64097271c83209f762e0532377bb0defda6efc85d1bb14a9d94dd1f07cc07510760adc224d'
        'd759538dd2271ce506dc146d22dbc60d79d34d35e24ddb7fe31029d1f61088f358a183d4eb140980a7f4ac2e707bd9c3c49449a2af03bffbca9f50a7863ae643')

export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

prepare() {
  cd "DLX-${pkgver}"
  export GOPATH="${srcdir}/gopath"

  go mod download -modcacherw
}

build() {
  cd "DLX-${pkgver}"
  export GOPATH="${srcdir}/gopath"

  mkdir -pv build/
  go build -o build/"${_binary}" main.go
}

package() {
  cd "DLX-${pkgver}"

  install -Dm755 build/"${_binary}" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${_binary}.service" -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
