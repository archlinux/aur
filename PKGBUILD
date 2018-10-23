# Maintainer: Konstantin Gizdov < arch at kge dot pw >
pkgname=vale
pkgver=1.0.6
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose."
provides=('vale')
arch=('i686' 'x86_64')
url="https://github.com/errata-ai/vale"
license=('MIT')
makedepends=('go' 'ruby' 'python-docutils')
options=('!emptydirs')
source=("https://github.com/errata-ai/${pkgname}/archive/v${pkgver}.zip"
        'enable_local_build.patch')
sha256sums=('5fb8ceaa69653f902e5c04b38d0c199a1a853364d62075264e75e591df6c7a48'
            '0761d16f111f793d7388da7bb88fa59daa8ac5a51b2b737ad065226f51beec4b')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i "${srcdir}/enable_local_build.patch"
}

build() {
    cd "${srcdir}"
    export GOPATH="${srcdir}/gopath"
    export RUBY_VER=$(ruby -e 'puts RUBY_VERSION')
    mkdir -p "${srcdir}/ruby"
    export HOME="${srcdir}/ruby"
    export GEM_HOME="${HOME}/.gem/ruby/${RUBY_VER}"
    export GEM_HOME_OLD="${HOME}/.gem/ruby/2.5.0"  # for some reason is wants 2.5.0 too
    export PATH="${srcdir}/gopath/bin:${GEM_HOME}/bin:${GEM_HOME_OLD}/bin:$PATH"
    mkdir -p "${srcdir}/gopath/src/github.com/errata-ai/vale"
    rsync -az "${srcdir}/${pkgname}-${pkgver}/" "${srcdir}/gopath/src/github.com/errata-ai/vale/"
    cd "${srcdir}/gopath/src/github.com/errata-ai/vale"

    go env
    export BUNDLE_GEMFILE=$PWD/Gemfile
    export PATH="${srcdir}/bin:${PATH}"
    gem install --no-rdoc --no-ri asciidoctor
    make setup

    make build
}

package() {
    # cd "${srcdir}/build"
    install -Dm755 "${srcdir}/gopath/src/github.com/errata-ai/vale/bin/vale" "${pkgdir}/usr/bin/vale"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/vale/LICENSE"
    install -d "${pkgdir}/usr/share/vale/styles"
    cp -r "${srcdir}/gopath/src/github.com/errata-ai/vale/styles"/* "${pkgdir}/usr/share/vale/styles/"
    chmod -R 644 "${pkgdir}/usr/share/vale/styles"/*
    find "${pkgdir}/usr/share/vale/styles" -type d -exec chmod 755 {} \;
}
