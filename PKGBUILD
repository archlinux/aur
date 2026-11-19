# Maintainer: souk4711
#
# shellcheck disable=SC2034,SC2148,SC2154,SC2164

_gemname=ruby-pass-qt
pkgname=$_gemname
pkgver=2.1.2
pkgrel=1
pkgdesc="A simple GUI for pass on Linux."
arch=("x86_64")
url="https://github.com/souk4711/ruby-pass-at"
license=("GPL-3.0-only")
depends=(
  "ruby"
  "ruby-qt6-qtwidgets"
  "pass"
  "pass-otp"
  "pwgen"
)
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('54dfcfedfcfa6c4da197d1459636bf575f741ba1b65007342e39cb4e13c171f7')

build() {
  local _gemdir
  _gemdir="$(gem env gemdir)"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    "$_gemname-$pkgver.gem"

  sed --in-place 's/~> />= /g' "tmp_install/$_gemdir/specifications/$_gemname-$pkgver.gemspec"
}

package() {
  local _gemdir
  _gemdir="$(gem env gemdir)"

  cp --archive --verbose tmp_install/* "${pkgdir}"
  install --verbose -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
