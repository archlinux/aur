# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-power-profile-switcher-git
pkgver=r254.16c4573
pkgrel=1
pkgdesc="GNOME extension to automatically switch between power profiles based on power supply."
arch=('any')
url="https://github.com/eliapasquali/power-profile-switcher"
license=('GPL-3.0-or-later')
depends=(
  'gnome-shell'
  'power-profiles-daemon'
)
makedepends=(
  'git'
  'jq'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/eliapasquali/power-profile-switcher.git')
sha256sums=('SKIP')

pkgver() {
  cd power-profile-switcher
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd power-profile-switcher
}

build() {
  cd power-profile-switcher
  gnome-extensions pack --force \
    --extra-source=ui
}

package() {
  cd power-profile-switcher
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dvm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
