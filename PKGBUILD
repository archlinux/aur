pkgname=innodb_space
_gemname=innodb_ruby
pkgver=0.14.0
pkgrel=1
pkgdesc='Library for parsing InnoDB data files in Ruby'
arch=(any)
url='https://rubygems.org/gems/innodb_ruby'
license=('Apache-2.0')
depends=(ruby ruby-bigdecimal)
provides=(innodb_ruby innodb_log ruby-innodb)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('d5206a62169948b25e3c8a0cea609edabf75b1bb6d8d1c555ae8c70e149850133eea84f41b568808148cfd453a6bf69d20f1ec8bc27abe6ea33dbe1ec76b698d')

build() {
  local _gemdir="$(gem env gemdir)"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --build-root "tmp_install" \
    "${_gemname}-${pkgver}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/${_gemdir}/cache/" \
    "tmp_install/${_gemdir}/gems/${_name}-${pkgver}/vendor/" \
    "tmp_install/${_gemdir}/doc/${_name}-${pkgver}/ri/ext/"

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
  local _gemdir="$(gem env gemdir)"
  cp --archive --verbose tmp_install/* "${pkgdir}"
  install --verbose -D --mode=0644 "tmp_install/$_gemdir/gems/$_gemname-$pkgver/LICENSE" --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 "tmp_install/$_gemdir/gems/$_gemname-$pkgver/README.md" --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
