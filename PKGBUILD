# Maintainer: <gaelic>
# Maintainer: Anatoly Bashmakov anatoly at posteo dot net

_gemname=asciidoctor-pdf
pkgname=asciidoctor-pdf
pkgver=1.5.4
pkgrel=2
pkgdesc='translate asciidoctor directly to pdf'
arch=(any)
url='https://asciidoctor.org/'
license=(MIT)
depends=(asciidoctor
         ruby-concurrent
         ruby-prawn
         'ruby-ttfunk>=1.7.0'
         'ruby-prawn-icon<3'
         ruby-prawn-svg
         ruby-prawn-table
         ruby-prawn-templates
         ruby-safe_yaml
         ruby-thread_safe
         ruby-treetop)
optdepends=('ruby-rouge: syntax highlight'
            'ruby-coderay: syntax highlight')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('c7a8998e905770628829972320017415174e69dea29fd0717e08e49d69b2104d')
package() {
    local _gemdir="$(ruby -e 'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install --verbose \
        -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" \
        "$pkgname-$pkgver.gem"

    # Force the package depends on prawn>=2.2.0 instead of prawn~>2.2.0
    sed "/<prawn>/s/~>/>=/" -i $pkgdir/$_gemdir/specifications/$_gemname-$pkgver.gemspec

    # Force the package depends on ttfunk>=1.5.1 instead of prawn~>1.5.0
    sed "/<ttfunk>/s/~>/>=/" -i $pkgdir/$_gemdir/specifications/$_gemname-$pkgver.gemspec

    rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}
