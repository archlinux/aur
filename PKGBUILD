# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=gnome-shell-extension-appindicator43
_pkgname=gnome-shell-extension-appindicator
pkgver=43.alpha
pkgrel=3
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
conflicts=(${_pkgname} "${_pkgname}-git")
provides=(${_pkgname})
_commit=88b55be5b10b7fec304f8e4d08c06e82b1eed8a3 # master
source=(
  "${_pkgname}-${pkgver}::git+https://github.com/ubuntu/${_pkgname}.git#commit=${_commit}"
  "pr351.patch::https://patch-diff.githubusercontent.com/raw/ubuntu/gnome-shell-extension-appindicator/pull/351.patch"
)
sha256sums=('SKIP'
            '2807e0059dd0a227c8f9cf17efab15e727fba6088b2f1628483d4953e76c2118')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/pr351.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  meson --prefix=/usr build/
  ninja -C build/
}

package() {
  cd "${_pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build/ install
  # this file is generated at pkg install time
  rm "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"
}

# vim: ts=2 sw=2 et:
