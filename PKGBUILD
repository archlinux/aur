# Maintainer: agony <27015 at riseup dot net>
# Contributor: envolution
# Contributor: Lindasy Zhou <i@lin.moe>

pkgname=memos
pkgver=26.11.0
pkgrel=1
pkgdesc='A privacy-first, lightweight note-taking service. Easily capture and share your great thoughts.'
arch=('any')
url='https://github.com/usememos/memos'
license=('MIT')
makedepends=('go' 'nodejs>=24' 'pnpm')
backup=('etc/memos.conf')
options=(!strip !debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        'systemd.service'
        'sysusers.conf'
        'memos.conf'
        'tmpfiles.conf')
sha256sums=('067b7411c825cade8cecd9761de5d60a7cc830bf7ef8afdfeae00966be3a546e'
            '956a0895ba490d7057048ed4458172d5b70b726e82127f4505cf95f9d9dcd0f3'
            'eaf0d053c5673176c730085493db4d63b15e212e101fc02c9f9236f8f91abf20'
            '29f519aa64fe4feb7c675aa279bc09e61b59d7a3a20d42a28140df1196a7a68a'
            'ed17b9db8aadd8518a3da01e45b5445a819bdb0f7ccd8bc1acc9f52cc02964fc')

_pnpm_env() {
  export pnpm_config_pm_on_fail=ignore
  export pnpm_config_update_notifier=false
  export pnpm_config_store_dir="${srcdir}/pnpm-store"
  export pnpm_config_cache_dir="${srcdir}/pnpm-cache"
  export pnpm_config_state_dir="${srcdir}/pnpm-state"
}

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
  _pnpm_env
  cd web
  pnpm install --frozen-lockfile
}

build() {
  _pnpm_env
  cd "${pkgname}-${pkgver}/web"
  pnpm release
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  CGO_ENABLED=0 go build -v -ldflags="-X github.com/usememos/memos/internal/version.Version=${pkgver}" -o memos ./cmd/memos
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  DRIVER=sqlite go test -short ./cmd/... ./core/... ./filter/... ./internal/... ./markdown/... ./proto/... ./provider/... ./server/... ./store/...
  test "$(./memos --version)" = "${pkgver}"
}

package() {
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/${pkgname}.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/${pkgname}.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -vDm644 memos.conf "$pkgdir/etc/memos.conf"
  cd "${pkgname}-${pkgver}"
  install -Dm755 memos -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
