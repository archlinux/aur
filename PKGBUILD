# Maintainer: Chris <goabonga@pm.me>

# Built from source, not downloaded as a prebuilt binary: the AUR's own
# submission guidelines ask for a source build whenever one is practical,
# and a single-binary Go module with no third-party dependencies costs
# nothing extra to compile on the user's machine.

pkgname=poc-hello
pkgver=0.2.0
pkgrel=1
pkgdesc='Prints a greeting - poc-app demo binary, versioned independently by multicz'
arch=('x86_64')
url='https://github.com/goabonga/poc-app'
license=('MIT')
makedepends=('go')
source=("poc-app-$pkgver.tar.gz::https://github.com/goabonga/poc-app/archive/refs/tags/hello-v$pkgver.tar.gz")
# Recomputed by .github/workflows/publish.yml on every version bump via
# `updpkgsums` once the corresponding poc-app tag actually exists.
sha256sums=('2dc7fdfe7fd1fb7516c7a38cca6e9e00c6f961ec57f3c37a7d80a0a85a7949b6')

build() {
  # Not a fixed "poc-app-hello-v$pkgver" name: while poc-app stays
  # private, publish.yml pre-fetches the source via the REST API tarball
  # endpoint instead of this file's own source=() URL (codeload rejects a
  # fine-grained PAT there), which names the extracted directory
  # "<owner>-poc-app-<sha>" instead. Both forms contain "poc-app".
  cd ./*poc-app*/
  export CGO_ENABLED=0
  go build -trimpath -ldflags='-s -w' -o poc-hello ./cmd/hello
}

package() {
  cd ./*poc-app*/
  install -Dm755 poc-hello "$pkgdir/usr/bin/poc-hello"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
