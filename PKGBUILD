# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail dot com>
pkgname=gnome-shell-extension-arch-update-git
pkgver=66.r0.gcabd7c3
pkgrel=1
pkgdesc="Update indicator for ArchLinux and GNOME Shell"
arch=('any')
url="https://codeberg.org/RaphaelRochet/arch-update"
license=('GPL-3.0-or-later')
depends=(
  'gnome-shell'
  'pacman-contrib'
  'xdg-utils'
)
makedepends=(
  'git'
  'jq'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://codeberg.org/RaphaelRochet/arch-update.git')
sha256sums=('SKIP')

pkgver() {
  cd arch-update
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd arch-update
  gnome-extensions pack \
    --extra-source=icons/ \
    --extra-source=prefs.xml \
    --force
}

package() {
  cd arch-update
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
   bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dvm644 schemas/org.gnome.shell.extensions.arch-update.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"

  cd locale
  for lang in $(ls -d */); do
    install -Dm644 "${lang}/LC_MESSAGES/arch-update.mo" -t \
      "$pkgdir/usr/share/locale/${lang}/LC_MESSAGES/"
  done
}
