# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=lib32-libxml2-legacy
pkgver=2.13.8
pkgrel=1
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
b2sums=('81e02da9df8ca795ab48a26e2c3f6e728f6eb0d24431034cedd62b37704b23c5f2691984b0b6b2db0990db76703f4a312226bfcc3a73719d974f2d975b63a018'
        '63a47bc69278ef510cd0b3779aed729e1b309e30efa0015d28ed051cc03f9dfddb447ab57b07b3393e8f47393d15473b0e199c34cb1f5f746b15ddfaa55670be'
        '57bcee30778b8354b278baa937fd0051536d961aba251682e8df031421122bb53246a5d6285dc4aff7caf27659f39cd4a4a128c750fbe480b1d572243f6b59a1')

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
