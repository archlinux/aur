# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-lock
pkgver=0.1.0
pkgrel=1
pkgdesc="Wayland session locker for Niri with PAM authentication"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-lock"
license=('BSD-3-Clause')
depends=('glibc' 'pam' 'libglvnd' 'systemd' 'util-linux' 'niri' 'ttf-jetbrains-mono')
optdepends=('sysc-shell: lock-screen settings and theme following')
makedepends=('go>=1.26.4')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/sysc-lock/archive/refs/tags/v${pkgver}.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/Nomadcxx/sysc-lock/77c962e6a8886e4c465221d9ea7da48bc2c70ad5/LICENSE")
sha256sums=('9f2499a5e3c942db8ad7b2734828bba27485f05edee0a6fa4ea75b2b809d8db9' 'e79b463f506ee0a390088b757cb77f6643ce3bd2319c08884335d486456a214e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOTOOLCHAIN=local
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS} -D_GNU_SOURCE"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build -buildvcs=false -o "${pkgname}" "./cmd/${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 contrib/systemd/sysc-lock-session.service "${pkgdir}/usr/lib/systemd/user/sysc-lock-session.service"
  sed -i 's|%h/.local/bin/|/usr/bin/|g' "${pkgdir}/usr/lib/systemd/user/sysc-lock-session.service"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
