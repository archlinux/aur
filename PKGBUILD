pkgname=gitlab-agent
pkgver=18.0.1
pkgrel=1
pkgdesc='GitLab agentk, kas daemons'
url="https://gitlab.com/gitlab-org/cluster-integration/gitlab-agent"
license=(MIT)
arch=(x86_64)
makedepends=(go)
backup=("etc/gitlab-agent/config.yml")
source=("https://gitlab.com/gitlab-org/cluster-integration/gitlab-agent/-/archive/v$pkgver/gitlab-agent-v$pkgver.tar.gz"
        "gitlab-kas.service")
sha256sums=('365bc797ad37d5f94130e6c2d6d193d25837a78a410a503872862d7b4d13ed89'
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
}
