_name=subnode
pkgname=$_name-git
pkgver=1.1.15
pkgrel=1
pkgdesc="Node app to download subtitles for you TV Shows"
arch=('i686' 'x86_64')
url="http://ocombe.github.io/subNode/"
license=('custom')
depends=('nodejs')
makedepends=('git')
install=subnode.install
source=("$pkgname::git://github.com/ocombe/subNode.git"
	'subnode-system.service'
	'subnode-server.sh')
md5sums=('SKIP'
         '447aa1f9d63923929e9cd80c28a1a6d3'
         '0cc18de20a0231827b02c62aaee2c64b')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --always | sed 's|-|.|g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    chmod u+x scripts/init.sh
}

build() {
    cd "${srcdir}/${pkgname}"
    scripts/init.sh
}

package() {
   mkdir -p "$pkgdir"/opt/subnode
   cp -r $pkgname/* "$pkgdir"/opt/subnode
   install -D -m644 subnode-system.service "$pkgdir"/usr/lib/systemd/system/subnode.service
   install -D -m744 subnode-server.sh "$pkgdir"/opt/subnode/server.sh 
}
