# Maintainer: Konstantin Gizdov < arch at kge dot pw >
pkgname=vale
pkgver=0.10.1
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose."
provides=('vale')
arch=('i686' 'x86_64')
url="https://github.com/ValeLint/vale"
license=('MIT')
depends=('')
makedepends=('go' 'ruby' 'python-docutils')
options=('!emptydirs')
source=("https://github.com/ValeLint/${pkgname}/archive/${pkgver}.zip"
        'enable_local_build.patch')
sha256sums=('8210ecea53c6715a3022dcb723f626f467072b8f7062fa9bb6d29a486278b6c8'
            '69f1efbd1f638cd601a0f5583b85a052aa5bbb6433a9d4a24dba11b29f703422')

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
    export GEM_HOME_OLD="${HOME}/.gem/ruby/2.5.0"
    export PATH="${srcdir}/gopath/bin:${GEM_HOME}/bin:${GEM_HOME_OLD}/bin:$PATH"
    mkdir -p "${srcdir}/gopath/src/github.com/ValeLint/vale"
    rsync -az "${srcdir}/${pkgname}-${pkgver}/" "${srcdir}/gopath/src/github.com/ValeLint/vale/"
    cd "${srcdir}/gopath/src/github.com/ValeLint/vale"

    go env
    export BUNDLE_GEMFILE=$PWD/Gemfile
    export PATH="${srcdir}/bin:${PATH}"
    gem install --no-rdoc --no-ri asciidoctor
    make setup

    msg2 'Compiling...'
    make build
}

package() {
    # cd "${srcdir}/build"
    msg2 'Installing...'
    install -Dm755 "${srcdir}/gopath/src/github.com/ValeLint/vale/bin/vale" "${pkgdir}/usr/bin/vale"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/vale/LICENSE"
    install -d "${pkgdir}/usr/share/vale/styles"
    cp -r "${srcdir}/gopath/src/github.com/ValeLint/vale/styles"/* "${pkgdir}/usr/share/vale/styles/"
    chmod -R 644 "${pkgdir}/usr/share/vale/styles"/*
    find "${pkgdir}/usr/share/vale/styles" -type d -exec chmod 755 {} \;
}
