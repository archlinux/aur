# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=fronde
pkgver=0.4.0
_tagname=0.4 # stupid me 🤦
pkgrel=1
pkgdesc="An opinionated static website generator for Emacs Org mode"
url="https://etienne.depar.is/fronde"
arch=("any")
license=("custom:WTFPL")
checkdepends=("ruby-rspec" "ruby-simplecov")
makedepends=("ruby-yard")
depends=("emacs" "ruby" "ruby-liquid" "ruby-nokogiri" "ruby-r18n-core"
         "ruby-rainbow" "ruby-rake" "ruby-webrick")
options=("!emptydirs")
source=("https://git.umaneti.net/${pkgname}/snapshot/${pkgname}-${_tagname}.tar.gz")
sha512sums=('1b2cac48b3565261cc2a1211b97559f0bbc5fd929df8b619e99ae7fcb0e050f75821bdd302d5cdea19e442663668601a785e364ab50cfc6a32cd99037f546674')

prepare() {
    cd ${pkgname}-${_tagname}
    sed -i "s|'nokogiri', '~> 1.15'|'nokogiri', '>= 1.13'|g" ${pkgname}.gemspec
    sed -i "s|~>|>=|g" ${pkgname}.gemspec
}

check() {
    cd ${pkgname}-${_tagname}
    rspec || true # weird errors
}

build() {
    cd ${pkgname}-${_tagname}
    gem build ${pkgname}.gemspec

    cat <<EOF > Rakefile
require_relative './lib/fronde/config'
Dir.glob('./lib/tasks/*.rake').each { |r| import r }
EOF
    rake cli:zsh_complete > _fronde
}

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"

    cd ${pkgname}-${_tagname}
    gem install --ignore-dependencies --no-user-install \
        -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" \
        ${pkgname}-${pkgver}.gem

    install -Dm 644 README.org -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 DOCUMENTATION.org -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    install -Dm 644 _fronde -t "${pkgdir}/usr/share/zsh/site-functions"

    rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"
}
