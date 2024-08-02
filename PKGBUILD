# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgbase=libastal-git
pkgname=("libastal-git"
         "lua-libastal-git" "lua51-${pkgbase}" "lua53-${pkgbase}")
_pkgname=libastal
pkgver=r81.a0680e3
pkgrel=1
pkgdesc="Building blocks for building desktop shells."
arch=("x86_64")
license=(LGPL-2.1-only)
url="https://github.com/astal-sh/libastal"
makedepends=(
  "git"
  "gobject-introspection" "meson" "vala"
  "lua" "lua51" "lua53" "luarocks")
depends=("glib2" "glibc" "gtk3" "gtk-layer-shell")
groups=("libastal")
source=("git+${url}.git")
sha256sums=("SKIP")
_rockname=astal-dev-1.rockspec

pkgver(){
  cd $srcdir/$_pkgname
  # git describe --long --tags --abbrev=7 | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  arch-meson build
  meson compile -C build
}

package_libastal-git() {
  provides=(libastal libastal.so=0-64)
  cd $srcdir/$_pkgname
  meson install -C build --destdir "$pkgdir"
}


_package_lua() {
  cd $srcdir/$_pkgname/lua
	luarocks --lua-version $1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest -- "$_rockname"
}

package_lua-libastal-git() {
	depends=("libastal-git" "${pkgname%-*-git}" "${pkgname%-*-git}-lgi")
  pkgdesc="lua bindings for libstal."
  _package_lua 5.4
}

package_lua51-libastal-git() {
	depends=("libastal-git" "${pkgname%-*-git}" "${pkgname%-*-git}-lgi")
  pkgdesc="lua bindings for libstal."
  _package_lua 5.1
}


package_lua53-libastal-git() {
	depends=("libastal-git" "${pkgname%-*-git}" "${pkgname%-*-git}-lgi")
  pkgdesc="lua bindings for libstal."
  _package_lua 5.3
}
