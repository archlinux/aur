# Maintainer: souk4711
#
# shellcheck disable=SC2034,SC2148,SC2154,SC2164

_gemname=ruby-qt6-qtcore
pkgname=$_gemname
pkgver=6.3.1
pkgrel=1
pkgdesc="Ruby Bindings for Qt Core."
arch=("x86_64")
url="https://github.com/souk4711/ruby-qt6"
license=("LGPL-3.0-only WITH LGPL-3.0-linking-exception")
depends=(
  "ruby"
  "ruby-qt6-rice>=6.3.0"
  "qt6-base"
)
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('e1bb9fa67313698c3e6143b2cd92287c32220a06e32ceb15cd943e48402080a9')

build() {
  local _gemdir
  _gemdir="$(gem env gemdir)"

  export RUBYQT6_CXXFLAGS="-Os -fno-fast-math -flto=auto -fvar-tracking-assignments-toggle --param max-vartrack-size=100000000"
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    "$_gemname-$pkgver.gem"
}

package() {
  local _gemdir
  _gemdir="$(gem env gemdir)"

  cp --archive --verbose tmp_install/* "${pkgdir}"
  install --verbose -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
