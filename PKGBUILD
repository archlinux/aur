# Maintainer: gaou-piou
pkgname=gnome-shell-extension-silver-dock-git
_uuid=silver-dock@simonlinuxcraft.github.io
pkgver=1.7.r52.gbecab9d
pkgrel=1
pkgdesc="A dock for GNOME Shell that can also hold the top bar's menu, clock and tray"
arch=('any')
url="https://github.com/simonlinuxcraft/silver-dock"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=('git' 'gettext')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git"
        'gnome51-shader-snippet.patch')
sha256sums=('SKIP'
            '4dd6acf3fdb833c68d772c82ff7b102900946721921b4c6bdd546a00e5923bd7')

pkgver() {
  cd "${pkgname%-git}"
  local _ver
  _ver=$(sed -n 's/.*"version-name": *"\(.*\)".*/\1/p' metadata.json)
  printf '%s.r%s.g%s' "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  # Upstream lists GNOME Shell 46-50 only. mutter 51 removed
  # Clutter.ShaderEffect.set_shader_source, so the blur mask moves to a Cogl.Snippet there
  # (old path kept for 46-50). Drop both once upstream supports 51.
  patch -Np1 -i "$srcdir/gnome51-shader-snippet.patch"
  grep -q '"51"' metadata.json || sed -i 's/^\(\s*\)"50"$/\1"50",\n\1"51"/' metadata.json
}

build() {
  cd "${pkgname%-git}"
  local _po _lang
  for _po in po/*.po; do
    _lang=$(basename "$_po" .po)
    mkdir -p "build/locale/$_lang/LC_MESSAGES"
    msgfmt -o "build/locale/$_lang/LC_MESSAGES/silver-dock.mo" "$_po"
  done
}

package() {
  cd "${pkgname%-git}"
  local _dir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

  install -Dm644 -t "$_dir" *.js metadata.json stylesheet.css
  install -Dm644 -t "$pkgdir/usr/share/glib-2.0/schemas" schemas/*.gschema.xml

  if [ -d build/locale ]; then
    cp -r build/locale "$pkgdir/usr/share/"
  fi

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
