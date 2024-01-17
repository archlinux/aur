# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=mechanize
pkgname=ruby-$_gemname
pkgver=2.9.2
pkgrel=1
pkgdesc="The Mechanize library is used for automating interaction with websites"
arch=(any)
url=https://github.com/sparklemotion/mechanize
license=(MIT)
depends=(
  ruby
  ruby-addressable
  ruby-domain_name
  ruby-http-cookie
  ruby-mime-types
  ruby-net-http-digest_auth
  ruby-net-http-persistent
  ruby-nokogiri
  ruby-rubyntlm
  ruby-webrick
  ruby-webrobots
)
checkdepends=(ruby-rake ruby-minitest)
makedepends=(git rubygems ruby-rdoc)
options=(!emptydirs)
source=(git+https://github.com/sparklemotion/mechanize.git?tag=v${pkgver})
sha256sums=('SKIP')

build() {
  cd $_gemname

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
  cd $_gemname
  local _gemdir="$(gem env gemdir)"
  GEM_HOME="tmp_install/${_gemdir}" rake test
}

package() {
  cd $_gemname

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
