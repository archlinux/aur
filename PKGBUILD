# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>

_gemname=highline
pkgname=ruby-highline
pkgver=3.1.2
pkgrel=2
pkgdesc='A higher level command-line oriented interface'
arch=(any)
url='https://github.com/JEG2/highline'
license=('GPL-2.0-only OR Ruby')
depends=(
  ruby
  ruby-reline
)
makedepends=(
  git
  ruby-rdoc
)
checkdepends=(
  ruby-bundler
  ruby-dry-types
  ruby-erb
  ruby-minitest
  ruby-rake
  ruby-simplecov
)
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9a5d4d7d888fe43821849dd1c2b2dc78c83f862bde8635f6c0a14caf82540c55')

prepare() {
  cd "${_gemname}-${pkgver}"

  # we don't build from a git checkout
  sed --in-place 's|git ls-files -z|find lib -type f -print0|' \
    "${_gemname}.gemspec"
}

build() {
  local _gemdir
  _gemdir="$(gem env gemdir)"
  cd "${_gemname}-${pkgver}"
  gem build highline.gemspec
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    highline-$pkgver.gem
  find "tmp_install/$_gemdir/gems/" \
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
  rm -r "tmp_install/${_gemdir}/cache"
}

check() {
  local _gemdir
  _gemdir="$(gem env gemdir)"
  cd "${_gemname}-${pkgver}"
  GEM_HOME="tmp_install/$_gemdir" rake
}

package() {
  cd "${_gemname}-${pkgver}"
  cp -a tmp_install/* "$pkgdir"/
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -R --preserve=mode -t "${pkgdir}/usr/share/${pkgname}" examples
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    AUTHORS Changelog.md README.md
  install -D -m 644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
