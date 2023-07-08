# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=fluentd
pkgver=1.16.1
pkgrel=1
pkgdesc='Data collector designed to scale and simplify log management'
arch=('any')
url='https://www.fluentd.org'
license=('Apache')
depends=(
  'ruby'
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
options=('!emptydirs')
source=(
  "https://rubygems.org/downloads/$pkgname-$pkgver.gem"
  'systemd.service'
  'tmpfiles.conf'
  'sysusers.conf'
)
install="$pkgname.install"
noextract=("$pkgname-$pkgver.gem")
backup=('etc/fluent/fluentd.conf')
sha512sums=('e11a190e7f92f53532c6fabaaf748ace84ed351bd5609d30a3db518a3f9c10f4d6b979dcde17bef86c2c71196e389ff1cbcf7377bfdcc5b4c2807ed2ca79d054'
            '01de8becfbd191063e162edcdb623281d6edf140bac6bb4c01aab976f887cb30184484e8196a9942a8623a418e1f49e2d059ac25a943ee9182eeab0e243630f6'
            '084f2716b1d65a49d2126a6fdb8016c7e92eb58a2c7c934236dbfdff65c5643d69f0e6bc71f0cdcb6c2edf8bc071c2f0f31da3c70f6c12220eaf69cb70221e6b'
            'af264f901a23ae4b611c57779222c004a348cb7efbe7a2922ce01cef8bc047e42c394309e4746d3b669105d04fbacd057e68487e214c6929328e9cc2a9439980')
b2sums=('47f7ba0220647cb3e84b73541fc1e4900cafdbbb609f83d27aa024e3c5b18532e5e137ea793c1f9c77091f3c1fa503af3929ff7b49069c693e2627e80ea64b7f'
        '593511fb52e2d934e89bbdae7ac7687b29165a6d20a48bab223b91b2010c82811da0a79f9c51ee857b48f2fca06677ba0f9db43bb8990df723620fa3471045a9'
        '8957872f805a274a56ae9e63896033a5fe175bd4d71704e62aff18524b95bf2a611bb3a4bff3c93b6d977f209e415a7d38d806341e144919022226ab1f53247d'
        '78cf6da081b7f370bfe6b362e5f545cefcb770cc42eafd713de5befd8489c543a99e60112b09dc47b7867fdac8be91291cab68fc102f97834f248ce879782d6c')

package() {
  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$pkgname-$pkgver.gem"

  # delete unnecessary files/folders
  rm -vrf "$pkgdir/$_gemdir/cache"
  cd "$pkgdir/$_gemdir/gems/$pkgname-$pkgver"
  rm -vrf test \
    .deepsource.toml \
    .drone.yml \
    .travis.yml \
    .gitlab-ci.yml \
    .gitignore \
    .github \
    appveyor.yml

  # move documentation
  cd "$pkgdir/$_gemdir/gems/$pkgname-$pkgver"
  install -vdm755 "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" \
    docs/SECURITY_AUDIT.pdf *.md example

  # configuration
  install -vDm644 fluent.conf "$pkgdir/etc/fluent/fluentd.conf"
}
