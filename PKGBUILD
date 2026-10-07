# Maintainer: Mario Finelli <mario at finel dot li>

# this should match the version listed in src/lib/common/constants.ts
_highlightver=11.11.1

pkgname=gnome-shell-extension-copyous
pkgver=2.0.1
pkgrel=2
pkgdesc="Modern Clipboard Manager for GNOME"
arch=(any)
url=https://github.com/boerdereinar/copyous
license=(GPL-3.0-or-later)
depends=(gnome-shell libgda6 gsound)
makedepends=(git jq meson nodejs pnpm uv)
source=($pkgname::git+$url.git#tag=v$pkgver
  https://patch-diff.githubusercontent.com/raw/boerdereinar/copyous/pull/155.patch
  https://cdnjs.cloudflare.com/ajax/libs/highlight.js/${_highlightver}/es/highlight.min.js)
sha256sums=('0fd69ed3188f109356521c76002775d953dcacea5fb182147bbb68774949e717'
            '622007b2552f2f7a95f18b44040cd6011442579c53bda33cadbee9d2ea0cd9b0'
            '7865839949f0764d9e0a21e311a4e2c42633eeaee8ca5ec127b86438565731fe')

prepare() {
  cd $pkgname

  # GNOME 51 support
  patch -p1 -N -i "${srcdir}/155.patch"

  # pnpm requires approving build scripts
  cat <<-EOF > pnpm-workspace.yaml
---
allowBuilds:
  "@parcel/watcher": true
  esbuild: true
EOF

  git submodule update --init

  # remove the install script so that it doesn't automatically call
  # "make install"
  sed -i '/"install":/d' package.json

  pnpm install --frozen-lockfile
}

build() {
  cd $pkgname

  (
    cd submodules/gnome-shell/subprojects/extensions-tool
    ./generate-translations.sh
    meson setup --buildtype=release -Dman=false build
    meson compile -C build
  )

  RELEASE=1 make build
}

package() {
  cd $pkgname/dist

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

  install -d "${destdir}"
  bsdtar xvf ${uuid}.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/" --no-same-owner
  install -Dm0644 "schemas/${schema}" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  install -Dm0644 "${srcdir}/highlight.min.js" "${destdir}/highlight.min.js"

  rm -rf "${destdir}/schemas"
}

# vim: set ts=2 sw=2 et:
