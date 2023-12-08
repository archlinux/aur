# Maintainer: Étienne Deparis <etienne@depar.is>

_gemname=r18n-core
pkgname=ruby-$_gemname
pkgver=5.0.1
pkgrel=1
pkgdesc="I18n tool to translate your Ruby application"
url="https://github.com/r18n/r18n-core"
arch=("any")
license=("LGPL3")
checkdepends=("ruby-activesupport" "ruby-kramdown" "ruby-pry-byebug"
              "ruby-redcloth" "ruby-rspec" "ruby-simplecov")
depends=("ruby")
options=("!emptydirs")
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('fa7bf82c3c6e89fe1e43122ff0c115a45faf517ecb5d23eb4341f647041157af4a6f1d6d171e21ea7baa18ffc95d8d60b496139581e46a37914aa85d236640c2')

check() {
    cd ${_gemname}-${pkgver}
    sed -i 's|require spec-helper|require spec/spec-helper|' .rspec
    rspec
}

build() {
    cd ${_gemname}-${pkgver}
    gem build ${_gemname}.gemspec
}

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"

    cd ${_gemname}-${pkgver}

    gem install --ignore-dependencies --no-user-install \
        -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" \
        ${_gemname}-${pkgver}.gem

    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
