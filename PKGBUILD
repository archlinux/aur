# Maintainer: Josep Mengual <josep at truita dot es>

pkgname=newleaf
_repo=NewLeaf
pkgdesc="A YouTube data extractor, compatible with the Invidious API."
pkgver=r119.714f103
pkgrel=2
arch=('x86_64')
url="https://sr.ht/~cadence/tube/"
license=('AGPL3')
makedepends=(git)
depends=(python python-cherrypy yt-dlp python-cachetools python-dateutil python-requests)
provides=('newleaf')
conflicts=('newleaf')
source=("git+https://git.sr.ht/~cadence/$_repo"
	'newleaf'
	'newleaf.conf'
	'newleaf.service'
	'newleaf.socket'
)
sha256sums=('SKIP'
            '0d36db5aa76a2ba406a3e68c52739af4bd2931fa1842c9455a89dbda9df22b8e'
            'f43ba9354ac49b9847daa2bbc7cffca0b3a8c381e3b34a0c48f8936a072465df'
            'e8d49375fe484781df9b06fc6c00641200b2589c34c3dd9a72ad6c263ed21520'
            '2fe8f20bec277f81efcf4c62f18bbf4ccf0109663910819acad5bbff8ee0cf5c'
)
install=post.install

pkgver() {
    cd "$_repo"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_repo"
    rm LICENSE requirements.txt README.md Dockerfile
    mv configuration.sample.py configuration.py
}

package() {
    install -Dm755 newleaf "$pkgdir/usr/bin/newleaf"
    install -Dm644 newleaf.conf "$pkgdir/usr/lib/sysusers.d/newleaf.conf"
    install -Dm644 newleaf.{service,socket} -t "$pkgdir/usr/lib/systemd/system"
    cd "$_repo"
    mkdir -p "$pkgdir/opt/newleaf"
    cp -r * "$pkgdir/opt/newleaf"
}
