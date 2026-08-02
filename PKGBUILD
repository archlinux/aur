# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='b314a433b4cc66865ed7649b4bf7ae5e71f9c1b3'
pkgname=alps
pkgver=2026.07.28
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
b2sums=('6937fb9c2bb7707ac86698b45d0428a5db6e202945dc1a373b95b6f8ac70bbaa8114fd70a3a7dbb62adf2e4c0858124cc3f303714d5d39f9e614b9d75ee3a2a5'
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
