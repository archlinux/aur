# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-gpu-profile-selector-git
_uuid=GPU_profile_selector@lorenzo9904.gmail.com
pkgver=48.r1.g6d93636
pkgrel=1
epoch=1
pkgdesc="Provides a simple way to switch between GPU profiles on NVIDIA Optimus systems"
arch=('any')
url="https://github.com/LorenzoMorelli/GPU_profile_selector"
license=('GPL-3.0-or-later')
depends=(
  'bash'
  'envycontrol'
  'gnome-shell'
  'polkit'
)
makedepends=(
  'git'
  'jq'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/LorenzoMorelli/GPU_profile_selector.git')
sha256sums=('SKIP')

pkgver() {
  cd GPU_profile_selector
  git describe --long --tags --abbrev=7 | sed 's/^gnome-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd GPU_profile_selector
  gnome-extensions pack \
     --extra-source=img/ \
     --extra-source=lib/ \
     --extra-source=ui/ \
     --force
}

package() {
  cd GPU_profile_selector
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dvm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
