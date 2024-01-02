# Maintainer: fossdd <fossdd@pwned.life>
pkgname=granex-git
_pkgname=${pkgname%-git}
pkgver=r1.c16d188
pkgrel=1
pkgdesc="Vanity address generator for TOR onion v3 (ed25519) "
url='https://github.com/dotcypress/granex'
license=(Apache-2.0)
arch=(x86_64)
depends=()
makedepends=(rust git)
conflicts=()
provides=(granex)
source=(
	'Remove-feature-due-to-error-on-stable-release-channe.patch'
	'git+https://github.com/dotcypress/granex'
)
sha256sums=(
	'954bd50440d5507b710d223b69162dff1fc5ec546ae4c36708a13ca432716420'
	'SKIP'
)

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  patch --directory="$_pkgname" --forward --strip=1 --input="${srcdir}/Remove-feature-due-to-error-on-stable-release-channe.patch"
}

build() {
  cd "$_pkgname"
  cargo build --release
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
