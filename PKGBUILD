# Maintainer: FreeTurn contributors <https://gitlab.com/freeturn/freeturn-desktop>
# Live git build of the FreeTurn desktop client (Wails v2 + Go + React).
#
# This directory is AUR-ready: to publish, copy its contents (PKGBUILD,
# .SRCINFO, *.install) into an empty `freeturn-desktop-git` AUR repository
# and push. See README.md next to this file for the maintainer checklist.

pkgname=freeturn-desktop-git
pkgver=r6.bca9d5b
pkgrel=1
pkgdesc='FreeTurn VPN client - git build'
arch=('x86_64')
url='https://gitlab.com/freeturn/freeturn-desktop'
license=('Unlicense')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libayatana-appindicator'
)
makedepends=(
  'gcc'
  'git'
  'go'
  'nodejs'
  'npm'
  'pkgconf'
)
optdepends=(
  'iproute2: TUN addresses, routes and policy routing at connect time'
  'iptables: per-app UID rules and cgroup-v2 bypass on Linux'
  'polkit: pkexec elevation prompt for one-click service install'
  'systemd: system-service install backend'
)
provides=('freeturn-desktop')
conflicts=('freeturn-desktop' 'freeturn-desktop-bin')
install='freeturn-desktop-git.install'
source=("$pkgname::git+https://gitlab.com/freeturn/freeturn-desktop.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"

  # Arch Go package guidelines: honor the system CFLAGS/LDFLAGS, build
  # position-independent, strip build paths, keep modules read-only, and
  # keep all caches inside srcdir so clean chroots stay tidy.
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath"
  export GOCACHE="$srcdir/gocache"
  export npm_config_cache="$srcdir/npm-cache"

  # main.go embeds frontend/dist, so the frontend builds first. package-lock.json
  # is committed, hence reproducible `npm ci` (needs devDependencies: vite, tsc).
  npm ci --prefix frontend
  npm --prefix frontend run build

  # Wails' cgo defaults to pkg-config webkit2gtk-4.0, which no longer exists on
  # Arch (only webkit2gtk-4.1 is shipped); webkit2_41 opts into the 4.1 API.
  # desktop,production are the tags `wails build` uses. The version stamp feeds
  # both `--version` and Settings (backend.AppVersion via App.Version()).
  go build \
    -tags desktop,production,webkit2_41 \
    -ldflags "-linkmode=external -X main.version=$pkgver" \
    -o build/bin/freeturn-desktop \
    .
}

check() {
  cd "$pkgname"
  export GOPATH="$srcdir/gopath"
  export GOCACHE="$srcdir/gocache"
  export GOFLAGS='-mod=readonly -modcacherw'
  # Same tags as build(): the test binary links main -> the Wails Linux
  # frontend, so it needs webkit2_41 for the exact same cgo reason.
  go test -tags desktop,production,webkit2_41 ./...
}

package() {
  cd "$pkgname"
  install -Dm755 build/bin/freeturn-desktop "$pkgdir/usr/bin/freeturn-desktop"
  install -Dm644 build/linux/freeturn.desktop "$pkgdir/usr/share/applications/freeturn-desktop.desktop"
  install -Dm644 build/appicon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/freeturn-desktop.png"
  # Unlicense is not in /usr/share/licenses/common, so ship the repo copy.
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
