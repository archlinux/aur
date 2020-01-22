# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Tim Meusel <tim at bastelfreak dot de>

_gemname=gettext-setup
pkgname=ruby-$_gemname
pkgver=0.34
pkgrel=1
pkgdesc='A gem that configures gettext for internationalization.'
arch=(any)
url='https://github.com/puppetlabs/gettext-setup-gem'
license=('Apache')
depends=(ruby ruby-gettext ruby-fast_gettext)
makedepends=(rubygems ruby-rdoc)
checkdepends=(ruby-rspec)
options=(!emptydirs)
source=(https://github.com/puppetlabs/gettext-setup-gem/archive/${pkgver}/${_gemname}-gem-${pkgver}.tar.gz disable-simplecov.patch)
options=(!emptydirs)
sha256sums=('f9a64ba9dab5af20a20abdf035b56f2a1d4cad67076add72b5de23a14e1b8efc'
            '935d995bca7ff5f196c5d66dcfbfc86766043b548a48782db5a6be641150e0a4')

prepare() {
  cd ${_gemname}-gem-${pkgver}

  # allow latest dependencies
  sed -i 's|~>|>=|g' ${_gemname}.gemspec

  # allow to build without git
  sed -i "s/spec.version.*/spec.version       = '${pkgver}'/" \
    ${_gemname}.gemspec

  # The Rakefile and a helper file try to load a bunch of gems to report the
  # CI status to a cloud provider, it also tries to execute a ruby linter for
  # a legacy Ruby version and all those tools aren't required to build and
  # test the software, also we don't have them in the repos.
  sed -i "/spec.add_development_dependency 'rubocop'/d" ${_gemname}.gemspec
  sed -i "/spec.add_development_dependency 'simplecov'/d" ${_gemname}.gemspec

  # allow latest gettext version (removes explicit upper boundary)
  sed -i "s/.*'gettext'.*/  spec.add_dependency 'gettext'/" ${_gemname}.gemspec

  patch -p1 -N -i "${srcdir}/disable-simplecov.patch"
}

check() {
  cd ${_gemname}-gem-${pkgver}
  rspec spec
}

build() {
  cd ${_gemname}-gem-${pkgver}
  gem build ${_gemname}.gemspec
}

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  cd ${_gemname}-gem-${pkgver}

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
