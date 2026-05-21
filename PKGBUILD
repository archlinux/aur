# Maintainer: Guiradev <aur.evacuate190@passinbox.com>

pkgname=gentle-ai
pkgver=1.30.6
pkgrel=1
pkgdesc="CLI tool to manage and configure AI coding agents ecosystems"
arch=('x86_64' 'aarch64')
url="https://github.com/Gentleman-Programming/gentle-ai"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('499e4baa5bb92e7eccbbc31d342fb30daafa8f3fa336de78219f0d94db326946')

prepare() {
  # Entramos en la carpeta que acabas de ver con 'ls'
  cd "${pkgname}-${pkgver}"

  # Descargamos dependencias aquí para que el chroot no necesite red en build()
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"

  # Flags de optimización y seguridad estándar de Arch
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  # Inyectamos la versión para que 'gentle-ai --version' no devuelva null
  local _ldflags="-X main.version=v${pkgver} -linkmode=external"

  # Compilamos. El binario se guardará en la carpeta 'build/' dentro de 'src/gentle-ai-${pkgver}/'
  go build -v -o build/gentle-ai -ldflags "$_ldflags" ./cmd/gentle-ai
}

package() {
  cd "${pkgname}-${pkgver}"

  # 1. Instalamos el binario
  install -Dm755 build/gentle-ai "${pkgdir}/usr/bin/gentle-ai"

  # 2. Instalamos la licencia (obligatorio para MIT en Arch)
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
