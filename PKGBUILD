# Maintainer: Fabian Bornschein <fabiscafe-at-mailbox-dot-org>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=gnome-shell-extension-appindicator43
_pkgname=gnome-shell-extension-appindicator
pkgver=42+r8+g794c4a7
pkgrel=1
pkgdesc='AppIndicator/KStatusNotifierItem support for GNOME Shell (with GNOME 43 patches)'
url='https://github.com/ubuntu/gnome-shell-extension-appindicator'
arch=('any')
license=('GPL')
depends=('gnome-shell>=43')
makedepends=('git' 'meson' 'jq')
optdepends=(
  'libappindicator-gtk2: support GTK+2 applications'
  'libappindicator-gtk3: support GTK+3 applications'
)
_commit=794c4a7471932a72f46c7a8146d1e5c2bcec1f07 # master
source=(
  "git+https://github.com/ubuntu/${_pkgname}.git#commit=${_commit}"
  "gnome43-comp.patch::https://patch-diff.githubusercontent.com/raw/ubuntu/gnome-shell-extension-appindicator/pull/364.patch"
)
sha256sums=('SKIP'
            'e41495987e1363154d79231fc697d5202b254028136501bd4dd0b3d74a395783')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd "${_pkgname}"
  patch --forward --strip=1 --input="${srcdir}/gnome43-comp.patch"
}

build() {
  cd "${_pkgname}"
  meson --prefix=/usr build/
  ninja -C build/
}

package() {
  cd "${_pkgname}"
  DESTDIR="${pkgdir}" ninja -C build/ install
  # this file is generated at pkg install time
  rm "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"
}

# vim: ts=2 sw=2 et:
