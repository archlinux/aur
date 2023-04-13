# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

pkgname=return-to-the-roots-maps-git
pkgver=r5.20220122.ad6d25a
pkgrel=1
pkgdesc="Maps from the Return to the Roots-Project."
arch=("any")
url="https://siedler25.org/"
license=("GPL3")
makedepends=(
  "git"
)
depends=()
optdepends=(
  "return-to-the-roots: To play the maps in the native engine."
  "widelands-maps-rttr: To play the maps in widelands (some things might not completely work)."
)
provides=(
  "return-to-the-roots-maps=${pkgver}"
  "s25rttr-maps=${pkgver}"
)
conflicts=(
  "return-to-the-roots-maps"
  "s25rttr-maps"
)
options=('emptydirs')
source=(
  "git+https://github.com/Return-To-The-Roots/s25maps.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/s25maps"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Could not determine git commit count."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi

}

package() {
  cd "${srcdir}/s25maps"

  install -d -v -m755 "${pkgdir}/usr/share/s25rttr/RTTR/MAPS"
  for _dir in `find -mindepth 1 -maxdepth 1 -type d -name '[a-zA-Z0-9]*'`; do
    install -d -v -m755 "${pkgdir}/usr/share/s25rttr/RTTR/MAPS/${_dir}"
    for _map in "${_dir}"/*; do
      install -D -v -m644 "${_map}" "${pkgdir}/usr/share/s25rttr/RTTR/MAPS/${_dir}/$(basename "${_map}")"
    done
  done

  install -D -v -m644 README.md "${pkgdir}/usr/share/doc/return-to-the-roots-maps/README.md"
  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
