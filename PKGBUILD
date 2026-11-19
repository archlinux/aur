# Maintainer: souk4711
#
# shellcheck disable=SC2034,SC2148,SC2154,SC2164

_gemname=ruby-clash-systray
pkgname=$_gemname
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple system tray for Clash on Linux."
arch=("x86_64")
url="https://github.com/souk4711/ruby-clash-systray"
license=("GPL-3.0-only")
depends=(
  "ruby"
  "ruby-qt6-qtwidgets"
  "ruby-qt6-qtnetwork"
  "ruby-qt6-qtwebenginewidgets"
)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('d5df841a4da230b29488b140cecf0b0dac78edda7f8505e575b4637a2a64f6b2')

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
