# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=ruby-serverengine
_gemname="${pkgname#ruby-}"
pkgname=ruby-$_gemname
pkgver=2.3.0
pkgrel=1
pkgdesc='A framework to implement robust multiprocess servers'
arch=('any')
url='https://github.com/treasure-data/serverengine'
license=('Apache')
depends=('ruby' 'ruby-sigdump')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('0887ac556f9f4faa7d8e25743b2f79694153c0e7e39666c8ea02d0313c17835e0e5697da498ad1b23612ec938d8d9f430cfb9699711479ae088011c5a7fee4c4')
b2sums=('944e0e6b6bd31b6609e21fac0ea688b9a4acac3b02c4c1f06a34fe29a51c67db79e9a55c43243ce601d42a30b31ca1da605caeab05bdd9587536c4fb540bb5ce')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
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

