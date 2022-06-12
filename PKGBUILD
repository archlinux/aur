pkgname=git-sendgmail-git
pkgver=r20.e322915
pkgrel=1
pkgdesc='Use git send-email with gmail via OAuth2'
arch=('x86_64')
url="https://github.com/google/gmail-oauth2-tools/tree/master/go/sendgmail"
license=('APACHE')
makedepends=('go')
source=("$pkgname::git+https://github.com/google/gmail-oauth2-tools")
sha256sums=('SKIP')
subdir="$pkgname/go/sendgmail"

pkgver() {
  cd "$subdir"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$subdir"
  rm -f go.mod
  go mod init github.com/google/gmail-oauth2-tools/go/sendgmail
  go mod tidy
}

build() {
  cd "$subdir"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GO111MODULE=on
  go build -o sendgmail .
}

check() {
  cd "$subdir"
  go test ./...
}

package() {
  cd "$subdir"
  install -Dm755 sendgmail "$pkgdir"/usr/bin/sendgmail
}
