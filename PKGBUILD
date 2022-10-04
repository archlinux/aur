# Maintainer: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>
pkgname=cow-proxy-git
pkgver=1059.41c0fb1
pkgrel=1
pkgdesc="HTTP proxy written in Go. COW can automatically identify blocked sites and use parent proxies to access"
arch=('i686' 'x86_64' 'armv5tel' 'armv6l' 'armv71')
url="https://github.com/cyfdecyf/cow"
license=('custom')
depends=()
makedepends=('go' 'mercurial' 'git')
source=('cow@.service'
        'cow_user.service'
	'git+https://github.com/cyfdecyf/cow.git')

sha1sums=('3efa6f55e51bed4043ac7a5804469bdd38032359'
          'ee250fdebc73255effd6219d0d8089990c9c73bd'
	  'SKIP')

conflicts=(cow-proxy)

_gitname=cow
install=$pkgname.install

pkgver() {
        cd "${srcdir}/${_gitname}"
        echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p ${srcdir}/src/github.com/cyfdecyf/cow
        cd "${srcdir}/${_gitname}"
	git --work-tree=${srcdir}/src/github.com/cyfdecyf/cow checkout -f develop
	cd ${srcdir}/src/github.com/cyfdecyf/cow
	GO111MODULE=off GOPATH=${srcdir} go get -v
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/bin/cow $pkgdir/usr/bin/cow
  install -Dm644 cow@.service ${pkgdir}/usr/lib/systemd/system/cow@.service
  install -Dm644 cow_user.service ${pkgdir}/usr/lib/systemd/user/cow.service
}
