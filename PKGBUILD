# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

_gemname='debug_inspector'
pkgname="ruby-${_gemname//_/-}"
pkgver=1.2.0
pkgrel=1
pkgdesc='Ruby wrapper for the MRI 2.0 debug_inspector API'
arch=('x86_64')
url='https://github.com/banister/debug_inspector'
license=('MIT')
depends=(
  'ruby'
)
makedepends=(
  'ruby-rdoc'
)
checkdepends=(
  'ruby-bundler'
  'ruby-minitest'
  'ruby-rake'
  'ruby-rake-compiler'
)
options=('!emptydirs')

source=(
  "${_gemname}-${pkgver}.tar.gz::https://github.com/banister/debug_inspector/archive/v${pkgver}.tar.gz"
  'github-pr-42.patch'
)

sha512sums=(
  'e4328b1e36c1b196219d7e278dec2da730293857a6eb147e653f9ab6ca3628f6115f7661a98f0ca828a1a9657394aeb1392f71842a5833d8bb1c438567d4096f'
  '4adef491642acec6196d4ac4db666caa2c70a8d6c54a3aa6972dff0bd9a0de09ccc3f2c16dedacdecc24bd27eefe0ab1f12818fcfa95cc7a7bed695e2e57c791'
)

prepare() {
  cd "${_gemname}-${pkgver}"

  # We don't build from a Git checkout
  sed --in-place --regexp-extended \
    's|git ls-files -z|find . -type f -not -path "*/\.git/*" -print0|' \
    "${_gemname}.gemspec"

  # Remove this patch once the upstream author has merged PR #42 and
  # included it in a stable release.
  # See also: https://github.com/banister/debug_inspector/pull/42
  echo >&2 'Applying Ruby 3.4 compatibility patch'
  patch -p1 < ../github-pr-42.patch
}

build() {
  local _gemdir

  cd "${_gemname}-${pkgver}"
  _gemdir="$(gem env gemdir)"

  gem build "${_gemname}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --build-root "tmp_install" \
    "${_gemname}-${pkgver}.gem"

  # remove unreproducible files
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
  cd "${_gemname}-${pkgver}"

  GEM_HOME="tmp_install/$(gem env gemdir)" rake test
}

package() {
  cd "${_gemname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 \
    --target-directory "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
  install --verbose -D --mode=0644 \
    --target-directory "${pkgdir}/usr/share/doc/${pkgname}" -- \
    *.md
}
