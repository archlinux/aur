# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gem=cairo
pkgname=ruby-${_gem}
pkgver=1.18.4
pkgrel=2
pkgdesc="Ruby bindings for cairo"
arch=(x86_64)
url="https://github.com/rcairo/rcairo"
license=(Ruby)
depends=(ruby cairo ruby-pkg-config ruby-native-package-installer ruby-red-colors glibc freetype2)
#makedepends=(ruby-rdoc)
options=(!emptydirs)
source=("ruby-cairo-${pkgver}.tar.gz::https://github.com/rcairo/rcairo/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('edebb85be3c02538c768edb1255d42d781fd12fae1a3ed3c4588ddd256ed2bfcea3c60d9dbaacdefb6a64f34b3c3a7507868f3e3f3e7b69f6be0926424549a83')

build() {
  cd "rcairo-${pkgver}"

local _gemdir="$(gem env gemdir)"

  gem build "${_gem}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${_gem}-${pkgver}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/${_gemdir}/cache/" \
    "tmp_install/${_gemdir}/gems/${_gem}-${pkgver}/vendor/" \
    "tmp_install/${_gemdir}/doc/${_gem}-${pkgver}/ri/ext/"

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
  cd "rcairo-${pkgver}"
  cp --archive --verbose tmp_install/* "${pkgdir}"
}
