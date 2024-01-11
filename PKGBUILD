# Maintainer: dreieck
# Contributor: jmerdich
# Contributor: foo <foo(at)gmail(dot)com>
# Contributor: bar <bar(at)gmai(dot)com>

_pkgname=tty0tty
pkgname=tty0tty-dkms-git
pkgver=1.2+46.r62.20221025.81f8aa2
pkgrel=4
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
  'linux-6.1-fixup.patch'
  'linux-6.6-fixup.patch'
  'modules-load-tty0tty.conf'
)
sha256sums=(
  'SKIP'                                                              # Upstream git source
  '4babdbb8988fae9c603c210c9afc1a9d066f40d4a6e23d609c6ae6200bc6d645'  # 50-tty0tty.rules.arch.patch
  '57bfbb7dda4c67f0ae0c7736ee30a9cd491065babca43b454f76891c671bd71e'  # linux-6.1-fixup.patch. https://github.com/freemed/tty0tty/issues/47#issuecomment-1375882086.
  'a0d662ff55930fc1faf22bdc18a01c09c74849fa0e4addbb55cd49b4f0191e16'  # linux-6.6-fixup.patch. https://aur.archlinux.org/packages/tty0tty-dkms-git#comment-950887
  '31e97d1ea45da90c70715073d2279fc9482e497179b4fc44645684ffe7371217'  # modules-load-tty0tty.conf
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  for _patch in "${srcdir}"/*.patch; do
    msg2 "Applying patch $(basename "${_patch}") ..."
    patch -N -p1 --follow-symlinks -i "${_patch}"
  done

  git log > git.log
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
  for _docfile in git.log AUTHORS INSTALL README.md THANKS TODO; do
    install -D -v -m644 "${srcdir}/${_pkgname}/${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 'modules-load-tty0tty.conf' "${pkgdir}/usr/share/doc/${_pkgname}/modules-load-tty0tty.conf"
  cp -rv "${_pkgname}/examples" "${pkgdir}/usr/share/doc/${_pkgname}/examples"

  # Install license information
  install -D -v -m644 "${srcdir}/${_pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/COPYING"
}
