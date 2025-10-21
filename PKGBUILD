# Maintainer: Alexander Ellul (aellul27) <igsalexcodes@gmail.com>

pkgname=libfprint-06cb-00e9
_pkgdirname=libfprint
pkgver=1.94.9
pkgrel=1
pkgdesc="Library for fingerprint readers with support for 06cb:00e9. See this issue: https://gitlab.freedesktop.org/libfprint/libfprint/-/issues/614"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  gcc-libs
  glib2
  glibc
  libgudev
  libgusb
  openssl
  pixman
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
  python-cairo
  python-gobject
  systemd
)
checkdepends=(
  cairo
  umockdev
)
provides=(
	"libfprint=1.94.9"
	'libfprint-2.so'
)	
groups=(fprint)
conflicts=(libfprint)
source=("git+https://gitlab.freedesktop.org/libfprint/libfprint.git?signed#tag=v$pkgver"
	enable-device-06cb-00e9.patch)
b2sums=('970efc1df914f49886bc5ce48f7a0f8836766cb249399f05edc72986d1e7e8956917f958313551295c952b94885ac33d92fbd0c8d6974306371759b544dcbd40'
	'a79df5e916b02e0998d1688265dbf6e7c002869259e9d308df2fc45c3c5f3b778c4d380bb5baa36940acd07913a79db66430b65122f12a55ae42e4d9463eccd4')
validpgpkeys=(
  D4C501DA48EB797A081750939449C2F50996635F # Marco Trevisan (Treviño) <mail@3v1n0.net>
)

prepare() {
  cd $_pkgdirname
  patch -Np1 -i ../enable-device-06cb-00e9.patch
}

build() {
  local meson_options=(
    # Add virtual drivers for integration tests (e.g. in fprintd)
    -D drivers=all

    -D installed-tests=false
  )

  arch-meson $_pkgdirname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
