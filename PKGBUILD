# Maintainer: Mark Weiman <mark dot weiman at markzz dot com>

_gemname=fpm
pkgname=$_gemname-git
_pkgver=1.8.1
pkgver=1983.fd7ef05
pkgrel=1
pkgdesc='Effing package management! Build packages for multiple platforms with great ease and sanity. (git version)'
arch=(any)
url="https://github.com/jordansissel/${_gemname}"
license=('MIT')
depends=(ruby ruby-cabin ruby-backports ruby-arr-pm ruby-clamp
         ruby-childprocess ruby-json-1 ruby-ffi
         ruby-archive-tar-minitar ruby-xz ruby-pleaserun
         ruby-rspec ruby-insist ruby-pry ruby-stud)
makedepends=('git')
provides=(fpm)
conflicts=(fpm)
options=(!emptydirs)
source=("${_gemname%-*}::git+https://github.com/jordansissel/${_gemname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_gemname%-}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/${_gemname%-*}
  sed -i 's/"clamp", "~> 0.6"/"clamp", ">= 0.6"/' fpm.gemspec
  gem build fpm.gemspec > /dev/null 2>&1
}

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --debug --backtrace --verbose -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $srcdir/$_gemname/$_gemname-$_pkgver.gem > /dev/null 2>&1
  rm "$pkgdir/$_gemdir/cache/$_gemname-$_pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
