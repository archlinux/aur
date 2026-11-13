# Maintainer: George Alexiou <goten002@gmail.com>

pkgname=gnome-shell-extension-ai-usagebar
_uuid=ai-usagebar@wilfison
pkgver=1.6.0
pkgrel=1
pkgdesc="Show AI plan usage (Claude, Codex, OpenRouter and more) in the GNOME Shell top panel"
arch=('any')
url="https://github.com/wilfison/ai-usagebar"
license=('MIT')
depends=('gnome-shell>=1:47' 'libsoup3' 'libadwaita')
makedepends=('gettext' 'glib2')
checkdepends=('gjs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7cf5271cd2fda6a678c83b0e3811a1d1d9a0143e9d5c2808cd91709b93af889c')

build() {
  cd "ai-usagebar-${pkgver}"

  # Same artifacts `gnome-extensions pack` would produce: compiled schema + .mo catalogs.
  glib-compile-schemas --strict schemas/

  local po lang
  for po in po/*.po; do
    lang="$(basename "$po" .po)"
    install -d "locale/${lang}/LC_MESSAGES"
    msgfmt -o "locale/${lang}/LC_MESSAGES/${_uuid}.mo" "$po"
  done
}

check() {
  cd "ai-usagebar-${pkgver}"
  gjs -m tests/run.js
}

package() {
  cd "ai-usagebar-${pkgver}"
  local dest="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d "$dest"
  install -m644 -t "$dest" extension.js prefs.js metadata.json stylesheet.css
  cp -r --no-preserve=mode,ownership lib ui icons schemas locale "$dest/"
  rm -f "$dest/icons/README.md"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
