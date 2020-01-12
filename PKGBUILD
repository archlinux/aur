# Maintainer: robertfoster

pkgname=peerflix-server
pkgver=0.5.1
pkgrel=1
pkgdesc="Streaming torrent client for node.js with web ui"
arch=('i686' 'x86_64')
url="https://github.com/asapach/peerflix-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=($pkgname.service
	$pkgname.sh
	peerflix.sysusers
	peerflix.tmpfiles
)
conflicts=('peerflix-server-git')
options=('!strip')

package(){
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --user root --prefix "$pkgdir/usr" --production $pkgname@$pkgver

    install -Dm644 "${srcdir}/$pkgname.service" "${pkgdir}/usr/lib/systemd/system/$pkgname.service"
    install -D -m644 "${srcdir}/peerflix.sysusers" "${pkgdir}/usr/lib/sysusers.d/peerflix.conf"
    install -D -m644 "${srcdir}/peerflix.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/peerflix.conf"
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    install -Dm775 "${srcdir}/peerflix-server.sh" "${pkgdir}/usr/bin/peerflix-server"
    pathtoreplace=`echo $pkgdir | sed 's:/:\\\/:g'`
    find $pkgdir -type f -name "*.json" -exec sed -i "s/$pathtoreplace//g" {} +;
}

md5sums=('db2b8fff218d2154a4086fe95a82bacc'
         'ea9702820f92bef0636a4f01d13dd348'
         'baf787b4e3fea8c0ee16736a998cd776'
         '3d88f37f81f89b39e071d7cd06fcf22a')
