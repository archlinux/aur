# Maintainer: agony <27015 at riseup dot net>

pkgname=kubernetes-mcp-server
pkgver=0.1.2
pkgrel=1
pkgdesc='Model Context Protocol (MCP) server for Kubernetes and OpenShift'
arch=('x86_64' 'aarch64' 'powerpc64le')
url='https://github.com/containers/kubernetes-mcp-server'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'demo.kubeconfig')
sha256sums=('3e54fdd971727f1ff319ce3e4d93b7aacc7f4159a8bc0812334ec0830e551f7b'
            '0ecdac7bcbde044afbf603e049b0493bb2eda037eed1fd3e63fc72f638bcd1b8')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  go build -v -ldflags="-linkmode=external -X github.com/containers/kubernetes-mcp-server/pkg/version.Version=v${pkgver}" -o kubernetes-mcp-server ./cmd/kubernetes-mcp-server
  for shell in bash fish zsh; do
    ./kubernetes-mcp-server completion "${shell}" > "completion.${shell}"
  done
}

check() {
  cd "${pkgname}-${pkgver}"
  [[ "$(./kubernetes-mcp-server --version)" == "v${pkgver}" ]]
  [[ "$({ printf '%s\n' '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18","capabilities":{},"clientInfo":{"name":"demo","version":"1.0"}}}' '{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"configuration_view","arguments":{}}}'; sleep 1; } | KUBECONFIG="${srcdir}/demo.kubeconfig" ./kubernetes-mcp-server | tail -n1)" == '{"jsonrpc":"2.0","id":2,"result":{"content":[{"type":"text","text":"apiVersion: v1\nclusters:\n- cluster:\n    server: https://127.0.0.1:1\n  name: demo\ncontexts:\n- context:\n    cluster: demo\n    user: demo\n  name: demo\ncurrent-context: demo\nkind: Config\nusers:\n- name: demo\n  user:\n    token: demo\n"}]}}' ]]
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 kubernetes-mcp-server -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/kubernetes-mcp-server"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/kubernetes-mcp-server.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_kubernetes-mcp-server"
}
