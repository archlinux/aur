# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: kusakata <shohei atmark kusakata period com>

_gemname=fluentd
pkgname=$_gemname
pkgver=1.12.4
pkgrel=1
pkgdesc='Open source data collector designed to scale and simplify log management'
arch=('any')
url='https://github.com/fluent/fluentd'
license=('Apache')
_deps=(
  'bundler'
  'msgpack'
  'yajl-ruby'
  'cool.io'
  'serverengine'
  'http_parser.rb'
  'sigdump'
  'tzinfo'
  'tzinfo-data'
  'strptime'
  'webrick'
)
depends=('ruby' "${_deps[@]/#/ruby-}")
optdepends=(
  'jemalloc: for a more efficient malloc implementation'
  'ruby-oj: for a faster json parser'
)
options=(!emptydirs)
source=(
  "https://rubygems.org/downloads/$_gemname-$pkgver.gem"
  'systemd.service'
  'tmpfiles.conf'
  'sysusers.conf'
)
install="$pkgname.install"
noextract=("$_gemname-$pkgver.gem")
backup=('etc/fluent/fluentd.conf')
b2sums=('c9900b940d62cfb8c9d713b207376c049d2f9eb9bf70a64a132465478582f9a0e12ee98d1863afbe3e4459a19873cc7ec43e7c758d5fac445609b2e37ccf12e5'
        '593511fb52e2d934e89bbdae7ac7687b29165a6d20a48bab223b91b2010c82811da0a79f9c51ee857b48f2fca06677ba0f9db43bb8990df723620fa3471045a9'
        '8957872f805a274a56ae9e63896033a5fe175bd4d71704e62aff18524b95bf2a611bb3a4bff3c93b6d977f209e415a7d38d806341e144919022226ab1f53247d'
        '78cf6da081b7f370bfe6b362e5f545cefcb770cc42eafd713de5befd8489c543a99e60112b09dc47b7867fdac8be91291cab68fc102f97834f248ce879782d6c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install \
    --ignore-dependencies \
    --no-user-install \
    --no-document \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete unnecessary files/folders
  rm -vrf "$pkgdir/$_gemdir/cache"
  cd "$pkgdir/$_gemdir/gems/$_gemname-$pkgver"
  rm -vrf test \
    .deepsource.toml \
    .drone.yml \
    .travis.yml \
    .gitlab-ci.yml \
    .gitignore \
    .github \
    appveyor.yml

  # move documentation
  cd "$pkgdir/$_gemdir/gems/$_gemname-$pkgver"
  install -vdm755 "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" \
    docs/SECURITY_AUDIT.pdf *.md example

  # configuration
  install -vDm644 fluent.conf "$pkgdir/etc/fluent/fluentd.conf"

  # systemd integration
  install -vDm644 "$srcdir/systemd.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
