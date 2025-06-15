# Maintainer: Leo <douglarek at gmail dot com>

_name=mihomo
pkgname=$_name-git
pkgver=alpha.20250614.3340.c60750d5
pkgrel=1
pkgdesc="Mihomo Kernel by MetaCubeX, formerly known as Clash.Meta"
arch=("x86_64" 'aarch64')
url="https://github.com/MetaCubeX/mihomo"
license=("MIT")
depends=('glibc')
makedepends=('go' 'git')
conflicts=('mihomo')
provides=('mihomo')
backup=('etc/mihomo/config.yaml')
install="${_name}.install"
source=("git+https://github.com/MetaCubeX/mihomo.git#branch=Alpha" "${_name}.service")
sha256sums=('SKIP' '483e00f0c60b163662c76db3aba7e1fa61a1235a38c68f4fb69c5bad81f1a46f')

pkgver() {
    cd "$_name"
    printf "alpha.%s.%s.%s" "$(git log -1 --format="%cd" --date=short | sed s/-//g)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
    cd "${srcdir}/$_name"
    BUILDTIME=$(date -u)
    GOOS=linux go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" \
    -X \"github.com/metacubex/mihomo/constant.Version=${pkgver}\" \
    -X \"github.com/metacubex/mihomo/constant.BuildTime=${BUILDTIME}\" \
    " \
    -tags with_gvisor -o ${_name}-${pkgver}
}

package() {
    cd "${srcdir}/$_name"
    install -Dm755 "${_name}-${pkgver}" "${pkgdir}/usr/bin/${_name}"
    install -Dm644 "docs/config.yaml" -t "${pkgdir}/etc/${_name}"
    install -Dm644 "${srcdir}/${_name}.service" -t "${pkgdir}/usr/lib/systemd/system"
}
