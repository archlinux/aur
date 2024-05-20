# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgbase=libastal-git
pkgname=("libastal-git" "python-libastal-git" 
         "lua-libastal-git" "lua51-${pkgbase}" "lua53-${pkgbase}")
_pkgname=libastal
pkgver=r4.913738c
pkgrel=1
pkgdesc="Building blocks for building desktop shells."
arch=("x86_64")
license=("GPL-3")
# url="https://github.com/astal-sh/libastal"
url="file:///home/kotontrion/Projects/github/libastal"
makedepends=(
  "git"
  "gobject-introspection" "meson" "vala"
  "python-poetry" "python-build" "python-installer"
  "lua" "lua51" "lua53" "luarocks")
depends=("glib2" "glibc" "gtk3" "gtk-layer-shell")
source=("git+${url}")
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

  cd python
  python -m build --wheel --no-isolation
}

package_libastal-git() {
  provides=(libastal libastal.so=0-64)
  cd $srcdir/$_pkgname
  meson install -C build --destdir "$pkgdir"
}

package_python-libastal-git() {
  depends=("libastal-git" "python" "python-gobject")
  pkgdesc="python bindings for libstal."
  cd $srcdir/$_pkgname/python
  python -m installer --destdir="$pkgdir" dist/*.whl
}


_package_lua() {
  cd $srcdir/$_pkgname/lua
	depends=("libastal-git" "${pkgname%-*-git}" "${pkgname%-*-git}-lgi")
	luarocks --lua-version $1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest -- "$_rockname"
}

package_lua-libastal-git() {
  _package_lua 5.4
}

package_lua51-libastal-git() {
  _package_lua 5.1
}


package_lua53-libastal-git() {
  _package_lua 5.3
}
