# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=ruby-serverengine
_gemname="${pkgname#ruby-}"
pkgname=ruby-$_gemname
pkgver=2.3.2
pkgrel=1
pkgdesc='A framework to implement robust multiprocess servers'
arch=('any')
url='https://github.com/treasure-data/serverengine'
license=('Apache')
depends=('ruby' 'ruby-sigdump')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('9ca32740d4579fb8cbeb613780ed78a9a2e5a72fb427d24aa26a9a805f83de0d2840eb3de6e2e4205a771e1c58bcc4a171869807fdb49ddbb017ceeb8ca08c73')
b2sums=('f07972501906ee8a8418461d80125d019364b1d025740d22e50f862e70054682affdb1a65015e38b72ab971792f2d3cb8c41d7ce45c5f99ce9398c2ae236d6bb')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --no-document \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -rf cache

  # delete unnecessary files & folders
  cd "gems/$_gemname-$pkgver"
  rm -rf .github .gitignore .rspec spec \
    Changelog Gemfile LICENSE Rakefile appveyor.yml

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv README.md examples "$pkgdir/usr/share/doc/$pkgname"

  # move license notice
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv NOTICE "$pkgdir/usr/share/licenses/$pkgname"
}

