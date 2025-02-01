# Maintainer: Shengyu Zhang <la@archlinuxcn.org>
# Co-Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Co-Maintainer: Bert Peters <bert+aur@bertptrs.nl>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=jekyll
pkgname=$_gemname
pkgver=4.4.1
pkgrel=1
pkgdesc='A simple, blog aware, static site generator.'
arch=('any')
url='https://github.com/jekyll/jekyll'
license=('MIT')
depends=('ruby>=2.1.0'
    'ruby-addressable>=2.4'
    'ruby-colorator>=1.0'
    'ruby-jekyll-sass-converter>=2.0'
    'ruby-jekyll-watch>=2.0'
    'ruby-kramdown>=2.1.0'
    'ruby-liquid-4'
    'ruby-mercenary>=0.3.3'
    'ruby-pathutil>=0.9'
    'ruby-rouge>1.7'
    'ruby-safe_yaml>=1.0'
    'ruby-i18n>=1'
    'ruby-em-websocket>=0.5'
    'ruby-kramdown-parser-gfm'
    'ruby-terminal-table'
    'ruby-webrick'
    )
optdepends=(
    'ruby-minima: Default theme for Jekyll'
    'ruby-jekyll-paginate'
    'ruby-jekyll-gist'
    'ruby-jekyll-feed'
    )
provides=("$pkgname=$pkgver" "ruby-jekyll")
conflicts=('ruby-jekyll')
replaces=('ruby-jekyll')
options=(!emptydirs)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/jekyll/jekyll/archive/v${pkgver}.tar.gz
        dependencies.patch)
sha256sums=('face80f211ffc55c87a99dd540f605208ea8b4c26fe505ed263cd2f81cd22d2d'
            'c7653891b15524a83c3cbabc4c9027f28a0e164e486d513e70540e1eab453a01')

prepare() {
  cd ${_gemname}-${pkgver}
  patch -p1 -i  ../dependencies.patch
}

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
