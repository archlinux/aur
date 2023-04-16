# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=sshkit
pkgname=ruby-$_gemname
pkgver=1.21.4
pkgrel=1
pkgdesc="Toolkit for deploying code and assets to servers"
arch=(any)
url=https://github.com/capistrano/sshkit
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-net-scp ruby-net-ssh)
# checkdepends=(rubocop ruby-bcrypt_pbkdf ruby-bundler ruby-ed25519 ruby-minitest
#               ruby-minitest-reporters ruby-mocha ruby-public_suffix
#               ruby-rainbow ruby-rake)
makedepends=(ruby-rdoc rubygems)
source=(${url}/archive/v${pkgver}/$_gemname-$pkgver.tar.gz)
sha256sums=('7741afa8ec2d726289daeb106df4554713bb5f719f3099356d1dec9319a2f1ad')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's|~>|>=|g' ${_gemname}.gemspec

  # we use an archive not a git checkout
  sed -i 's|git ls-files -- bin/\*|find bin|' ${_gemname}.gemspec
  sed -i 's|git ls-files -- test/\*|find test|' ${_gemname}.gemspec
  sed -i 's|git ls-files|find|' ${_gemname}.gemspec

  sed -i '/danger/d' ${_gemname}.gemspec
}

build() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"

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

# check() {
#   cd $_gemname-$pkgver

#   local _gemdir="$(gem env gemdir)"

#   # depends on spinning up vagrant vms
#   vagrant up --provider=virtualbox
#   GEM_HOME="tmp_install/${_gemdir}" rake test:units
#   GEM_HOME="tmp_install/${_gemdir}" rake test:functional
# }

package() {
  cd $_gemname-$pkgver

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -v -Dm0644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -v -Dm0644 EXAMPLES.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -v -Dm0644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: set ts=2 sw=2 et:
