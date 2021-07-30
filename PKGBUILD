# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=rack-livereload
pkgname=ruby-$_gemname
pkgver=0.3.17
pkgrel=1
pkgdesc="Insert LiveReload into your app easily as Rack middleware"
arch=('any')
url="https://github.com/jaredmdobson/rack-livereload"
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('61c65cd9698b8fc9f002a3db7ff1fe47e20310b02fad0e659cc25b27c43d98b82b90eb344e6b8e1264b321cf84314b80608002c84e74ff10f5a94f5d2d4d820d')

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
  rm -vrf cache

  # delete unnecessary files & folders
  cd "gems/$_gemname-$pkgver"
  find . -type f -name ".*" -delete
  rm -vrf spec gemfiles Appraisals "$_gemname.gemspec"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" README.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
