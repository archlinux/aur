
_gemname=xxhash
pkgname=ruby-${_gemname}
pkgver=0.7.0
pkgrel=1
pkgdesc="Ruby wrapper for xxHash lib"
arch=(x86_64)
url=https://github.com/nashby/xxhash
license=(MIT)
depends=(ruby)
makedepends=(rubygems ruby-rake)
options=(!emptydirs)
source=(${url}/archive/v${pkgver}/$_gemname-$pkgver.tar.gz)
sha256sums=('5bcebddae3f9d927d13f1c5d875661ce11f08bb05efefea50ef526d3b81ca0bc')

prepare() {
  cd $_gemname-$pkgver

  # we use a tarball, not a git checkout
  sed -i 's/git ls-files/find/' ${_gemname}.gemspec
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

  find "tmp_install/${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

package() {
  cd $_gemname-$pkgver

  cp --archive --verbose tmp_install/* "${pkgdir}"
}

