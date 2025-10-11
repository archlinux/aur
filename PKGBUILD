pkgname=gitlab-agent
pkgver=18.4.2
pkgrel=1
pkgdesc='GitLab agentk, kas daemons'
url="https://gitlab.com/gitlab-org/cluster-integration/gitlab-agent"
license=(MIT)
arch=(x86_64)
makedepends=('go' 'git')
backup=("etc/gitlab-kas/config.yaml")
#source=("https://gitlab.com/gitlab-org/cluster-integration/gitlab-agent/-/archive/v$pkgver/gitlab-agent-v$pkgver.tar.gz"
source=("git+https://gitlab.com/gitlab-org/cluster-integration/gitlab-agent.git/#tag=v$pkgver"
        "gitlab-kas.service")
sha256sums=('899153e9b2550089c07f2b0d61d71da72b2e80c9dae54160f2cb948a425c03dc'
            'f0a39b60b799a3be043de9574451656e416e924d7f0e5441ca5db5440465c84c')

build() {
  cd "$srcdir/gitlab-agent"

  export GOPATH="$srcdir"
  export CGO_ENABLED=0
  make kas agentk
}

package() {
  cd "$srcdir/gitlab-agent"

  for i in kas agentk; do
    install -Dm0755 -t "$pkgdir/usr/bin/" "tmp/$i"
  done

  install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "../gitlab-kas.service"
  install -Dm0644 "pkg/kascfg/kascfg_defaults.yaml" "$pkgdir/etc/gitlab-kas/config.yaml"
}
