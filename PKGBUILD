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
pkgrel=2
pkgdesc="A program that automatically generates CMake and Meson configuration files for your Vala project"
arch=('x86_64')
url="https://gitlab.com/rastersoft/autovala"
license=('GPL3')
groups=('vala')
makedepends=('git' 'meson' 'vala'
             'libgee' 'gedit' 'gtk3'
             'vte3' 'gtksourceview4' 'libpeas'
             'pandoc' 'gobject-introspection')
source=("git+https://gitlab.com/rastersoft/autovala#tag=$pkgver" gedit40.patch tepl.patch)
sha256sums=('SKIP'
            'b69b316bca2799007a95714d2585b499e22ebcaebe348b4eafd9c2e637bac1d2'
            '146773efe896ecc5db8fa644e4be8cd6708832aa3467c44570edb3973726e794')

prepare() {
	patch -d autovala -p1 < gedit40.patch
	! grep 'goto_line' /usr/share/vala/vapi/gedit.vapi \
	&& patch -d autovala -p1 < tepl.patch
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
