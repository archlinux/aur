# Maintainer: Tournesol <bonjour@tournesol.me>
_pkgname=mpls
pkgname=$_pkgname-git
pkgver=v0.16.0.r1.gf7945bb
pkgrel=1
pkgdesc="A markdown language server with live preview in browser"
arch=('x86_64' 'aarch64')
url="https://github.com/mhersson/mpls"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$_pkgname::git+https://github.com/mhersson/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"
	# Go package flags for hardening : https://wiki.archlinux.org/title/Go_package_guidelines#Flags_and_build_options
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	make build
}

check() {
	cd "${_pkgname}"
	make test
}

package() {
	cd "${_pkgname}"

	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
