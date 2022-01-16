# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=psych
pkgname=ruby-$_gemname
pkgver=4.0.3
pkgrel=1
pkgdesc="A YAML parser and emitter"
arch=('x86_64')
url="https://github.com/tenderlove/psych"
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('d28d3d4e5f9e00949f8ead2ef2224ac494c5d1b6d8c45f176e0563500829dab85b2366f10cd7b01339b4a4b6bf8f57c4616b84e3d3e245e551e382ebb3b6d0ad')
b2sums=('dd3dbd561a4abd97dfc5396d17966dca20205b8f5e7a13f858398ac7160610fb623a63b4e70cd91516c7e6e64fa5cb9986b9e3fa3c74dbb7b0752cb37f0467b9')

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

  # remove unnecessary files and folders
  rm -vrf "extensions/$CARCH-linux/$(basename $_gemdir)/$_gemname-$pkgver/"{mkmf.log,gem_make.out}
  cd "gems/$_gemname-$pkgver"
  find . -type f -name ".*" -delete
  rm -rf "$_gemname.gemspec" *file ext

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" ./*.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE

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
