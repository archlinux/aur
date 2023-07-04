# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: farwayer <farwayer@gmail.com>

_gemname=digest-crc
pkgname=ruby-${_gemname}
pkgver=0.6.5
pkgrel=1
pkgdesc="A Cyclic Redundancy Check (CRC) library for Ruby"
arch=(x86_64)
url=https://github.com/postmodern/digest-crc
license=(MIT)
depends=(ruby)
checkdepends=(ruby-rspec ruby-simplecov ruby-yard)
makedepends=(rubygems ruby-rdoc ruby-bundler ruby-rake ruby-rubygems-tasks)
options=(!emptydirs)
source=(${url}/archive/v${pkgver}/$_gemname-$pkgver.tar.gz)
sha256sums=('87e0ed5e6a4200b5df69b54f16e598b7d387f19b04fed352d22e8ded83b1205c')

prepare() {
  cd $_gemname-$pkgver

  # we use a tarball, not a git checkout
  sed -i 's/git ls-files/find/' ${_gemname}.gemspec

  sed -i '/kramdown/d' Gemfile
  sed -i '/github-markup/d' Gemfile
}

build() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"

  # rake build:c_exts
  gem build "${_gemname}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${_gemname}-${pkgver}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/${_gemdir}/cache/" \
    "tmp_install/${_gemdir}/gems/${_gemname}-${pkgver}/vendor/" \
    "tmp_install/${_gemdir}/doc/${_gemname}-${pkgver}/ri/ext/"

  find "tmp_install/${_gemdir}/gems/" \
    -type f \
    \( \
      -iname "*.o" -o \
      -iname "*.c" -o \
      -iname "*.so" -o \
      -iname "*.time" -o \
      -iname "gem.build_complete" -o \
      -iname "Makefile" \
    \) \
    -delete

  find "tmp_install/${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

check() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"
  GEM_HOME="tmp_install/${_gemdir}" rake spec
}

package() {
  cd $_gemname-$pkgver

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 ChangeLog.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
