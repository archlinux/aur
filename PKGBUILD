# Maintainer: Yakov Till <yakov.till@gmail.com>

_gemname=brakeman
pkgname=ruby-$_gemname
pkgver=8.0.6
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
sha256sums=('759cc69341115e6c2dcd47b6fd8649a0b9bd540e3585ac8a0a94e31c66fee386'
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
