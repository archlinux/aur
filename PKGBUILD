#
# Maintainer: Rosetta Roberts <rosettafroberts at gmail>
# 

pkgname=graphite-cli-git
pkgver=0.16.2.r5.c369394
pkgrel=1
pkgdesc="CLI that makes creating stacked git changes fast & intuitive"
url=https://graphite.dev/
license=('unknown')
arch=('any')
depends=('nodejs' 'git')
makedepends=('npm')
provides=('graphite-cli')
conflicts=('graphite-cli')
source=('git+https://github.com/screenplaydev/graphite-cli')
md5sums=('SKIP')

_srcname="graphite-cli"

pkgver() {
    cd "$srcdir/$_srcname"
    VERSION=`node -p "require('./package.json').version"`
    echo "$VERSION".r`git rev-list --count "v$VERSION^.."`.`git rev-parse --short HEAD`
}

build() {
    cd "$srcdir/$_srcname"
    npm install --cache "$srcdir/npm-cache"
    npm run build
    cd ..
    TAR=`npm pack --cache "$srcdir/npm-cache" "$_srcname"`
    mv "$TAR" "graphite-cli.tgz"
}

package() {
    npm install -g --prefix "$pkgdir/usr" "$srcdir/graphite-cli.tgz" 
    chown -R root:root "$pkgdir"
    # remove man not relevant man pages 
    rm -r "$pkgdir/usr/lib/node_modules/graphite-cli/node_modules/sshpk/man"
}
