# Maintainer:  dreieck

_pkgname="firefox-developer-edition-firefox-symlink"
pkgname="${_pkgname}-latest"
pkgver=91.0b7
pkgrel=3
pkgdesc="Adds a 'firefox'-symlink for 'firefox-developer-edition'. Also symlinks icon- and .desktop-files."
arch=("any")
license=('custom: public domain')
depends=("firefox-developer-edition")
provides=(
  "${_pkgname}=${pkgver}"
  "firefox=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "firefox"
)

source=('license-metapackage-pd.txt')
sha256sums=('1e86f8ac1ad7315c76f4db8bf6a1dbdde6825ac95ff468e431bbe452b6865ae6')

pkgver() {
  pacman -Qi firefox-developer-edition | grep -E '^Version[[:space:]]*:' | head -n 1 | awk -F ':' '{print $2}' | sed -E 's|-.*||' | tr -d '[[:space:]]'
}

package() {
  install -d -v -m755 "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  ln -s -v -T "firefox-developer-edition" "firefox"

  pacman -Qql firefox-developer-edition | grep -E '^/usr/share/applications/' | while read _f; do
    if [ -f "${_f}" ]; then
      install -d -v -m755 "${pkgdir}$(dirname "${_f}")"
      cd "${pkgdir}$(dirname "${_f}")"
      ln -s -v -T "$(basename ${_f})" "$(basename ${_f} | sed 's|-developer-edition||')"
    fi
  done

  pacman -Qql firefox-developer-edition | grep -E '^/usr/share/icons/' | while read _f; do
    if [ -f "${_f}" ]; then
      install -d -v -m755 "${pkgdir}$(dirname "${_f}")"
      cd "${pkgdir}$(dirname "${_f}")"
      ln -s -v -T "$(basename ${_f})" "$(basename ${_f} | sed 's|-developer-edition||')"
    fi
  done

  install -D -m644 "${srcdir}/license-metapackage-pd.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
}
