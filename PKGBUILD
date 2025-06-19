# Maintainer: haakuya <haakuya at noreply dot github dot com>
_name=mihomo
pkgname=$_name-alpha-git
pkgver=r3340.c60750d
pkgrel=1
pkgdesc="Mihomo Kernel by MetaCubeX, formerly known as Clash.Meta"
arch=("x86_64" 'aarch64')
url="https://github.com/MetaCubeX/mihomo"
license=("MIT")
depends=('glibc')
makedepends=('go' 'git')
provides=('mihomo-alpha')
backup=("etc/${_name}-alpha/config.yaml")
install="${_name}-alpha.install"
source=("git+https://github.com/MetaCubeX/mihomo.git#branch=Alpha" "${_name}-alpha.service")
sha256sums=('SKIP' 'b1d3f6a50cc3e0c6d56e2a778cb966d415de7f48a3d9ccad73aa9aa8009d243c')

pkgver() {
	cd "$_name"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/$_name"
	BUILDTIME=$(date -u)
	GOOS=linux go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\" \
    -X \"github.com/metacubex/mihomo/constant.Version=alpha.$(git log -1 --format="%cd" --date=short | sed s/-//g).${pkgver}\" \
    -X \"github.com/metacubex/mihomo/constant.BuildTime=${BUILDTIME}\" \
    " \
		-tags with_gvisor -o ${_name}-${pkgver}
}

package() {
	cd "${srcdir}/$_name"
	install -Dm755 "${_name}-${pkgver}" "${pkgdir}/usr/bin/${_name}-alpha"
	install -Dm644 "docs/config.yaml" -t "${pkgdir}/etc/${_name}-alpha"
	install -Dm644 "${srcdir}/${_name}-alpha.service" -t "${pkgdir}/usr/lib/systemd/system"
}
