# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: kusakata <shohei atmark kusakata period com>

_gemname=fluentd
pkgname=$_gemname
pkgver=1.12.3
pkgrel=2
pkgdesc='Open source data collector designed to scale and simplify log management'
arch=(any)
url='https://github.com/fluent/fluentd'
license=(Apache)
depends=(
  'ruby-bundler'
  'ruby-msgpack'
  'ruby-yajl-ruby'
  'ruby-cool.io'
  'ruby-serverengine'
  'ruby-http_parser.rb'
  'ruby-sigdump'
  'ruby-tzinfo'
  'ruby-tzinfo-data'
  'ruby-strptime'
  'ruby-webrick'
)
optdepends=(
  'jemalloc: for a more efficient malloc implementation'
  'ruby-oj: for a faster json parser'
)
options=(!emptydirs)
source=(
  "https://rubygems.org/downloads/$_gemname-$pkgver.gem"
  "$pkgname.conf"
  "$pkgname.service"
  "tmpfiles.conf"
  "sysusers.conf"
)
install="$pkgname.install"
noextract=("$_gemname-$pkgver.gem")
backup=('etc/fluent/fluentd.conf')
b2sums=('53086b43a3acb43eb6564b43152a8d83d0a5519c301891446f7156efeacddc76ea378532d7c8a2d4f7c7520370c9988a8ff07c754c17992c97d225a1d0ba0f95'
        '3fb9859e9a73c834891211c220268b0c0808ce4de3c5f334c941e4033f93c5e0c1d1f99fd108b079f93f5ea6b5575f1a0f8d833012259114f091d8784c716491'
        'dcabc5dd54b7b4a3b98b8ec493ee1409b887f0e89812eb8c13da7158857b4df25f20c43c75a33d492c5ad484db88ed56669cc0048afbe4d8a373b715b7d7a1a5'
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
    $_gemname-$pkgver.gem

  # delete unnecessary files
  cd "$pkgdir/$_gemdir"
  find extensions/ -name *.so -delete
  rm -f "cache/$_gemname-$pkgver.gem"
  cd "$pkgdir/$_gemdir/gems/$_gemname-$pkgver"
  rm -rf \
    .deepsource.toml \
    .drone.yml \
    .travis.yml \
    .gitlab-ci.yml \
    .gitignore \
    .github \
    appveyor.yml

  # move documentation
  cd "$pkgdir/$_gemdir/gems/$_gemname-$pkgver"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  mv -t "$pkgdir/usr/share/doc/$pkgname" \
    docs/SECURITY_AUDIT.pdf *.md example

  # configuration
  install -Dm644 fluent.conf "$pkgdir/etc/fluent/fluentd.conf"
  install -Dm644 -t "$pkgdir/etc/conf.d" "$srcdir/$pkgname.conf"

  # systemd service
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/$pkgname.service"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
