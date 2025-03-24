# Maintainer: jzapiola <jzapiola@proton.me>

_srcname=gnome-awesome-tiles-extension
pkgname=gnome-shell-extension-awesome-tiles-git
pkgver=14.r4.g0a23c7c
pkgrel=2
pkgdesc="GNOME extension to tile windows using keyboard shortcuts"
arch=('any')
url="https://github.com/velitasali/${_srcname}"
license=('GPL-3.0-or-later')
depends[125]=gnome-shell
makedepends=('git')

conflicts=('gnome-shell-extension-awesome-tiles')
provides=('gnome-shell-extension-awesome-tiles')
install=gschemas.install
source=("git+${url}.git")
sha512sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_srcname}"
  git describe --long --tags | \
    sed -r 's/extensions.gnome.org.//;s/([^-]*-g)/r\1/;s/-/./g'
}

build () {
  cd "${srcdir}/${_srcname}"
  # hotfix to enable GNOME 48 compatibility:
  if grep -qE '"47"$' src/metadata.json; then
    sed -i 's/    "47"/    "47",/; /"47",/a\ \ \ \ "48"' src/metadata.json
  fi
  ./install.sh zip
}

package () {
  _uuid=$(find "${srcdir}/${_srcname}" -name metadata.json \
    -exec grep -Po '(?<="uuid": ")[^"]*' {} \;)
  destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -dm755 "${destdir}"
  bsdtar -xvf "${srcdir}/${_srcname}/${_uuid}"*.zip -C "${destdir}" --no-same-owner
  install "${srcdir}/${_srcname}/src/schemas/gschemas.compiled" "${destdir}/schemas"
  find "${srcdir}/${_srcname}/src/schemas" -name '*gschema.xml' \
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
