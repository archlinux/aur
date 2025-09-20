# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-space-bar-git
pkgver=34.r0.g6f1df60
pkgrel=1
pkgdesc="GNOME Shell extension that shows workspaces buttons in top panel"
arch=('any')
url="https://github.com/christopher-l/space-bar"
license=('LicenseRef-unknown')
depends=('gnome-shell')
makedepends=(
  'git'
  'jq'
  'pnpm'
  'typescript'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/christopher-l/space-bar.git')
sha256sums=('SKIP')

pkgver() {
  cd space-bar
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd space-bar
  export PNPM_HOME="$srcdir/pnpm-home"
  pnpm install
  sh scripts/build.sh
}

package() {
  cd space-bar
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dvm644 target/schemas/*.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
