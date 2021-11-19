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
pkgrel=3
pkgdesc="A program that automatically generates CMake and Meson configuration files for your Vala project"
arch=('x86_64')
url="https://gitlab.com/rastersoft/autovala"
license=('GPL3')
groups=('vala')
makedepends=('git' 'meson' 'vala'
             'libgee' 'gedit' 'gtk3'
             'vte3' 'gtksourceview4' 'libpeas'
             'pandoc' 'gobject-introspection')
source=("git+https://gitlab.com/rastersoft/autovala#tag=$pkgver" gedit40.patch tepl.patch local.patch)
sha256sums=('SKIP'
            'c72f55685649d184da17ef47a3ecbcf9a77906e0ae7b831ca116bf06db4764b3'
            '66eba692513fb12283fef312ef39c3acb3d7705f7129addd7023ad936b0e3f0b'
            '5b40b72a328c45ff66af92bbbdf2918cdcc9c8bdd9077ba169badfa743589b66')

prepare() {
  patch -d autovala -p1 < gedit40.patch
  patch -d autovala -p1 < local.patch

  ! grep 'goto_line' /usr/share/vala/vapi/gedit.vapi && \
  patch -d autovala -p1 < tepl.patch

  rm -rf build build-gedit
}

build() {
  arch-meson autovala build
  ninja -C build

  for each in build/meson-uninstalled/*-uninstalled.pc;do
    cp "$each" ${each%-*}.pc
  done

  arch-meson autovala/gedit_plugin \
    build-gedit \
    --pkg-config-path build/meson-uninstalled
  ninja -C build-gedit
}

package_autovala() {
  depends=('make' 'vte3' 'libgee'
           'bash-completion')
  DESTDIR="$pkgdir" meson install -C build
  mv "$pkgdir/usr"{,/share}/appdata
  rm -rf "$pkgdir"/usr/share/doc/autovala/CMakeLists.txt
}

package_gedit-autovala() {
  depends=(autovala gedit)
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
