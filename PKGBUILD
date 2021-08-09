# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>

_gemname=github-markup
pkgname=ruby-$_gemname-git
pkgver=4.0.0.r5.g4690850
pkgrel=1
pkgdesc='The code GitHub uses to render README.markup'
arch=(any)
url='https://github.com/github/markup'
license=(MIT)
depends=(ruby)
makedepends=(git ruby-rdoc)
provides=(ruby-github-markup)
conflicts=(ruby-github-markup)
options=(!emptydirs)
source=("git+https://github.com/github/markup.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_gemname#*-}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  cd $srcdir/${_gemname#*-}
  gem build $_gemname
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-${pkgver%.r*}.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-${pkgver%.r*}.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-${pkgver%.r*}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
