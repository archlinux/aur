# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='a250ab3313ef703d72aa3ece883736eeb28a5c51'
pkgname=alps
pkgver=2026.08.13
pkgrel=1
pkgdesc='A simple and extensible webmail'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/migadu/alps'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
backup=("etc/${pkgname}.toml")
source=("${pkgname}-${_commit}::git+https://github.com/migadu/${pkgname}.git#commit=${_commit}"
        "${pkgname}-system.service"
        "${pkgname}-user.service")
b2sums=('e793ad642658e077a083634c236969fccee3aac21bd2f4037d0406b8ff335d9aa755b66a4fdb5e4452b89a54af33fdc20062d036235ad3f1f0aa92aaa974e875'
        'f8a965be3570f8094d76b8d4617d8d985cd6f6eef76ac35f8b5603d6af39f5e326afb51d507cd5b459d80ca20154df4fe1bb4aba18a7004bda1e0f6bccb719d5'
        'f8b109b613bac65e8c707c94c2bd6e259e13cfb9e833c401a8546a0cb4507b9dc9a8d89091c3793ce602a280e22f5ae3dd66accf589710aaab388aa4546d0ff5')

build() {
  cd "${pkgname}-${_commit}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o ${pkgname} ./cmd/alps
}

package() {
  # services
  install -D -m644 ${pkgname}-system.service \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -D -m644 ${pkgname}-user.service \
    "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

  cd "${pkgname}-${_commit}"
  # binary
  install -D -m755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  # config
  install -D -m644 config.example.toml "${pkgdir}/etc/${pkgname}.toml"
  # docs
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  cp -a docs "${pkgdir}/usr/share/doc/${pkgname}"
  # license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
