# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
pkgname=huaweicloud-obs-obsutil-git
pkgver=v5.1.15.r2.45ac956
pkgrel=1
pkgdesc="A command line tool for accessing and managing OBS on HUAWEI CLOUD"
arch=('x86_64' 'aarch64')
url="https://support.huaweicloud.com/intl/en-us/utiltg-obs/obs_11_0001.html"
license=('Apache')
makedepends=('go' 'git')
conflicts=("huaweicloud-obs-obsutil-bin")
source=('git+https://github.com/huaweicloud/huaweicloud-obs-obsutil.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}/src/obsutil"
	export GOPATH="$srcdir"/${pkgname%-git}
	export CGO_ENABLED=0
	export GO111MODULE=off
	go build -v -buildmode=pie -trimpath \
		-ldflags "-s -w -X main.CloudType=dt" \
		-o obsutil .
}

# $namcap huaweicloud-obs-obsutil-git-v5.1.15.r2.45ac956-1-x86_64.pkg.tar.zst
# huaweicloud-obs-obsutil-git W: ELF file ('usr/bin/obsutil') lacks FULL RELRO, check LDFLAGS.
#
# currently unresolved.

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "$srcdir/${pkgname%-git}"/src/obsutil/obsutil -t "$pkgdir"/usr/bin/
}
