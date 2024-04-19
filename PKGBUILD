# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=gnome-shell-extension-gnome-clipboard-history-git
pkgver=37.r263.gcb3cca8
pkgrel=1
pkgdesc="Gnome Clipboard History is a Gnome extension that saves what you've copied into an easily accessible, searchable history panel."
arch=('any')
url="https://github.com/SUPERCILEX/gnome-clipboard-history"
license=(
  'MIT'
)
depends=(
  'gnome-shell>=1:46'
)
makedepends=(
  'git'
  'zip'
)
provides=(
  "${pkgname%-git}"
)
conflicts=(
  "${pkgname%-git}"
  "gnome-shell-extension-clipboard-indicator-git"
  "gnome-shell-extension-clipboard-indicator"
)
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$(dirname "$(find . -name 'metadata.json' -print -quit)")"
  make bundle
}

package() {
  local uuid
  local schema
  local destdir

  cd "$(dirname "$(find . -name 'metadata.json' -print -quit)")"

  uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  schema=org.gnome.shell.extensions.clipboard-indicator.gschema.xml
  destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf "bundle.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/"

  install -Dm644 "$destdir/schemas/$schema" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/schemas/"

  cp -r "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/locale" "$pkgdir/usr/share/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/locale/"

  install -Dm644 "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/LICENSE" -t \
    "$pkgdir/usr/share/licenses/${pkgname}"
  rm -f "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/LICENSE"

  install -Dm644 "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/README.md" -t \
    "$pkgdir/usr/share/doc/${pkgname}"
  rm -f "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/README.md"
}
