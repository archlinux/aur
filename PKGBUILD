# Maintainer: Chris <goabonga@pm.me>

# Built from source, not downloaded as a prebuilt binary: the AUR's own
# submission guidelines ask for a source build whenever one is practical,
# and a single-binary Go module with no third-party dependencies costs
# nothing extra to compile on the user's machine.

pkgname=poc-pinger
pkgver=0.2.0
pkgrel=1
pkgdesc='Reports TCP connect latency - poc-app demo binary, versioned independently by multicz'
arch=('x86_64')
url='https://github.com/goabonga/poc-app'
license=('MIT')
makedepends=('go')
source=("poc-app-$pkgver.tar.gz::https://github.com/goabonga/poc-app/archive/refs/tags/pinger-v$pkgver.tar.gz")
# Recomputed by .github/workflows/publish.yml on every version bump via
# `updpkgsums` once the corresponding poc-app tag actually exists.
sha256sums=('d8f8d37bda1ad81ccf95504142ff60de3517edf7271e277c12ef289d9624629b')

build() {
  # Not a fixed "poc-app-pinger-v$pkgver" name: while poc-app stays
  # private, publish.yml pre-fetches the source via the REST API tarball
  # endpoint instead of this file's own source=() URL (codeload rejects a
  # fine-grained PAT there), which names the extracted directory
  # "<owner>-poc-app-<sha>" instead. Both forms contain "poc-app".
  cd ./*poc-app*/
  export CGO_ENABLED=0
  go build -trimpath -ldflags='-s -w' -o poc-pinger ./cmd/pinger
}

package() {
  cd ./*poc-app*/
  install -Dm755 poc-pinger "$pkgdir/usr/bin/poc-pinger"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
