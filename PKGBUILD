# Maintainer: Yakov Till <yakov.till@gmail.com>

_gemname=brakeman
pkgname=ruby-$_gemname
pkgver=8.1.0
pkgrel=1
pkgdesc="Static analysis security vulnerability scanner for Ruby on Rails applications (non-commercial use license)"
arch=('any')
url="https://brakemanscanner.org/"
license=('LicenseRef-Brakeman-Public-Use-License')
depends=('ruby' 'ruby-racc')
options=('!emptydirs' '!debug')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
        "LICENSE.md::https://raw.githubusercontent.com/presidentbeef/brakeman/v${pkgver}/LICENSE.md")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('cfa9e5214e4925842f4bc849a64f8a7e6c5d0425fe98eac8d7b7bc60fdc17e07'
            '2b0196c05fef771ab071d34b346f9fa625a5faceed3ef4a541fe8f7c8af42c64')

latestver() {
    curl -fsSL "https://rubygems.org/api/v1/gems/${_gemname}.json" | jq -r '.version'
}

_package_gem() {
    local _gemdir="$(ruby -e 'puts Gem.default_dir')"
    gem install \
        --no-user-install \
        --ignore-dependencies \
        --no-document \
        --install-dir "$pkgdir/$_gemdir" \
        --bindir "$pkgdir/usr/bin" \
        "$srcdir/${_gemname}-${pkgver}.gem"
    rm "$pkgdir/$_gemdir/cache/${_gemname}-${pkgver}.gem"
}

package() {
    _package_gem
    install -Dm644 "$srcdir/LICENSE.md" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
