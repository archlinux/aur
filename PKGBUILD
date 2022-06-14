# Maintainer: dreieck
# Contributor: jmerdich
# Contributor: foo <foo(at)gmail(dot)com>
# Contributor: bar <bar(at)gmai(dot)com>

_pkgname=tty0tty
pkgname=tty0tty-dkms-git
pkgver=1.2+41.r57.20220526.c0e85cf
pkgrel=3
pkgdesc="tty0tty Virtual Serial Cable (DKMS and userspace variant)."
arch=(
  'i686'
  'x86_64'
)
url="https://github.com/freemed/tty0tty"  # Version 1.2
# url="https://github.com/lcgamboa/tty0tty" # Version 1.3
license=(
  'GPL2'
)
depends=('dkms')
makedepends=('git')
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-pts=${pkgver}"
  "${_pkgname}-doc=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-pts"
)
source=(
  "${_pkgname}::git+${url}.git"
  '50-tty0tty.rules.arch.patch'
  'modules-load-tty0tty.conf'
)
sha256sums=(
  'SKIP'
  '7db1bdf3aaf90b6e0c8ebe522f73a0947e35f37a47047f7ae4953d0208c3d541'
  '31e97d1ea45da90c70715073d2279fc9482e497179b4fc44645684ffe7371217'
)

prepare() {
  cd "${srcdir}/${_pkgname}/module"

  patch -p1 -N '50-tty0tty.rules' < "${srcdir}/50-tty0tty.rules.arch.patch"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed 's|^[vV]||' | sed 's|-[^-]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}/pts"

  make
}

package() {
  cd "${srcdir}"

  # Install
  #msg2 "Copying DKMS module..."

  # Copy dkms.conf
  install -D -v -m644 "${_pkgname}/debian/tty0tty-dkms.dkms" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

  # Set name and version
  sed -e "s/\#MODULE_VERSION\#/${pkgver}/" \
      -i "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

  # Copy sources (including Makefile)
  cp -rv "${_pkgname}/module/"* "${pkgdir}/usr/src/${_pkgname}-${pkgver}"/

  # Copy udev rules
  install -D -v -m644 "${_pkgname}/module/50-tty0tty.rules" "${pkgdir}/usr/lib/udev/rules.d/50-tty0tty.rules"

  # Install userspace software
  install -D -v -m755 "${_pkgname}/pts/tty0tty" "${pkgdir}/usr/bin/tty0tty"

  # Install documentation
  for _docfile in AUTHORS INSTALL README.md THANKS TODO; do
    install -D -v -m644 "${srcdir}/${_pkgname}/${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 'modules-load-tty0tty.conf' "${pkgdir}/usr/share/doc/${_pkgname}/modules-load-tty0tty.conf"
  cp -rv "${_pkgname}/examples" "${pkgdir}/usr/share/doc/${_pkgname}/examples"

  # Install license information
  install -D -v -m644 "${srcdir}/${_pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/COPYING"
}
