# Maintainer: sfs <sfslinux@gmail.com>

pkgname=gnome-desktop-item-edit
pkgver=3.30.0
pkgrel=1
pkgdesc="Legacy GNOME desktop launcher editor"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/gnome-panel"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
depends=(
  'gtk3'
  'glib2'
  'gdk-pixbuf2'
  'desktop-file-utils'
)
makedepends=(
  'gcc'
  'pkgconf'
  'gettext'
  'vala'
)
source=(
  "https://download.gnome.org/sources/gnome-panel/3.30/gnome-panel-3.30.0.tar.xz"
  'gnome-desktop-item-edit.desktop'
  'panel-ditem-editor-localization.patch'
  'desktop-item-manager.vala'
  'desktop-item-manager.desktop'
)
sha256sums=(
  'c3a977d27c688235340a1a853aae3c387d82bc69556e9864a9f53ca24905c3ed'
  '5e4316b7e49f7e72597fa0a9657ea06ae95f9375db77b4a9618f412ded70a135'
  '21345814f852acab9e105d37923adb15299c0a5fb540a0e92ad40d42ecc8615e'
  '5073f2d91dfea2c90637453a1899cb6b5e0ef37ba055820198c56e53379095c7'
  '8d4e3e0bbfc2674f5e50c1fd89b692309944c29aaececfbaadef25a30bc3f52c'
)

prepare() {
  cd "${srcdir}/gnome-panel-${pkgver}"
  patch -Np1 -i "${srcdir}/panel-ditem-editor-localization.patch"
}

build() {
  cd "${srcdir}/gnome-panel-${pkgver}"

  cat > config.h << 'EOF'
#pragma once
EOF

  gcc -O2 -Wall -Wextra \
    -DGETTEXT_PACKAGE='"gnome-desktop-item-edit"' \
    -DGNOMELOCALEDIR='"/usr/share/locale"' \
    -DPANELDATADIR='"/usr/share/gnome-panel"' \
    -DDATADIR='"/usr/share"' \
    -I"${srcdir}/gnome-panel-${pkgver}" \
    -I"${srcdir}/gnome-panel-${pkgver}/gnome-panel" \
    -I"${srcdir}/gnome-panel-${pkgver}/gnome-panel/libpanel-util" \
    gnome-panel/gnome-desktop-item-edit.c \
    gnome-panel/panel-ditem-editor.c \
    gnome-panel/panel-util.c \
    gnome-panel/libpanel-util/panel-error.c \
    gnome-panel/libpanel-util/panel-glib.c \
    gnome-panel/libpanel-util/panel-gtk.c \
    gnome-panel/libpanel-util/panel-keyfile.c \
    gnome-panel/libpanel-util/panel-xdg.c \
    gnome-panel/libpanel-util/panel-icon-chooser.c \
    -o gnome-desktop-item-edit \
    $(pkg-config --cflags --libs gtk+-3.0 gio-2.0 gdk-pixbuf-2.0 gmodule-2.0)

  valac --pkg gtk+-3.0 --pkg gio-2.0 --pkg gio-unix-2.0 --pkg posix -X -O2 \
    -o ${srcdir}/desktop-item-manager \
    "${srcdir}/desktop-item-manager.vala"
}

package() {
  cd "${srcdir}/gnome-panel-${pkgver}"

  install -Dm755 gnome-desktop-item-edit "${pkgdir}/usr/bin/gnome-desktop-item-edit"
  install -Dm644 "${srcdir}/gnome-desktop-item-edit.desktop" "${pkgdir}/usr/share/applications/gnome-desktop-item-edit.desktop"
  install -Dm644 data/16x16/gnome-panel-launcher.svg "${pkgdir}/usr/share/pixmaps/gnome-panel-launcher.svg"
  install -Dm644 "${srcdir}/desktop-item-manager.desktop" "${pkgdir}/usr/share/applications/desktop-item-manager.desktop"
  install -Dm755 ${srcdir}/desktop-item-manager "${pkgdir}/usr/bin/desktop-item-manager"

  local po lang pot merged_po

  pot="${srcdir}/gnome-desktop-item-edit.pot"
  xgettext --from-code=UTF-8 \
    --keyword=_ --keyword=N_ \
    -o "${pot}" \
    gnome-panel/gnome-desktop-item-edit.c \
    gnome-panel/panel-ditem-editor.c \
    gnome-panel/panel-util.c \
    gnome-panel/libpanel-util/panel-error.c \
    gnome-panel/libpanel-util/panel-icon-chooser.c

  for po in po/*.po; do
    lang="${po##*/}"
    lang="${lang%.po}"
    merged_po="${srcdir}/${lang}.gnome-desktop-item-edit.po"
    msgmerge --quiet "${po}" "${pot}" -o "${merged_po}"
    msgfmt "${merged_po}" -o "${srcdir}/${lang}.mo"
    install -Dm644 "${srcdir}/${lang}.mo" "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/gnome-desktop-item-edit.mo"
  done

}
