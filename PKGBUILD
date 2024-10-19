# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gem=gio2
pkgname="ruby-${_gem}"
pkgver=4.2.4
pkgrel=1
pkgdesc='Ruby/GIO2 is a Ruby binding of gio-2.x.'
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/ruby-gnome/ruby-gnome"
license=(LGPL-2.1-only)
depends=(ruby ruby-gobject-introspection=${pkgver} glibc glib2)
makedepends=(ruby-pkg-config ruby-native-package-installer)
source=("ruby-gnome-${pkgver}.tar.gz::https://github.com/ruby-gnome/ruby-gnome/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('37a39e0175f00bedb3fca7791f12f9a0d759231c2d882a8770a7877a0e25cef5')

build() {
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
