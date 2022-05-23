# Maintainer: Polpetta
# Maintainer: robertfoster

pkgname=yap-git
pkgver=r16.aad3441
pkgrel=1
pkgdesc="Package software with ease"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/PackageFoundation/yap"
license=('GPL3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname%-git}::git+${url}")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-w -s -buildid='' -linkmode=external -X main.version=${pkgver}" .
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -Dm 755 ./"${pkgname%-git}" \
    "${pkgdir}/usr/bin/${pkgname%-git}"

  mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions/"
  mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"

  ./"${pkgname%-git}" completion bash >"${pkgdir}/usr/share/bash-completion/completions/${pkgname%-git}"
  ./"${pkgname%-git}" completion zsh >"${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-git}"
  ./"${pkgname%-git}" completion fish >"${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname%-git}.fish"

  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/GPL3" LICENSE
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" README.md
}

sha256sums=('SKIP')
