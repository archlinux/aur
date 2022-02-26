#
# Maintainer: Rosetta Roberts <rosettafroberts at gmail>
# 

pkgname=graphite-cli-git
pkgver=0.17.3.r0.cb07ae93
pkgrel=1
pkgdesc="CLI that makes creating stacked git changes fast & intuitive"
url=https://graphite.dev/
license=('AGPL3')
arch=('any')
depends=('nodejs' 'git')
makedepends=('npm' 'yarn' 'findutils')
provides=('graphite-cli')
conflicts=('graphite-cli')
source=('git+https://github.com/withgraphite/graphite-cli')
md5sums=('SKIP')

_srcname="graphite-cli"

pkgver() {
    cd "$srcdir/$_srcname"
    VERSION=`node -p "require('./package.json').version"`
    echo "$VERSION".r`git rev-list --count "v$VERSION^.."`.`git rev-parse --short HEAD`
}

build() {
    cd "$srcdir/$_srcname"
    export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
    yarn install --immutable
    yarn run build
    rm -r dist/scripts
    rm -r dist/test
    find dist -type f \( -name '*.map' -o -name '*.d.ts' \) -delete
    # completions must be ran inside of a git repository. its own will suffice.
    node ./dist/src/index.js completion > "$srcdir/pre-graphite-completions"
    # make it so autocompletion works for both graphite and gt
    sed 's/\(.\/dist\/src\/\)\{0,1\}index.js/graphite/g' "$srcdir/pre-graphite-completions" > "$srcdir/graphite-completions"
    sed 's/\(.\/dist\/src\/\)\{0,1\}index.js/gt/g' "$srcdir/pre-graphite-completions" > "$srcdir/gt-completions"
    yarn pack --filename "../graphite-cli.tgz"
}

package() {
    # npm is a lot better than yarn at installing global packages in a way that is friendly to packages.
    npm install -g --no-audit --prefix "$pkgdir/usr" "$srcdir/graphite-cli.tgz"
    install -D "$srcdir/graphite-completions" "$pkgdir/usr/share/zsh/site-functions/_graphite"
    install -D "$srcdir/gt-completions" "$pkgdir/usr/share/zsh/site-functions/_gt"
    chown -R root:root "$pkgdir"
}
