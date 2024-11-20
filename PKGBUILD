# Maintainer: atomicfs

pkgname=firmware-action-git
_pkgname=firmware-action
provides=('firmware-action')
conflicts=('firmware-action')
pkgver=547.3d9a259
pkgrel=2
pkgdesc="Build system for firmware images for several open source firmware solutions"
url="https://github.com/9elements/firmware-action"
arch=(any)
license=(MIT)
makedepends=(
	'git'
	'go'
	'upx'
)
depends=(
	'dagger'
	'docker'
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}/action" || return
  version=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)")
  echo "${version:1}"
}

build() {
	cd "${_pkgname}/action" || return
	go build -ldflags="-s -w" -o "${pkgname}"
	upx -9 "${pkgname}"
}

package() {
	cd "${_pkgname}/action" || return
	install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

