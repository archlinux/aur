# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=ssv-network
_pkgname=ssv
pkgver=2.5.0
pkgrel=1
pkgdesc='Secret-Shared-Validator (SSV) node for Ethereum staking'
arch=('x86_64' 'aarch64')
url='https://ssv.network'
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git' 'go')
provides=('ssvnode')
conflicts=('ssvnode')
backup=('etc/ssvnode/config.yaml')
source=("${_pkgname}::git+https://github.com/ssvlabs/ssv.git#tag=v${pkgver}"
        'ssvnode.service'
        'ssvnode.sysusers'
        'ssvnode.tmpfiles')
sha256sums=('88e12c0fbfdb6d2d98ac272c8ca89503cce12aa203934a2f68387e45ca6d78f2'
            'b96f3f905287d84bab2d51ebe69d62184e7bcffc4cc1234e9431998828896565'
            'f108321762dd617d37091dc2b5ece909b8472ab7d21da0c2b0d0933fa115ae9d'
            'c985bd739b1313b53f8475f94f8b17c8397156eb8881fb2145e1e7dd9a88ae10')

prepare() {
  cd "${_pkgname}"
  export GOPATH="${srcdir}/gopath"
  go mod download -modcacherw
}

build() {
  cd "${_pkgname}"
  export GOPATH="${srcdir}/gopath"
  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  # blst_enabled matches upstream's release builds (Dockerfile)
  go build -o bin/ssvnode \
    -tags=blst_enabled \
    -ldflags "-linkmode=external -X main.Commit=$(git rev-parse HEAD) -X main.Version=v${pkgver}" \
    ./cmd/ssvnode
}

package() {
  cd "${_pkgname}"
  install -Dm755 bin/ssvnode "${pkgdir}/usr/bin/ssvnode"

  # Example config with state under /var/lib/ssvnode. It will hold the operator
  # key, so tmpfiles makes it readable by the ssvnode group only.
  install -dm755 "${pkgdir}/etc/ssvnode"
  sed 's|\./data/|/var/lib/ssvnode/|' config/config.example.yaml >"${pkgdir}/etc/ssvnode/config.yaml"
  chmod 640 "${pkgdir}/etc/ssvnode/config.yaml"
  install -Dm644 config/*.example.yaml -t "${pkgdir}/usr/share/doc/${pkgname}/"

  install -Dm644 "${srcdir}/ssvnode.service" "${pkgdir}/usr/lib/systemd/system/ssvnode.service"
  install -Dm644 "${srcdir}/ssvnode.sysusers" "${pkgdir}/usr/lib/sysusers.d/ssvnode.conf"
  install -Dm644 "${srcdir}/ssvnode.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/ssvnode.conf"
}
