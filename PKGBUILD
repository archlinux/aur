# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname='dry-core'
pkgname="ruby-${_gemname}"
pkgver=1.0.1
pkgrel=2
pkgdesc='A toolset of small support modules used throughout the dry-rb ecosystem'
arch=('any')
url="https://github.com/dry-rb/${_gemname}"
license=('MIT')
depends=(
  ruby
  ruby-concurrent
  ruby-zeitwerk
)
makedepends=(
  ruby-rdoc
)
checkdepends=(
  ruby-activesupport
  ruby-bundler
  ruby-dry-inflector
  ruby-dry-types
  ruby-rake
  ruby-rspec
)
options=('!emptydirs')
source=(
  "${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "${pkgname}_fix_tests.patch"
)
sha512sums=('d769795459a0ffc007eb66e2b9af9be4e635c620a5ca54a76113057b495e1126600a572761d8ff33a3ee6a4fca948f6fc29d3200e7ba0b56c1bb600a4749bbd4'
            'd23c59a164eb81ff953a31ee1a03f8c0dd2720a0af4fd8dbb9cf6a131f10dbfeb28c708bded8431764bd70e1f8f9ec9652102ae9c874c4863690864f3aa709b9')
b2sums=('fb85107dd68dfb2a8d3ee2e66b4bb8b416ac325be4d28bcbbf5605e0a90992eb8aa85a8fad3cba8f228a5a7e50109cd2c1dbf920eebc3423d282055204c6b0a5'
        'b5e153845ec054e4f35a14368c28793ec2973be60718c6a67b557af20ab8ebd032720bc9e9090f50d69ce6d81893d2ae168f332e2655716d4ce9111cdbdc5cba')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"

  patch --verbose --strip=1 --input="../${pkgname}_fix_tests.patch"
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
