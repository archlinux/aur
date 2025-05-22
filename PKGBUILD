# Maintainer: someone5678 <someone5678 dot dev at google dot com>

pkgname=aidl-format-git
_pkgname=aidl-format
pkgver=20221125.r9.9b8238a
pkgrel=1
pkgdesc='A tool to formatting Android Interface Definition Language (AIDL) code'
url='https://android.googlesource.com/platform/build/soong'
arch=('any')
license=('Apache-2.0')
makedepends=('git')
provides=($_pkgname)
depends=('bash' 'clang')
DLAGENTS=("http::/usr/bin/git clone --branch android-latest-release --single-branch %u")
source=(
	'git+https://android.googlesource.com/platform/system/tools/aidl'
	'LICENSE'
)
sha256sums=(
	"SKIP"
	"cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30"
)

pkgver() {
	cd "${srcdir}/aidl"
	(
		set -o pipefail
		printf "%s.r%s.%s" \
		"$(git log -1 --date=format:%Y%m%d --format=%ad aidl-format.sh)" \
		"$(git rev-list --count HEAD aidl-format.sh)" \
		"$(git log aidl-format.sh | head -n 1 | cut -d" " -f2 | awk '{print substr($0,0,7)}')"
	)
}

build() {
	cat >"$srcdir/${_pkgname}" <<EOF
#!/usr/bin/env bash

/usr/bin/${_pkgname}.sh \$@
EOF
}

package() {
	install -Dm755 "$srcdir/aidl/${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}.sh"
	install -Dm755 "$srcdir/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
