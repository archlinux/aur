# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-pip-on-top-gnome43
_pkgname=gnome-shell-extension-pip-on-top
pkgver=43.alpha
pkgrel=2
pkgdesc='Makes Picture-in-Picture windows stay on top'
url="https://github.com/Rafostar/gnome-shell-extension-pip-on-top"
arch=('any')
license=('GPL2')
depends=('gnome-shell>=43')
makedepends=('git' 'meson' 'jq')
optdepends=('clapper')
conflicts=("${pkgname%-gnome43}" "${_pkgname}-git")
provides=("${pkgname%-gnome43}")
_cvsdir="${_pkgname}-${pkgver:0:2}"
source=(
  "${_cvsdir}::git+${url}.git"
  "pr9.patch::https://patch-diff.githubusercontent.com/raw/Rafostar/gnome-shell-extension-pip-on-top/pull/9.patch"
)

b2sums=('SKIP'
        '259ad5ddb14501b9bd7df77a38e17101d1ddee9e4cce276a2392fd678178a28c766ef3045bba1bae306aba4c3e812f3576ba5869c41a24034b0e1c90c11f9330')

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
