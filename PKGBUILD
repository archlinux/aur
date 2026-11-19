# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname='darkubectl-git'
pkgver=0.15.0.r1.gce3c4cc
pkgrel=1
pkgdesc='kubectl-like access to the Hamravesh Darkube platform (development version)'
url='https://github.com/rahacloud/darkubectl'
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go' 'git')
provides=('darkubectl')
conflicts=('darkubectl')
source=("${pkgname}::git+https://github.com/rahacloud/darkubectl.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  export GOFLAGS="-mod=readonly -modcacherw"
  go mod download
}

build() {
  cd "${pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o darkubectl \
    -ldflags="-linkmode=external -X github.com/rahacloud/darkubectl/cmd.version=${pkgver}" .
  for shell in bash zsh fish; do
    ./darkubectl completion "${shell}" > "darkubectl.${shell}"
  done
}

check() {
  cd "${pkgname}"
  export GOFLAGS="-mod=readonly -modcacherw"
  go test ./...
}

package() {
  cd "${pkgname}"
  install -Dm755 darkubectl "${pkgdir}/usr/bin/darkubectl"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 darkubectl.bash "${pkgdir}/usr/share/bash-completion/completions/darkubectl"
  install -Dm644 darkubectl.zsh "${pkgdir}/usr/share/zsh/site-functions/_darkubectl"
  install -Dm644 darkubectl.fish "${pkgdir}/usr/share/fish/vendor_completions.d/darkubectl.fish"
}
