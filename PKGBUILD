# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Anatol Pomozov

_gem=native-package-installer
pkgname=ruby-${_gem}
pkgver=1.1.9
pkgrel=4
pkgdesc='A helper to install native packages on "gem install"'
arch=(any)
url=https://github.com/ruby-gnome2/native-package-installer
license=(LGPL-3.0-or-later)
depends=(ruby)
options=(!emptydirs)
source=("ruby-${_gem}.tar.gz::https://github.com/ruby-gnome/native-package-installer/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1a9d681e39ec2291405ca1ebfeadb0b140e1f1cfd0db58693ffad883c6dc4d24')

build() {
  cd "${_gem}-${pkgver}"

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
  cd "${_gem}-${pkgver}"
  cp --archive --verbose tmp_install/* "${pkgdir}"
}
