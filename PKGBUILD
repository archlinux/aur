# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-pip-on-top43
_pkgname=gnome-shell-extension-pip-on-top
pkgver=43.alpha
pkgrel=4
pkgdesc='Makes Picture-in-Picture windows stay on top (with GNOME 43 patches)'
url="https://github.com/Rafostar/gnome-shell-extension-pip-on-top"
arch=('any')
license=('GPL2')
depends=('gnome-shell>=43')
makedepends=('git' 'meson' 'jq')
optdepends=('clapper')
conflicts=("${pkgname%43}" "${_pkgname}-git")
provides=("${pkgname%43}")
_cvsdir="${_pkgname}-${pkgver:0:2}"
source=(
  "${_cvsdir}::git+${url}.git"
  "pr9.patch::https://patch-diff.githubusercontent.com/raw/Rafostar/gnome-shell-extension-pip-on-top/pull/9.patch"
)

b2sums=('SKIP'
        '5338861d09dd2e5a66334e2ca4f404ef09176e8e586f3b9477732c0376275048ece6825982dfb68a7c60b9d3e17d07c56dace8a1621a4b2aec5bab46d45e9829')

prepare() {
  cd "${_cvsdir}"

  # [emansom] Mark as GNOME 43 compatible
  # https://github.com/Rafostar/gnome-shell-extension-pip-on-top/pull/9
  patch --forward --strip=1 --input="${srcdir}/pr9.patch"

  ./translate.sh
}

build() {
  cd "${_cvsdir}"
  ./bundle.sh
}

package() {
  cd "${_cvsdir}"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar --uid 0 --gid 0 -xvf ${uuid}.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"

  # this file is generated at pkg install time
  #rm "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"
}

# vim: ts=2 sw=2 et:
