# Maintainer: Konstantin Gizdov < arch at kge dot pw >
pkgname=vale
pkgver=0.4.0
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose."
provides=('vale')
arch=('i686' 'x86_64')
url="https://github.com/ValeLint/vale"
license=('MIT')
depends=('')
makedepends=('go' 'ruby')
options=('!emptydirs')
source=("https://github.com/ValeLint/${pkgname}/archive/v${pkgver}.zip"
        'enable_local_build.patch')
sha256sums=('ebc36eda21835e1b46e09e0da9561f71870e5cfaf879bd99ffea466e15c5b48e'
            '991b817b6e82ab53e18036386350af1e9e98f475cbf797d67f69ee94c2e33e8b')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    msg2 'Patching...'
    patch -p1 -i "${srcdir}/enable_local_build.patch"
}

build() {
    cd "${srcdir}"
    msg2 'Configuring...'
    export GOPATH="${srcdir}/gopath"
    export RUBY_VER=$(ruby -e 'puts RUBY_VERSION')
    mkdir -p "${srcdir}/ruby"
    export HOME="${srcdir}/ruby"
    export GEM_HOME="${HOME}/.gem/ruby/${RUBY_VER}"
    export PATH="${srcdir}/gopath/bin:${GEM_HOME}/bin:$PATH"
    mkdir -p "${srcdir}/gopath/src/github.com/ValeLint/vale"
    rsync -az "${srcdir}/${pkgname}-${pkgver}/" "${srcdir}/gopath/src/github.com/ValeLint/vale/"
    cd "${srcdir}/gopath/src/github.com/ValeLint/vale"

    go env
    export BUNDLE_GEMFILE=$PWD/Gemfile
    export PATH="${srcdir}/bin:${PATH}"
    pip install --user docutils
    gem install asciidoctor
    make setup

    msg2 'Compiling...'
    make build
}

package() {
    # cd "${srcdir}/build"
    msg2 'Installing...'
    install -Dm755 "${srcdir}/gopath/src/github.com/ValeLint/vale/bin/vale" "${pkgdir}/usr/bin/vale"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/vale/LICENSE"
}
