# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gomuks-midek-git
_name=gomuks
pkgdesc='A terminal based Matrix client written in Go. Upload and pantalaimon support'
pkgver=r586.8a7185c
pkgrel=2
url='https://git.thisisjoes.site/midov/gomuks.git'
license=(GPL3)
arch=(x86_64 i686)
depends=(libolm)
makedepends=(go-pie git)
provides=(${_name})
conflicts=("${provides[@]}")
source=("git+https://git.thisisjoes.site/midek/${_name}.git")
sha512sums=(SKIP)

prepare() {
	cd "${srcdir}/${_name}"
	# all the good stuff is in the revert_attachments branch
	git checkout midek
}
pkgver () {
	cd "${srcdir}/${_name}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build () {
	cd "${srcdir}/${_name}"
	# disable encryption so pantalaimon works
	export CGO_ENABLED=0
	go build -v \
		-gcflags "all=-trimpath=${curdir}" \
		-asmflags "all=-trimpath=${curdir}" \
		-ldflags "-extldflags '${LDFLAGS}'" \
		.
}

package () {
	cd "${srcdir}/${_name}"
	install -Dm755 gomuks "${pkgdir}/usr/bin/gomuks"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_name}/README.md"
}
