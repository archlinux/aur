# Maintainer: Paul <pb.orzel@proton.me>

_pkgname="gitwife"
pkgname="gitwife-git"
pkgver=0.2.0.r0.ge9dadc2
pkgrel=1
pkgdesc="Tool to manage your installations from Git Repositories for you"
arch=(any)
url="https://gitlab.com/Teddy-Kun/gitwife"
license=('GPL-3')
depends=(
'libgit2'
'openssl'
'gcc-libs'
'glibc'
)
makedepends=(
'cargo'
)
optdepends=(
'bash: the default_make is a bash script'
'nano: default editor for the makefiles'
)
source=("git+https://gitlab.com/Teddy-Kun/gitwife.git/")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "$srcdir/$_pkgname"
	cargo b --release
}

package() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p "${pkgdir}/usr/share/gitwife"
	mkdir -p "${pkgdir}/usr/share/licenses/gitwife"
	install -Dm755 target/release/gitwife -t "${pkgdir}/usr/bin/"
	install -Dm755 resources/default_make.gitwife -t "${pkgdir}/usr/share/gitwife/"
	install -Dm644 License.txt -t "${pkgdir}/usr/share/licenses/gitwife/"
}
