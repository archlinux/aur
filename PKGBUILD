# Maintainer: Chris <goabonga@pm.me>

# Built from source, not downloaded as a prebuilt binary: the AUR's own
# submission guidelines ask for a source build whenever one is practical,
# and a single-binary Go module with no third-party dependencies costs
# nothing extra to compile on the user's machine.

pkgname=poc-greeter
pkgver=0.1.0
pkgrel=1
pkgdesc='Prints a greeting - poc-app demo binary, versioned independently by multicz'
arch=('x86_64')
url='https://github.com/goabonga/poc-app'
license=('MIT')
makedepends=('go')
source=("poc-app-$pkgver.tar.gz::https://github.com/goabonga/poc-app/archive/refs/tags/greeter-v$pkgver.tar.gz")
# Recomputed by .github/workflows/publish.yml on every version bump via
# `updpkgsums` once the corresponding poc-app tag actually exists.
sha256sums=('b7211b64140a7cc4848f5a3861e7d36a44681af3e4dc282627dd14955f1cc89b')

build() {
  # Not a fixed "poc-app-greeter-v$pkgver" name: while poc-app stays
  # private, publish.yml pre-fetches the source via the REST API tarball
  # endpoint instead of this file's own source=() URL (codeload rejects a
  # fine-grained PAT there), which names the extracted directory
  # "<owner>-poc-app-<sha>" instead. Both forms contain "poc-app".
  cd ./*poc-app*/
  export CGO_ENABLED=0
  go build -trimpath -ldflags='-s -w' -o poc-greeter ./cmd/greeter
}

package() {
  cd ./*poc-app*/
  install -Dm755 poc-greeter "$pkgdir/usr/bin/poc-greeter"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
