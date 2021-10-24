# Maintainer:  dreieck
# Contributor: Claudia Pellegrino <aur ät cpellegrino.de>

_pkgname="firefox-developer-edition-firefox-symlink"
pkgname="${_pkgname}-latest"
pkgver=96.0b6
pkgrel=1
pkgdesc="Adds a 'firefox'-symlink for 'firefox-developer-edition'. Also symlinks extensions, icon- and .desktop-files."
arch=("any")
url='https://aur.archlinux.org/packages/firefox-developer-edition-firefox-symlink-latest'
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
install="${_pkgname}.install"

source=(
  'firefox-developer-edition-firefox-symlinks-create.bash'
  'firefox-developer-edition-firefox-symlinks-delete.bash'
  "${_pkgname}.hook"
  'license-metapackage-pd.txt'
)
sha256sums=(
  'd64c249647cf5c31757a2398e067b48009941d24395637e974aeb842d13b8b95'
  '2c0a6ff047c163df20d9b3248595ee19de7498d8b5a9c65df4a07260014b3538'
  '24ef877acd05f7e352f1841efce4e1bcd1d9163b3883f73e9cc6de918301f50e'
  '1e86f8ac1ad7315c76f4db8bf6a1dbdde6825ac95ff468e431bbe452b6865ae6'
)

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

  install -D -m 755 -T \
    "${srcdir}/${_pkgname}s-create.bash" \
    "${pkgdir}/usr/share/libalpm/scripts/${_pkgname}s-create"
  install -D -m 755 -T \
    "${srcdir}/${_pkgname}s-delete.bash" \
    "${pkgdir}/usr/share/libalpm/scripts/${_pkgname}s-delete"
  install -D -m 644 -T \
    "${srcdir}/${_pkgname}.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/${_pkgname}.hook"
  install -D -m 644 -T \
    "${srcdir}/license-metapackage-pd.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
}
