# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=adsf-live
pkgname=ruby-$_gemname
pkgver=1.4.6
pkgrel=1
pkgdesc="Live reload support for adsf"
arch=('any')
url="https://github.com/ddfreyne/adsf"
license=('MIT')
depends=(
  'ruby'
  'ruby-adsf'
  'ruby-em-websocket'
  'ruby-eventmachine'
  'ruby-listen'
  'ruby-rack-livereload'
)
options=('!emptydirs')
source=(
  "https://rubygems.org/downloads/$_gemname-$pkgver.gem"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/ddfreyne/adsf/adsf-live-v$pkgver/LICENSE"
)
noextract=("$_gemname-$pkgver.gem")
b2sums=('d5c55cafee2ff6f6189ca89eb5461acb40d683d98e222d816da5f59c51ac1059c72ac64f2a01a8efd7a9bdbb03b89dc0455cc03a957af6d3b113f8dea18ecbc3'
        '40aaf8ba18519a33d8bc34146b4da9d26a32d0739b1399d1d20463207c09604125804e89b85cf8fde1bbe35aca66956c1cd0c303a05d8873436fc3a8462f02df')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    --no-document \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # license
  install -vDm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -vrf cache

  cd "gems/$_gemname-$pkgver"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" *.md
}
