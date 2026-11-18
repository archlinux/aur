# Maintainer: Dwi Mulia Mokoginta <malwareslayer@users.noreply.github.com>
pkgname=ollama-antigravity
pkgver=0.4.1
pkgrel=1
pkgdesc='Zero-dependency Go Ollama & OpenAI /v1/ HTTP bridge backed by agy acp'
arch=('x86_64' 'aarch64')
url='https://github.com/malwareslayer/ollama-antigravity'
license=('MIT')
depends=('antigravity-cli')
makedepends=('go' 'git')
backup=('etc/ollama-antigravity/env')
source=("$pkgname::git+https://github.com/malwareslayer/ollama-antigravity.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS:-}"
  export CGO_CFLAGS="${CFLAGS:-}"
  export CGO_CXXFLAGS="${CXXFLAGS:-}"
  export CGO_LDFLAGS="${LDFLAGS:-}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o "$pkgname" ./cmd/ollama-antigravity
}

check() {
  cd "$srcdir/$pkgname"
  go test ./...
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 packaging/systemd/ollama-antigravity.service \
    "$pkgdir/usr/lib/systemd/system/ollama-antigravity.service"
  install -Dm644 packaging/systemd/ollama-antigravity.user.service \
    "$pkgdir/usr/lib/systemd/user/ollama-antigravity.service"
  install -Dm644 packaging/systemd/ollama-antigravity.sysusers \
    "$pkgdir/usr/lib/sysusers.d/ollama-antigravity.conf"
  install -Dm644 packaging/systemd/ollama-antigravity.env \
    "$pkgdir/etc/ollama-antigravity/env"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
