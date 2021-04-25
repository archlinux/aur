# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: kusakata <shohei atmark kusakata period com>

_gemname=fluentd
pkgname=$_gemname
pkgver=1.12.3
pkgrel=1
pkgdesc='Open source data collector designed to scale and simplify log management'
arch=(any)
url='https://github.com/fluent/fluentd'
license=(Apache)
depends=(
  ruby
  ruby-msgpack
  ruby-yajl-ruby
  ruby-cool.io
  ruby-serverengine
  ruby-http_parser.rb
  ruby-sigdump
  ruby-tzinfo
  ruby-tzinfo-data
  ruby-strptime
)
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem"
        "$pkgname.conf"
        "$pkgname.service"
        "$pkgname.tmpfiles"
        "$pkgname.sysusers")
noextract=("$_gemname-$pkgver.gem")
backup=('etc/fluentd/fluentd.conf')
b2sums=('53086b43a3acb43eb6564b43152a8d83d0a5519c301891446f7156efeacddc76ea378532d7c8a2d4f7c7520370c9988a8ff07c754c17992c97d225a1d0ba0f95'
        '73a3afc0e3692890087d03a778e26949af2d68c3eb3c0656b4d278c8f4e51f71678482a2dde58565df7ca3b9ce7d1f9dd4b1cc3f85d9c0ac2b7e6ccacd8e6ff5'
        '80b220bdee1eb18f128db3514484fcfd13c8e2a99fb43f03f4e2ebfa0ddc893a7b128f1bcbdc9f43b235c0613cdce71ef7d12120131b419d9efeb89d51860c3a'
        '8957872f805a274a56ae9e63896033a5fe175bd4d71704e62aff18524b95bf2a611bb3a4bff3c93b6d977f209e415a7d38d806341e144919022226ab1f53247d'
        '78cf6da081b7f370bfe6b362e5f545cefcb770cc42eafd713de5befd8489c543a99e60112b09dc47b7867fdac8be91291cab68fc102f97834f248ce879782d6c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem

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
  install -Dm644 -t "$pkgdir/etc/$pkgname" "$srcdir/$pkgname.conf"

  # systemd service
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/$pkgname.service"
  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
