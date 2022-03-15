# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: farwayer <farwayer@gmail.com>

_gemname=excon
pkgname=ruby-$_gemname
pkgver=0.92.0
pkgrel=1
pkgdesc="EXtended http(s) CONnections"
arch=('any')
url="https://github.com/excon/excon"
license=('MIT')
depends=('ruby')
makedepends=('rubygems' 'ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('939a13c0e0596462f371b768f332043340fa63956bcf00e07974207214e18f8113356e7ac075fe714e3ce89d5fdac5d940dc2975f38cd7cb354d1e817f508481')
b2sums=('9a9f5325e59e8e869c3e96167c05877788e1977f3b68c7a6a9c5e874885456046603f7019fe0c157628505a7f4cc492e3e895772a6872081f8be172de3b10391')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    --no-document \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete unnecessary files & folders
  cd "$pkgdir/$_gemdir"
  rm -vrf cache
  cd "gems/$_gemname-$pkgver"
  rm -vrf "$_gemname.gemspec"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" \
    CONTRIBUTING.md CONTRIBUTORS.md README.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md

  # generate reproducible documentation
  install -vd "$pkgdir/$_gemdir/doc/$_gemname-$pkgver"
  cd "$pkgdir/$_gemdir/gems/$_gemname-$pkgver"
  rdoc \
    --format ri \
    --output "$pkgdir$_gemdir/doc/$_gemname-$pkgver/ri" \
    ./lib

  # delete unnecessary rdoc metadata file
  rm -f "$pkgdir$_gemdir/doc/$_gemname-$pkgver/ri/created.rid"
}
