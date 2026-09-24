# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Andrew Rabert <draje@nullsum.net>

_gemname=exifr
pkgname=ruby-${_gemname}
pkgver=1.5.1
pkgrel=2
pkgdesc="Module to read EXIF from JPEG and TIFF images"
arch=(any)
url=https://codeberg.org/rwv/exifr
license=(MIT)
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-rake ruby-test-unit)
makedepends=(rubygems ruby-rdoc)
source=($pkgname-$pkgver.tar.gz::${url}/archive/release-${pkgver}.tar.gz)
sha256sums=('dc16edbe39e945ab32379eabd9c4165f15d8d2dea318ddf8617dcc13f957b004')

build() {
  cd $_gemname
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

check() {
  cd $_gemname
  local _gemdir="$(gem env gemdir)"
  GEM_HOME="tmp_install/${_gemdir}" rake
}

package() {
  cd $_gemname

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -v -Dm0644 MIT-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -v -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -v -Dm0644 CHANGELOG "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
}

# vim: set ts=2 sw=2 et:
