# Maintainer: Jerzy Kołosowski <jerzy@kolosowscy.pl>

pkgname=oldipmi-git
_pkgname=oldipmi
pkgver=0.6.0.r1.gd3b5ba4
pkgrel=1
pkgdesc='Native KVM console for older server BMCs (AMI MegaRAC, Supermicro/ATEN, iDRAC, Cisco IMC), without Java'
arch=('x86_64' 'aarch64')
url='https://github.com/christianreiss/oldipmi'
# OldIPMI is GPL-3.0-or-later; the rest covers the bundled MIT code and the
# linked Go modules (THIRD_PARTY.md, licenses/go).
license=('GPL-3.0-or-later' 'MIT' 'Apache-2.0' 'BSD-3-Clause')
depends=(
  'qt6-base'
  'qt6-declarative'
  'kwallet'
  'kirigami'
  'kirigami-addons'
  'hicolor-icon-theme'
  'libgcc'
  'libstdc++'
  'glibc'
)
makedepends=(
  'git'
  'go'
  'cmake'
  'ninja'
)
checkdepends=('desktop-file-utils')
optdepends=('qqc2-desktop-style: desktop look of Kirigami controls outside Plasma')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# Go settings shared by every step: caches inside $srcdir, the system Go only.
_goenv() {
  export GOPATH="$srcdir/gopath"
  export GOMODCACHE="$srcdir/gomodcache"
  export GOCACHE="$srcdir/gocache"
  export GOTOOLCHAIN=local
}

prepare() {
  _goenv
  cd "$_pkgname"
  go mod download -modcacherw
}

build() {
  _goenv
  # CMake runs "go build" (CGO_ENABLED=0, -trimpath) and passes this on.
  # External linking needs cgo, so no -linkmode=external: Go's own linker sets
  # BIND_NOW (full RELRO) with -bindnow, and -B gobuildid gives the binaries the
  # build-id note the debug package needs.
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw '-ldflags=-B=gobuildid -bindnow'"
  cmake -B build -S "$_pkgname" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  _goenv
  # go test -race needs cgo, so only the module flags here.
  export GOFLAGS='-mod=readonly -modcacherw'
  cd "$_pkgname"
  # The upstream checks an offline package build can run (as in its RPM):
  # gofmt, go vet, go test -race, CTest (each test with a private home), the
  # Go license files and desktop-file-validate.
  tools/check.sh --package "$srcdir/build"
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd "$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGELOG.md DESIGN.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE THIRD_PARTY.md licenses/*-MIT.txt
  cp -r --no-preserve=ownership licenses/go "$pkgdir/usr/share/licenses/$pkgname/"
  find "$pkgdir/usr/share/licenses/$pkgname/go" -type d -exec chmod 755 {} + -o -type f -exec chmod 644 {} +
}
