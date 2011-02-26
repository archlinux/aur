# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkg=accountsservice
pkgname=${pkg}-git
pkgver=23.13.9
pkgrel=2
pkgdesc="D-Bus interface for user account query and manipulation"
url="https://gitlab.freedesktop.org/accountsservice/accountsservice"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  gcc-libs
  glib2
  glibc
  libxcrypt
  polkit
  shadow
  systemd
)
makedepends=(
  docbook-xsl
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
  vala
  xmlto
)
checkdepends=(
  glibc-locales
  python-dbusmock
  python-gobject
)
source=(
  "git+$url.git"
  accounts-daemon-restart.hook
  0001-tests-Drop-check-format-test.patch
)
b2sums=('SKIP'
        'ac1892d814c9efca38daec5b34efdee6289089df515ceeb0f675794263879506e2b59894eef6a85f52570db3bd8e62cdf15a7d980538195c5af7cba016d6a533'
        'b3d35224061a7e2c3654610d7c850b05b7c99cd0516f0a2d3ce1c49d7382b3c4ba2eefe80f50916ab1492cb42b666a6dc29f47b8cad73a9abbb8fa501822abd0')

provides=($pkg)
conflicts=($pkg)

prepare() {
  cd $pkg

  # Fix build
  # https://gitlab.archlinux.org/archlinux/packaging/packages/accountsservice/-/issues/2
  git cherry-pick -n da65bee12d9118fe1a49c8718d428fe61d232339 \
                     ad0365b77b583da06bcd1e8da4c1bed74129895a
  git apply -3 ../0001-tests-Drop-check-format-test.patch
}

build() {
  local meson_options=(
    -D admin_group=wheel
    -D docbook=true
    -D gtk_doc=true
  )

  arch-meson $pkg build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs -j1
}

package() {
  depends+=(
    libcrypt.so
    libg{lib,object,io}-2.0.so
    libsystemd.so
  )
  provides+=(libaccountsservice.so)

  meson install -C build --destdir "$pkgdir"

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
  install -d "$pkgdir/usr/share/accountsservice/interfaces"
}

# vim:set sw=2 sts=-1 et:
