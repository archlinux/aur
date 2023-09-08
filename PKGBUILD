# Maintainer: Mark Weiman <mark dot weiman at markzz dot com>

_gemname=fpm
pkgname=$_gemname
pkgver=1.15.1
pkgrel=2
pkgdesc='Effing package management! Build packages for multiple platforms (deb, rpm, etc) with great ease and sanity.'
arch=(any)
url="https://github.com/jordansissel/${_gemname}"
license=('MIT')
depends=(ruby
         ruby-cabin
         ruby-backports
         ruby-arr-pm
         ruby-clamp
         ruby-rexml
         ruby-pleaserun
         ruby-stud)
optdepends=('squashfs-tools: Support for snaps')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jordansissel/fpm/archive/v${pkgver}.tar.gz")
sha256sums=('7de3512d17dc5b6229993813e3036489129cc7b9ebc35b3e5e7fe10cdb2051de')

build() {
  cd $srcdir/$_gemname-$pkgver
  sed -i 's/"clamp", "~> 1.0.0"/"clamp", ">= 1.0.0"/' fpm.gemspec
  make gem
}

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $srcdir/$_gemname-$pkgver/$_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
