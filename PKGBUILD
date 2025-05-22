# Maintainer: someone5678 <someone5678 dot dev at google dot com>

pkgname=bpfix-git
_pkgname=bpfix
pkgver=20240617.r63.ba48366
pkgrel=1
pkgdesc='A tool for fixing AOSP soong blueprint build files'
url='https://android.googlesource.com/platform/build/soong'
arch=('any')
license=('Apache-2.0')
makedepends=('git' 'go')
provides=($_pkgname)
DLAGENTS=("http::/usr/bin/git clone --branch android-latest-release --single-branch %u")
source=(
	'git+https://android.googlesource.com/platform/build/blueprint'
	'git+https://android.googlesource.com/platform/build/soong'
	'git+https://android.googlesource.com/platform/external/go-cmp'
	'git+https://android.googlesource.com/platform/external/golang-protobuf'
	'git+https://android.googlesource.com/platform/external/starlark-go'
	'LICENSE'
)
sha256sums=(
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30"
)

prepare() {
	rm -rf "$srcdir/build" "$srcdir/external"
	mkdir -p "$srcdir/build" "$srcdir/external"
	mv "$srcdir/soong" "$srcdir/build/"
	mv "$srcdir/blueprint" "$srcdir/build/"
	mv "$srcdir/go-cmp" "$srcdir/external/"
	mv "$srcdir/golang-protobuf" "$srcdir/external/"
	mv "$srcdir/starlark-go" "$srcdir/external/"
}

pkgver() {
	cd "${srcdir}/build/soong"
	(
		set -o pipefail
		printf "%s.r%s.%s" \
		"$(git log -1 --date=format:%Y%m%d --format=%ad bpfix)" \
		"$(git rev-list --count HEAD bpfix)" \
		"$(git log bpfix | head -n 1 | cut -d" " -f2 | awk '{print substr($0,0,7)}')"
	)
}

build() {
  cd "$srcdir/build/soong/$_pkgname/cmd"
  go build -o $_pkgname
}

package() {
  install -Dm755 "$srcdir/build/soong/$_pkgname/cmd/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
