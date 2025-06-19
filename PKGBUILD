pkgname=gitlab-agent
pkgver=18.1.0
pkgrel=1
pkgdesc='GitLab agentk, kas daemons'
url="https://gitlab.com/gitlab-org/cluster-integration/gitlab-agent"
license=(MIT)
arch=(x86_64)
makedepends=(go)
backup=("etc/gitlab-kas/config.yml")
source=("https://gitlab.com/gitlab-org/cluster-integration/gitlab-agent/-/archive/v$pkgver/gitlab-agent-v$pkgver.tar.gz"
        "gitlab-kas.service")
sha256sums=('b70d5c9c873b51d87ba7555996b43989665ac71a050475e0fa4d37c009d85937'
            'f0a39b60b799a3be043de9574451656e416e924d7f0e5441ca5db5440465c84c')

build() {
  cd "$srcdir/gitlab-agent-v$pkgver"

  export GOPATH="$srcdir"
  export CGO_ENABLED=0

  for i in kas agentk autoflow; do
    go build \
        -trimpath \
        -buildmode=exe \
        -mod=readonly \
        -modcacherw \
        -ldflags "-extldflags \"$LDFLAGS\"" \
        -o "bin/$i" ./cmd/$i
  done
}

package() {
  cd "$srcdir/gitlab-agent-v$pkgver"

  for i in kas agentk autoflow; do
    install -Dm0755 -t "$pkgdir/usr/bin/" "bin/$i"
  done

  install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "../gitlab-kas.service"
  install -Dm0644 "pkg/kascfg/kascfg_defaults.yaml" "$pkgdir/etc/gitlab-kas/config.yaml"
}
