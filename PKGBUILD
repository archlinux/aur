# Maintainer: Mark Weiman <mark dot weiman at markzz dot com>

_gemname=fpm
pkgname=$_gemname
pkgver=1.8.1
pkgrel=1
pkgdesc='Effing package management! Build packages for multiple platforms (deb, rpm, etc) with great ease and sanity.'
arch=(any)
url="https://github.com/jordansissel/${_gemname}"
license=('MIT')
depends=(ruby ruby-cabin ruby-backports ruby-arr-pm ruby-clamp
         ruby-childprocess ruby-json-1 ruby-ffi
         ruby-archive-tar-minitar ruby-xz ruby-pleaserun
         ruby-rspec ruby-insist ruby-pry ruby-stud)
options=(!emptydirs)
source=("https://github.com/jordansissel/fpm/archive/v${pkgver}.tar.gz")
sha256sums=('1f124bc9def791006b08be17fcaee7dc44288ad60b5ca95c4868226c1093a704')

build() {
  cd $srcdir/$_gemname-$pkgver
  sed -i 's/"clamp", "~> 0.6"/"clamp", ">= 0.6"/' fpm.gemspec
  gem build fpm.gemspec 2> /dev/null $1
}

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $srcdir/$_gemname-$pkgver/$_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
