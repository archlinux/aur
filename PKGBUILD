# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>

_gemname=net-ldap
pkgname=ruby-$_gemname
pkgver=0.19.0
pkgrel=1
pkgdesc="Pure Ruby LDAP library"
arch=(any)
url=https://github.com/ruby-ldap/ruby-net-ldap
license=(MIT)
options=(!emptydirs)
depends=(ruby)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('4e6f1807e0ba78b6431efd56fafcca0a286783a215e07745615471a7cd557aa9')

build() {
  cd $pkgname-$pkgver
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

package() {
  cd $pkgname-$pkgver
  local _gemdir="$(gem env gemdir)"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -Dm0644 License.rdoc "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.rdoc "$pkgdir/usr/share/doc/$pkgname/README.rdoc"
}

# vim: set ts=2 sw=2 et:
