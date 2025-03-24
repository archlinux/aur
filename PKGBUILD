# Maintainer: jzapiola <jzapiola@proton.me>

_srcname=gnome-awesome-tiles-extension
pkgname=gnome-shell-extension-awesome-tiles
pkgver=14
pkgrel=3
pkgdesc="GNOME extension to tile windows using keyboard shortcuts"
arch=('any')
url="https://github.com/velitasali/${_srcname}"
license=('GPL-3.0-or-later')
depends[125]=gnome-shell
makedepends=('git')

conflicts=('gnome-shell-extension-awesome-tiles')
provides=('gnome-shell-extension-awesome-tiles')
install=gschemas.install
source=("awesome-tiles-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('ebfe563652828380f3d2ce4bcc2722f224e04a9fec59ba4d3c461dee019f39bcf61768c657111e2f06355051736e151963e86a12c6cb6cde0af431fcae5fe317')


build () {
  _srcdir="${srcdir}/${pkgname}-${pkgver}"
  cd "${_srcdir}"
  # hotfix to enable GNOME 48 compatibility:
  if grep -qE '"47"$' src/metadata.json; then
    sed -i 's/    "47"/    "47",/; /"47",/a\ \ \ \ "48"' src/metadata.json
  fi
  ./install.sh zip
}

package () {
  _srcdir="${srcdir}/${pkgname}-${pkgver}"
  _uuid=$(find "${_srcdir}" -name metadata.json \
    -exec grep -Po '(?<="uuid": ")[^"]*' {} \;)
  destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -dm755 "${destdir}"
  bsdtar -xvf "${_srcdir}/${_uuid}"*.zip -C "${destdir}" --no-same-owner
  install "${_srcdir}/src/schemas/gschemas.compiled" "${destdir}/schemas"
  find "${_srcdir}/src/schemas" -name '*gschema.xml' \
    -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas" '{}' +
  package_20_version
}

package_20_version() {
  local compatibles=($(\
    find -path "${pkgdir}" -type d -prune -o \
    -name metadata.json -exec cat '{}' \; | \
    tr -d '\n' | grep -Po '(?<="shell-version": \[)[^\[\]]*(?=\])' | \
    tr '\n," ' '\n' | grep -v -e '^$'))
  depends+=("gnome-shell>=${compatibles[0]}")
  unset depends[125]
}
