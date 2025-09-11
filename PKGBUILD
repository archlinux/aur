# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=lib32-libxml2-legacy
pkgver=2.13.9
pkgrel=2
pkgdesc="XML C parser and toolkit (32-bit) (legacy version)"
url="https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home"
arch=(x86_64)
license=(MIT)
depends=(
  lib32-glibc
  lib32-icu
  lib32-xz
  lib32-zlib
	libxml2-legacy
)
makedepends=(
  git
	lib32-readline
  meson
	python
)
source=(
  "git+https://gitlab.gnome.org/GNOME/libxml2.git#tag=v$pkgver"
  https://www.w3.org/XML/Test/xmlts20130923.tar.gz
  0001-meson-Build-fixes.patch
)
b2sums=('2ecf342241b35f7949e02b1ababac869d92763957289bac9f5ce6a8d1873fa24cdcf9508baf370645075a9cff8af95e7e9152e81f33f7d1431f8540da47b37f2'
        '63a47bc69278ef510cd0b3779aed729e1b309e30efa0015d28ed051cc03f9dfddb447ab57b07b3393e8f47393d15473b0e199c34cb1f5f746b15ddfaa55670be'
        '0794a8414c333a47eca8d6a095cf2f81c4c63473e005bd7a039fa7a2e22a94e1fcd21b416418c8f370efed876e1e43c01df5ac220fef4297e79b62fc586b32ea')

_prefix=usr/lib32/$pkgname

prepare() {
  cd libxml2

  # Use xmlconf from conformance test suite
  ln -s ../xmlconf

  # Meson fixes
  git apply -3 ../0001-meson-Build-fixes.patch
}

build() {
  local meson_options=(
    --prefix /$_prefix
		--cross-file lib32

		-D http=true
    -D icu=enabled
		-D legacy=true
    -D python=false
  )

  arch-meson libxml2 build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_lib32-libxml2-legacy() {
  provides=(libxml2.so)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  mv $_prefix/lib32/libxml2.so.* -t usr/lib32
  ln -sr usr/lib32/libxml2.so.2 -t $_prefix/lib32

  rm -r $_prefix/{bin,share}

  install -Dm644 "$srcdir/libxml2/Copyright" -t usr/share/licenses/$pkgname
}

# vim:set sw=2 sts=-1 et:
