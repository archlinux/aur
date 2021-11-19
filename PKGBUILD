# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Mario Steele <mario@ruby-im.net>
# from: gitlab
# what: rastersoft/autovala

pkgbase=autovala
pkgname=(
	autovala
	gedit-autovala
)
pkgver=1.16.0
pkgrel=1
pkgdesc="A program that automatically generates CMake and Meson configuration files for your Vala project"
arch=('x86_64')
url="https://gitlab.com/rastersoft/autovala"
license=('GPL3')
groups=('vala')
makedepends=('vala'
             'cmake'
             'libgee'
             'gtk3'
             'pandoc'
             'bash-completion'
             'gobject-introspection')
source=("git+https://gitlab.com/rastersoft/autovala#tag=$pkgver" gedit40.patch)
sha256sums=('SKIP'
            'SKIP')

prepare() {
	patch -d autovala -p1 < gedit40.patch
	rm -rf build build-gedit
}

build() {
  arch-meson autovala build
  meson compile -C build
  for each in build/meson-uninstalled/*-uninstalled.pc;do
    cp "$each" ${each%-*}.pc
  done
  arch-meson autovala/gedit_plugin \
    build-gedit \
    --pkg-config-path build/meson-uninstalled
  echo $LDFLAGS
  VALAFLAGS="$(echo "--"{vapidir,girdir}"=$PWD/build/src/"{autovalaLib,autovalaPlugin})" \
    meson compile -C build-gedit
}

package_autovala() {
  depends=('make'
           'bash-completion')
  DESTDIR="$pkgdir" meson install -C build
  mv "$pkgdir/usr"{,/share}/appdata
  rm -rf "$pkgdir"/usr/share/doc/autovala/CMakeLists.txt
}

package_gedit-autovala() {
  depends=(autovala gedit vte3
           libgee gtksourceview4 libpeas)
  DESTDIR="$pkgdir" meson install -C build-gedit
  mv "$pkgdir"/usr/lib/gedit/plugins/autovala/libautovalagedit.so{.1.0.0,}
  
  rm -rf \
    "$pkgdir"/usr/lib/pkgconfig \
    "$pkgdir"/usr/lib/gedit/plugins/autovala/libautovalagedit.so.* \
    "$pkgdir"/usr/lib/gedit/plugins/autovala/autovalagedit{.h,.vapi,-1.0.gir,-1.0.typelib} \
    "$pkgdir"/usr/share/autovala_gedit \
    "$pkgdir"/usr/share/doc \
    "$pkgdir"/usr/share/vala
}
