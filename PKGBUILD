# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=fronde
pkgver=0.6.0
pkgrel=1
pkgdesc="An opinionated static website generator for Emacs Org mode"
url="https://etienne.depar.is/fronde"
arch=("any")
license=("custom:WTFPL")
checkdepends=("ruby-rspec" "ruby-simplecov")
depends=("emacs" "ruby>=3.3.0" "ruby<3.4.0" "ruby-i18n" "ruby-liquid"
         "ruby-nokogiri>=1.15" "ruby-rainbow" "ruby-rake" "ruby-webrick")
options=("!emptydirs")
source=("https://git.umaneti.net/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ddd04bf0ca9c3b2d436de5fe1af79e74704c8cf7dad1c5efcbd751b23db6a107f9b913fdb74fe97108642efb95ffd58dd708ab158f3f0d0f8b44b15e58a6884f')

prepare() {
    cd ${pkgname}-${pkgver}
    sed -i "s|~>|>=|g" ${pkgname}.gemspec
}

build() {
    cd ${pkgname}-${pkgver}
    gem build ${pkgname}.gemspec

    cat <<EOF > Rakefile
ENV['LANG'] = 'en_US.UTF-8'
require_relative './lib/fronde/config'
Dir.glob('./lib/tasks/*.rake').each { |r| import r }
EOF
    rake cli:zsh_complete > _fronde
    rake cli:fish_complete > fronde.fish
}

check() {
    cd ${pkgname}-${pkgver}
    # The following fix encoding errors when rspec is run inside a docker
    # container, which default LANG is just C (what make ruby defaults to
    # US-ASCII)
    sed -i "2i Encoding.default_external = 'UTF-8'" spec/requirements.rb
    rspec
}

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"

    cd ${pkgname}-${pkgver}
    gem install --ignore-dependencies --no-user-install --no-document \
        -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" \
        ${pkgname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"

    install -Dm 644 README.org -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 DOCUMENTATION.org -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    install -Dm 644 _fronde -t "${pkgdir}/usr/share/zsh/site-functions"
    install -Dm 644 fronde.fish -t "${pkgdir}/usr/share/fish/completions"
}
