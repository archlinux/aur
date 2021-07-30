# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=nanoc-live
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc="Provides support for auto-recompiling Nanoc sites"
arch=('any')
url="https://nanoc.app"
license=('MIT')
depends=(
  'ruby'
  'ruby-adsf-live'
  'ruby-listen'
  'ruby-nanoc-cli'
  'ruby-nanoc-core'
)
_nanocver=4.12.2
options=('!emptydirs')
source=(
  "https://rubygems.org/downloads/$_gemname-$pkgver.gem"
  "LICENSE-$_nanocver::https://raw.githubusercontent.com/nanoc/nanoc/$_nanocver/$_gemname/LICENSE"
)
noextract=("$_gemname-$pkgver.gem")
b2sums=('5df1b76425a74d7f9302dd4ea7c80c0c935ff40a98f4a13ee0594d5f1f7342d8e0a54a815624bd21983a7b922fe3dede0e9420b7f6e5208a2a8a33de4d7f9cca'
        'e2de6741a4b7e28ea98b87fe43eefdbfa27ce4404be103f75a058717cea87d8b9031fd4714d5e5c461520c1d3a7dd58001b6523afdc3b014db5d32270fcb3fa6')

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

  cd "gems/$_gemname-$pkgver"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" *.md

  # license
  install -vDm644 "$srcdir/LICENSE-$_nanocver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
