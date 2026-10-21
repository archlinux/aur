# Maintainer: Robert Rosca <robert@rosca.dev>

pkgname=crit
pkgver=0.23.0
pkgrel=1
pkgdesc="Review AI coding agents' plans, diffs and running apps in the browser, local-first"
arch=('x86_64' 'aarch64')
url='https://github.com/tomasz-tomczyk/crit'
license=('MIT')
depends=('glibc' 'git')
makedepends=('go>=2:1.26')
checkdepends=('git')
optdepends=('github-cli: GitHub PR comment sync'
            'glab: GitLab MR comment sync'
            'jujutsu: jj repository support'
            'sapling-scm: Sapling repository support'
            'xdg-utils: open reviews in the browser'
            'libnotify: desktop notifications'
            'xdg-user-dirs: locate Documents dir for crit install')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4b1c0f9835f752ac07014ef306a60051f4fb1839f1911f8916eceff0938f2383')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath" GOTOOLCHAIN=local GOFLAGS="-modcacherw"
  go mod download
}

build() {
  # Get the commit from the GitHub archives pax header
  local _commit
  _commit=$(zcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)

  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath" GOTOOLCHAIN=local
  export CGO_CPPFLAGS="${CPPFLAGS}" CGO_CFLAGS="${CFLAGS}" \
         CGO_CXXFLAGS="${CXXFLAGS}" CGO_LDFLAGS="${LDFLAGS}"
  # -buildvcs=false: don't stamp the enclosing packaging repo's revision into
  # the binary as upstream version info is passed explicitly via -ldflags
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -buildvcs=false"
  # main.date is the build time (makepkg's SOURCE_DATE_EPOCH), not the release date.
  go build \
    -ldflags "-linkmode=external -X main.version=${pkgver} -X main.commit=${_commit:0:7} -X main.date=$(date -u -d "@${SOURCE_DATE_EPOCH}" +%F)" \
    -o "${pkgname}" ./cmd/crit
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath" GOTOOLCHAIN=local GOFLAGS="-modcacherw"
  # Tests detect default branch from the cwd's repo which causes issues,
  # making a repo for the tests to run in solves this
  git init -q
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
