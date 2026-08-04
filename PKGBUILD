# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

pkgname=dlx
_binary=deeplx
pkgver=1.2.3
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
b2sums=('7a1f96786da596495ef202bb7bab1384d2e88931247dea6b7a29d183ca5fe844943ea15a07a2921b15592fc9c33d0cbb8289ef7c23840db84886dd1b8b11d7b4'
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
