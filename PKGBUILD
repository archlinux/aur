# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_gem=glib2
pkgname="ruby-${_gem}"
pkgver=4.3.2
pkgrel=1
pkgdesc='Ruby/GLib2 is a Ruby binding of GLib-2.x.'
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/ruby-gnome/ruby-gnome"
license=(LGPL-2.1-only)
depends=(ruby glib2 glibc)
makedepends=(ruby-pkg-config ruby-native-package-installer)
source=("ruby-gnome-${pkgver}.tar.gz::https://github.com/ruby-gnome/ruby-gnome/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a2b66682d55b1815710361d275603b544e207d63e5b93be8a14a239657774f01')

build() {
  # warning when build with -D_FORTIFY_SOURCE=3 (Arch Linux default)
  export CFLAGS="${CFLAGS/D_FORTIFY_SOURCE=3/D_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/D_FORTIFY_SOURCE=3/D_FORTIFY_SOURCE=2}"

  cd "ruby-gnome-${pkgver}/${_gem}"

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
  cd "ruby-gnome-${pkgver}/${_gem}"
  cp --archive --verbose tmp_install/* "${pkgdir}"
}
