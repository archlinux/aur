# Maintainer: Ricardo Band <email@ricardo.band>
_pkgbase=rqlite
pkgname=rqlite-git
pkgver=6.6.0.f9e8dfc
pkgrel=1
pkgdesc="A lightweight, distributed relational database, which uses SQLite as its storage engine"
arch=(x86_64 aarch64)
url="http://www.rqlite.com/"
provides=(rqlite)
makedepends=(go)
licence=('MIT')
source=("git+https://github.com/${_pkgbase}/${_pkgbase}.git"
        "${_pkgbase}.service"
        "${_pkgbase}@.service"
        "${_pkgbase}.sysusers"
        "${_pkgbase}.tmpfiles")
sha256sums=('SKIP'
            '9c9ad1d9a625c398dffe70f730c3bcdf43f7bff6ff22c334f5aab5dc3e575367'
            'df018e53174b8c31ad57751da6b86cfaa91a1891fc5dd755d0cfc2ec65a5fa04'
            'c0132b51d5c28517545fb58ce4aa67b6e860020d662aa8317ecb6aab0264829a'
            '43c1094a6fdd04c18df738fdc85250f0cbcb87b2f8f23320f42f4ca0656f43fc')
pkgver(){
	cd ${srcdir}/${_pkgbase}
	echo $(git describe --tags | sed "s/v//").$(git log --format=%h -1)
}
check(){
	export GOPATH=${srcdir}/go
	cd ${srcdir}/${_pkgbase}
	go test -v ./...
}
build(){
	export GOPATH=${srcdir}/go
	cd ${srcdir}/${_pkgbase}
	go get ./...
	go build -i ./...
}
package() {
	cd ${srcdir}/${_pkgbase}
	mkdir -p ${pkgdir}/usr/bin
	cp ${srcdir}/go/bin/rq* ${pkgdir}/usr/bin
    	install -Dm644 "${srcdir}/${_pkgbase}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgbase}.service"
   	install -Dm644 "${srcdir}/${_pkgbase}@.service" "${pkgdir}/usr/lib/systemd/system/${_pkgbase}@.service"
    	install -Dm644 "${srcdir}/${_pkgbase}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgbase}.conf"
    	install -Dm644 "${srcdir}/${_pkgbase}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
}

