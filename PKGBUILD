# Maintainer: Levi Zim <i AT kxxt DOT dev>

# Feel free to send a PR to https://github.com/kxxt/aur-parca-agent

pkgname=parca-agent
pkgver=0.45.1
pkgrel=2

pkgdesc='eBPF based always-on CPU/GPU profiler auto-discovering targets in Kubernetes and systemd, zero code changes or restarts needed!'
url='https://parca.dev'
arch=('x86_64')
license=('Apache-2.0')

makedepends=('go' 'git' 'libbpf' 'clang')

backup=('etc/parca-agent/parca-agent.yaml' 'etc/conf.d/parca-agent')

source=("parca-agent-v$pkgver.tar.gz::https://github.com/parca-dev/parca-agent/archive/refs/tags/v${pkgver}.tar.gz"
        parca-agent.service
        parca-agent.sysusers
        parca-agent.tmpfiles
        parca-agent.conf
        parca-agent.yaml)

sha256sums=('75e2254a70c9dcf3c85efddaa42c92e03cfb72a4b3f9e5e35caa4b728eba9d6e'
            'eb1de9a61d0df6b9ed7e9136e4a69a1b6a675c65a0cbd3f430cce2a55ddf37cb'
            'e5ebc9cee30544d4b955e87c3081587ddead973b0d5770dfb83307473a4e9c17'
            '14f002554d728223c0b72057eeba8fed25bd4701783a9e498fe9d42cfe921f84'
            'e4544cfb2723fea484946d3a07b3b2ac1292468adf887fe67bacab9c98e8e275'
            'bbc78f29c2f515d4732f97728381db06428244e299631eee9c33059ea9980d3d')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw -x
}

build() {
  # make build
  cd "${pkgname}-${pkgver}"
  go build -v \
   -o parca-agent \
   -buildvcs=false \
   -trimpath \
   -buildmode=pie \
   -mod=readonly \
   -modcacherw \
   -ldflags="-linkmode external" \
   -tags osusergo,netgo
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -short ./...
}

package() {
  install -Dm644 parca-agent.service "$pkgdir"/usr/lib/systemd/system/parca-agent.service
  install -Dm644 parca-agent.sysusers "$pkgdir"/usr/lib/sysusers.d/parca-agent.conf
  install -Dm644 parca-agent.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/parca-agent.conf
  install -Dm644 parca-agent.conf "${pkgdir}"/etc/conf.d/parca-agent
  install -Dm640 -t "$pkgdir"/etc/parca-agent parca-agent.yaml

  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "$pkgdir"/usr/bin parca-agent
}
