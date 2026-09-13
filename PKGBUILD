# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-mosaic
_app_id=com.github.jardon.gnome-mosaic
pkgver=1.7.0
pkgrel=1
_nodeversion=20
pkgdesc="GNOME window tiling extension"
arch=('any')
url="https://github.com/jardon/gnome-mosaic"
license=('GPL-3.0-or-later')
depends=(
  'gnome-shell'
  'xorg-xprop'
)
makedepends=(
  'jq'
  'nvm'
)
checkdepends=('desktop-file-utils')
optdepends=('gnome-shell-extensions: for Native Window Placment extension')
source=("gnome-mosaic-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        '50_org.gnome.desktop.wm.keybindings.gnome-mosiac.gschema.override'
        '50_org.gnome.mutter.keybindings.gnome-mosaic.gschema.override'
        '50_org.gnome.mutter.wayland.keybindings.gnome-mosaic.gschema.override'
        '50_org.gnome.settings-daemon.plugins.media-keys.gnome-mosaic.gschema.override'
        '50_org.gnome.shell.keybindings.gnome-mosaic.gschema.override')
sha256sums=('4479469a413e2d91eb0d9bce4d69e678dc822651074033ab6ee233fba2b55bb6'
            '484bf48f12d2fa503c27ed34f6d190edb94ec844a0b49c6ff1bda872081e6b64'
            'f98115fbf502394ffb2eb2a38452a743ab087eadef7e009c62e93ee15c9f3849'
            'd3a4ac86303c9065fd76dace64283573079c3bdce4b9a2ca18be5f103eb6fd4c'
            'a6ed6eed9fba7ab0668caa5cb93f56152cd90e1047b4bdfd76dc5b5f8862b6fd'
            '7ebe94923b20c2bfc2382945ad635620f1b460c06e01694bb57074625414547e')

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"

  # The init script returns 3 if version specified
  # in ./.nvmrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd "gnome-mosaic-$pkgver"
  _ensure_local_nvm
  nvm install "${_nodeversion}"

  export npm_config_cache="$srcdir/npm_cache"
  npm install typescript@5.7.3

  # Extension path
  sed -i 's|~/.local|/usr|g' "${_app_id}-exceptions.desktop"
}

build() {
  cd "gnome-mosaic-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  export PATH="node_modules/.bin:${PATH}"
  _ensure_local_nvm
  make compile
  make translations
}

check() {
  cd "gnome-mosaic-$pkgver"
  desktop-file-validate "${_app_id}-exceptions.desktop"
}

package() {
  cd "gnome-mosaic-$pkgver"
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  cp -rv _build/* "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"

   mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dvm644 schemas/*.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"

  install -Dvm644 "${_app_id}-exceptions.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dvm644 icons/mosaic-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}-exceptions.svg"
  install -Dvm644 keybindings/*.xml -t "$pkgdir/usr/share/gnome-control-center/keybindings/"
  install -Dvm644 SHORTCUTS.md -t "$pkgdir/usr/share/doc/$pkgname/"

  install -Dvm644 "$srcdir"/*.gnome-mosaic.gschema.override -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
}
