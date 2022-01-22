# Maintainer: Polpetta
# Maintainer: robertfoster

pkgname=yap-git
pkgver=r9.5b847f2
pkgrel=1
pkgdesc="Package software with ease"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/PackageFoundation/yap"
license=('GPL3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'go')
source=("${pkgname%-git}::git+${url}")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  # printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${pkgname%-git}"

  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

  go build

  ./"${pkgname%-git}" completion bash >"${srcdir}/${pkgname%-git}.bash"
  ./"${pkgname%-git}" completion fish >"${srcdir}/${pkgname%-git}.fish"

}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -Dm 755 ./"${pkgname%-git}" \
    "${pkgdir}/usr/bin/${pkgname%-git}"

  install -Dm 644 "$srcdir/${pkgname%-git}.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-git}"
  install -Dm 644 "$srcdir/${pkgname%-git}.fish" \
    "${pkgdir}/usr/share/fish/completions/${pkgname%-git}.fish"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/GPL3" LICENSE
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" README.md
}

sha256sums=('SKIP')
