# Maintainer: michaelkuc6 <michaelkuc6 at gmail dot com>
_pkgname=workerd
pkgname="${_pkgname}-git"
pkgver=r63.8eb4d11
pkgrel=1
pkgdesc="A JavaScript / Wasm server runtime based on the same code that powers Cloudflare Workers."
arch=('x86_64')
url="https://github.com/cloudflare/workerd"
license=('apache')
depends=()
makedepends=('bazel>=5.3.0' 'clang>=11' 'libc++>=11')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/cloudflare/workerd.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "${srcdir}/${_pkgname}"
	# Rely on system package manager to mediate Bazel versions.
	rm .bazelversion
	bazel build -c opt //src/workerd/server:workerd
}

package() {
	cd "$srcdir/${_pkgname}"
	install -m755 -D "bazel-bin/src/workerd/server/workerd" "${pkgdir}/usr/bin/workerd"
	install -m644 -D "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
