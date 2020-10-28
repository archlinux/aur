# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=mlogtail-git
pkgver=r44.9c23c35
pkgrel=2
pkgdesc="Mail log tailing and simple stats collecting application"
arch=('any')
url="https://github.com/aadz/mlogtail"
license=('GPL')
makedepends=('git' 'go') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('mlogtail::git+https://github.com/aadz/mlogtail.git'
	'stdin_tail.patch::https://github.com/aadz/mlogtail/commit/2c46943f928529630d4c7c1ac5e2a0e2d56dec14.patch')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 < "$srcdir/stdin_tail.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	go get -u github.com/hpcloud/tail golang.org/x/sys/unix
  	go build 
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 mlogtail "$pkgdir/usr/bin/mlogtail"
}
sha256sums=('SKIP'
            '715c763856b5aa86d9c18c360a478d2e616656a63dc6160f6c281eec24c21731')
