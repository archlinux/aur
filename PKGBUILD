# Maintainer: agony <27015 at riseup dot net>

pkgname=greenmask-git
pkgver=r613.a29edd8
pkgrel=1
pkgdesc='PostgreSQL dump, anonymization and restore tool (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/GreenmaskIO/greenmask'
license=('Apache-2.0')
depends=('glibc' 'postgresql-libs')
makedepends=('git' 'go')
provides=('greenmask')
conflicts=('greenmask')
source=("greenmask::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd greenmask
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd greenmask
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd greenmask
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  local version
  version=$(git describe --tags)
  go build -v -tags=viper_bind_struct \
    -ldflags="-linkmode=external -X github.com/greenmaskio/greenmask/cmd/greenmask/cmd.Version=${version}" \
    -o greenmask ./cmd/greenmask
  for shell in bash fish zsh; do
    ./greenmask completion "${shell}" > "completion.${shell}"
  done
}

package() {
  cd greenmask
  install -Dm755 greenmask -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/greenmask"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/greenmask.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_greenmask"
  install -Dm644 config.yml.example -t "${pkgdir}/usr/share/doc/${pkgname}"
}
