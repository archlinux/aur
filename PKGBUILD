
_gemname=xxhash
pkgname=ruby-${_gemname}
pkgver=0.6.0
pkgrel=1
pkgdesc="Ruby wrapper for xxHash lib"
arch=(x86_64)
url=https://github.com/nashby/xxhash
license=(MIT)
depends=(ruby)
makedepends=(rubygems ruby-rake)
options=(!emptydirs)
source=(${url}/archive/v${pkgver}/$_gemname-$pkgver.tar.gz)
sha256sums=('0139e882fa934aab85f4e2b51bd5a4486d575ea15ede1e598ac6d617266f704b')

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

