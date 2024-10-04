# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname='dry-logic'
pkgname="ruby-${_gemname}"
pkgver=1.5.0
pkgrel=1
pkgdesc='Predicate logic with rule composition'
arch=('any')
url="https://github.com/dry-rb/${_gemname}"
license=('MIT')
depends=(
  ruby
  ruby-concurrent
  ruby-dry-core
  ruby-zeitwerk
)
makedepends=(
  ruby-rdoc
)
checkdepends=(
  ruby-bundler
  ruby-rake
  ruby-rspec
  ruby-warning
)
options=('!emptydirs')
source=(
  "${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "https://patch-diff.githubusercontent.com/raw/dry-rb/dry-logic/pull/90.patch"
)
sha512sums=('cde3a01c0c16af1bd40f6c0c39b8777e464d6796f5c1eb52297453bb4301934c23ec48ac0e2bcc023844252b5da38687ae0bb8977f99c7f656d3fe18708bb7b8'
            'd3ab10ed59d0a3800180380e32ce435feaff288e71660a5284b041b353ebabac7e662c2732201a64222a66752d19638e94a5302eb2e3214591f578aa4f4a38d1')
b2sums=('9b00ac4bed7c400858554b3485f0bce04633caaac2b70bd0c76c1d11cb20b1ab34136a3e2189e247b012833f10219140366c18faa7af09d603b3b8cca4778dda'
        '33e405446e3ca113247fa897bd3d1fde4b85707cf2f33bea1c13a199fa6dd21b94ed2ea734d4668d74ec1d5b09b5a0a49a64f58574dd9ee93875ae067b7ea8ca')

prepare() {
  cd "${_gemname}-${pkgver}"

  patch --verbose --strip=1 --input="../90.patch"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem build --verbose "${_gemname}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${_gemname}-${pkgver}.gem"

  # remove unreproducible files
  rm --force --recursive --verbose \
    "tmp_install${_gemdir}/cache/" \
    "tmp_install${_gemdir}/gems/${_gemname}-${pkgver}/vendor/" \
    "tmp_install${_gemdir}/doc/${_gemname}-${pkgver}/ri/ext/"

  find "tmp_install${_gemdir}/gems/" \
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

  find "tmp_install${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

check() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  GEM_HOME="tmp_install${_gemdir}" rake spec
}

package() {
  cd "${_gemname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE* --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:
