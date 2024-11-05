# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=fronde
pkgver=0.6.1
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
sha512sums=('0f68c03adf1225c69d280c8e0b0441f0a0d57e5b938da2f4d4827ee348be67b4023b7ba05c39f0db13957a55df1ea03e5f5689cd1293210f82fe10d65ebf3d9d')

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
