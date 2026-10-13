# Maintainer: Mario Finelli <mario at finel dot li>

# this should match the version listed in src/lib/common/constants.ts
_highlightver=11.11.1

pkgname=gnome-shell-extension-copyous
pkgver=2.1.0
pkgrel=1
pkgdesc="Modern Clipboard Manager for GNOME"
arch=(any)
url=https://github.com/boerdereinar/copyous
license=(GPL-3.0-or-later)
depends=(gnome-shell libgda6 gsound)
makedepends=(git jq meson nodejs pnpm uv)
source=("$pkgname::git+$url.git#tag=v$pkgver"
  https://cdnjs.cloudflare.com/ajax/libs/highlight.js/${_highlightver}/es/highlight.min.js)
sha256sums=('33fef54b2ae2508b4d42e61dd60f2926a3a3a626a2fc58e9f145fecee302e0bd'
            '7865839949f0764d9e0a21e311a4e2c42633eeaee8ca5ec127b86438565731fe')

prepare() {
  cd $pkgname

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
