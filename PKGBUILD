# Maintainer: tarball <bootctl@gmail.com>

pkgname=moul-assh
pkgver=2.16.0
pkgrel=3
pkgdesc='make your ssh client smarter'
url='https://github.com/moul/assh'
arch=(i686 pentium4 x86_64 arm armv7h armv6h aarch64 riscv64)
license=(MIT)

provides=(assh)
conflicts=(assh)

depends=(glibc)
makedepends=(go)

_commit='869f9789172e5c778ced5121ca4ac5abdf29bd57'
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/assh"
  go mod download
}

build() {
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$srcdir/assh"
  go build --ldflags "-X moul.io/assh/v2/pkg/version.Version=$pkgver -X moul.io/assh/v2/pkg/version.VcsRef=$_commit" .
}

check() {
  cd "$srcdir/assh"
  go test ./...
  [[ "$(./assh --version)" == "assh version $pkgver ($_commit)" ]]
}

package() {
  cd "$srcdir/assh"

  install -Dm755 assh \
    "$pkgdir"/usr/bin/assh

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 contrib/completion/bash_autocomplete \
    "$pkgdir/usr/share/bash-completion/completions/assh"

  install -Dm644 contrib/completion/zsh_autocomplete \
    "$pkgdir/usr/share/zsh/site-functions/_assh"
}
