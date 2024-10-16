# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Anatol Pomozov

_gem=gtk3
pkgname="ruby-${_gem}"
pkgver=4.2.2
pkgrel=1
pkgdesc='Ruby/GTK3 is a Ruby binding of GTK+-3.x.'
arch=(x86_64)
url="https://github.com/ruby-gnome/ruby-gnome"
license=(LGPL-2.1-only)
#depends=(gobject-introspection gtk3 ruby ruby-atk ruby-cairo ruby-gdk3 ruby-gdk_pixbuf2 ruby-gio2 ruby-gobject-introspection ruby-pango)
depends=(ruby ruby-cairo-gobject ruby-glib2 ruby-pango gtk3 glibc glib2)
makedepends=(ruby-native-package-installer)
source=("ruby-gnome-${pkgver}.tar.gz::https://github.com/ruby-gnome/ruby-gnome/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('64f2f53e9733e85d1b5c10c684858ff5924a0c7175c344ed01270fc018ea983d')

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
