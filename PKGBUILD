#
# Maintainer: Rosetta Roberts <rosettafroberts at gmail>
# 

pkgname=graphite-cli-git
pkgver=0.19.2.r0.9df94d9d
pkgrel=2
pkgdesc="CLI that makes creating stacked git changes fast & intuitive"
url=https://graphite.dev/
license=('AGPL3')
arch=('any')
depends=('nodejs' 'git')
makedepends=('npm' 'yarn' 'findutils')
provides=('graphite-cli')
conflicts=('graphite-cli')
source=('git+https://github.com/withgraphite/graphite-cli' 'graphite-cli.patch')
md5sums=('SKIP'
         '2ac3a50dfce2a35dba19f355b4a308f8')

_srcname="graphite-cli"

prepare() {
    cd "$srcdir/$_srcname"
    patch --forward --strip=1 --input="$srcdir/graphite-cli.patch"
}

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

    # graphite uses the values in the SHELL and ZSH_NAME environmental variables to detect which shell it is running within
    # when generating completions
    SHELL=bash node ./dist/src/index.js completion > "$srcdir/pre-bash-graphite-completions"
    SHELL=zsh node ./dist/src/index.js completion > "$srcdir/pre-zsh-graphite-completions"

    # make it so autocompletion works for both graphite and gt on both zsh and bash
    
    sed 's/\(.\/dist\/src\/\)\{0,1\}index.js/graphite/g' "$srcdir/pre-bash-graphite-completions" > "$srcdir/bash-graphite-completions"
    sed 's/\(.\/dist\/src\/\)\{0,1\}index.js/gt/g' "$srcdir/pre-bash-graphite-completions" > "$srcdir/bash-gt-completions"
    sed 's/\(.\/dist\/src\/\)\{0,1\}index.js/graphite/g' "$srcdir/pre-zsh-graphite-completions" > "$srcdir/zsh-graphite-completions"
    sed 's/\(.\/dist\/src\/\)\{0,1\}index.js/gt/g' "$srcdir/pre-zsh-graphite-completions" > "$srcdir/zsh-gt-completions"
    
    yarn pack --filename "../graphite-cli.tgz"
}

package() {
    # npm is a lot better than yarn at installing global packages in a way that is friendly to packages.
    npm install -g --no-audit --prefix "$pkgdir/usr" "$srcdir/graphite-cli.tgz"
    install -D "$srcdir/zsh-graphite-completions" "$pkgdir/usr/share/zsh/site-functions/_graphite"
    install -D "$srcdir/zsh-gt-completions" "$pkgdir/usr/share/zsh/site-functions/_gt"
    install -D "$srcdir/bash-graphite-completions" "$pkgdir/usr/share/bash-completion/completions/graphite"
    install -D "$srcdir/bash-gt-completions" "$pkgdir/usr/share/bash-completion/completions/gt"
    chown -R root:root "$pkgdir"
}
