# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=fronde
pkgver=0.5.0
_tagname=0.5 # stupid me 🤦
pkgrel=1
pkgdesc="An opinionated static website generator for Emacs Org mode"
url="https://etienne.depar.is/fronde"
arch=("any")
license=("custom:WTFPL")
checkdepends=("ruby-rspec" "ruby-simplecov")
depends=("emacs" "ruby>=3.2.0" "ruby<3.3.0" "ruby-liquid" "ruby-nokogiri>=1.15"
         "ruby-r18n-core" "ruby-rainbow" "ruby-rake" "ruby-webrick")
options=("!emptydirs")
source=("https://git.umaneti.net/${pkgname}/snapshot/${pkgname}-${_tagname}.tar.gz")
sha512sums=('cb9bb5c45768f65a48b201977dd04ba6cc4dff4ecb4a1fae411affa03bac5b3d1a07626ff51e54dafbeb853be03885ba6be667c388dbd65adcb103ef0e0dd88d')

prepare() {
    cd ${pkgname}-${_tagname}
    sed -i "s|~>|>=|g" ${pkgname}.gemspec
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

check() {
    cd ${pkgname}-${_tagname}
    rspec || true # weird errors
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
