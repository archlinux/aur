# Maintainer: agony <27015 at riseup dot net>
# Contributor: envolution
# Contributor: Lindasy Zhou <i@lin.moe>

pkgname=memos
pkgver=26.11.0
pkgrel=1
pkgdesc='Privacy-first, lightweight note-taking service'
arch=('x86_64' 'aarch64')
url='https://github.com/usememos/memos'
license=('MIT')
depends=('glibc')
makedepends=('go' 'nodejs>=24' 'pnpm')
install=memos.install
backup=('etc/memos.conf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        'memos.service'
        'memos-sysusers.conf'
        'memos-tmpfiles.conf'
        'memos.conf')
sha256sums=('067b7411c825cade8cecd9761de5d60a7cc830bf7ef8afdfeae00966be3a546e'
            '0c7d5102f95e7348c4791e2c919b3664c1124469c5174349c81153894affe2dd'
            'eaf0d053c5673176c730085493db4d63b15e212e101fc02c9f9236f8f91abf20'
            'ed17b9db8aadd8518a3da01e45b5445a819bdb0f7ccd8bc1acc9f52cc02964fc'
            '0e0b2a4e83ecb837055a59ee19c869586b2c74abeaa3b7a43fff95c19bd34e4d')

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
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  go build -v -ldflags="-linkmode=external -X github.com/usememos/memos/internal/version.Version=${pkgver}" -o memos ./cmd/memos
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  DRIVER=sqlite go test -short ./cmd/... ./core/... ./filter/... ./internal/... ./markdown/... ./proto/... ./provider/... ./server/... ./store/...
  test "$(./memos --version)" = "${pkgver}"
}

package() {
  install -Dm644 memos.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 memos-sysusers.conf "${pkgdir}/usr/lib/sysusers.d/memos.conf"
  install -Dm644 memos-tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/memos.conf"
  install -Dm644 memos.conf -t "${pkgdir}/etc"
  cd "${pkgname}-${pkgver}"
  install -Dm755 memos -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
