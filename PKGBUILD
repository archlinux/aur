# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=casile-git
pkgver=0.5.0.r0.g19b2722
pkgrel=1
pkgdesc='Caleb’s SILE publishing toolkit'
arch=('any')
url="https://github.com/sile-typesetter/${pkgname%-git}"
license=('AGPL3')
depends=('bc'
         'bcprov' # pdftk optdepend is required
         'entr'
         'epubcheck'
         'ghostscript'
         'git'
         'imagemagick'
         'inetutils'
         'inkscape'
         'java-commons-lang' # pdftk optdepend is required
         'jq'
         'kindlegen'
         'lua'
         'm4'
         'make'
         'moreutils'
         'nodejs'
         'otf-libertinus'
         'pandoc-sile-git'
         'perl'
         'pcre'
         'pdftk'
         'podofo'
         'poppler'
         'povray'
         'python'
         'sile'
         'sqlite'
         'tex-gyre-fonts'
         'texlive-core'
         'ttf-hack'
         'yq'
         'zint'
         'zsh')
_lua_deps=('colors'
           'filesystem'
           'yaml')
_perl_deps=('yaml'
            'yaml-merge-simple')
_python_deps=('isbnlib'
              'pandocfilters'
              'pantable'
              'ruamel-yaml'
              'usfm2osis-cw-git')
depends+=("${_lua_deps[@]/#/lua-}"
          "${_perl_deps[@]/#/perl-}"
          "${_python_deps[@]/#/python-}")
makedepends=('autoconf-archive' 'cargo' 'luarocks' 'node-prune' 'rust' 'yarn')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --abbrev=7 --tags --match="v*" |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    export YARN_CACHE_FOLDER="$srcdir/node_modules"
    sed Makefile.am -i \
        -e "/^licensedir = /s#.(_casile)\$#$pkgname#" \
        -e 's/yarn \(install\|run\)/yarn --offline \1/' \
        -e 's/cargo \(build\|install\|test\)/cargo --offline \1/'
    ./bootstrap.sh
    cargo fetch --locked
    yarn install --production --frozen-lockfile
}

build() {
    cd "$pkgname"
    export YARN_CACHE_FOLDER="$srcdir/node_modules"
    ./configure --prefix "/usr"
    make
}

check() {
    cd "$pkgname"
    make check
}

package () {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
	node-prune "$pkgdir/usr/share/casile/node_modules"
}
