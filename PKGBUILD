# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: epitron <https://aur.archlinux.org/account/epitron>

_pkgname=kvmtool
pkgname=kvmtool-git
pkgver=3.18.0.r1976.20240304.4d2c017
pkgrel=1
pkgdesc="A lightweight (~5kloc) KVM-based virtual machine which can host Linux guests only"
license=('GPL2')
url="https://git.kernel.org/cgit/linux/kernel/git/will/kvmtool.git/"

arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'mips'
  'powerpc'
  'riscv'
  'x86_64'
)
depends=(
  'binutils'
  'gtk3'
  'libaio'
  'libvncserver'
  'sdl12-compat'
  'zlib'
) # TODO: create an AUR package that builds a lightweight, stripped-down lkvm kernel, and transfer the qemu boot image over to it
makedepends=(
  'git'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

source=(
  "${_pkgname}::git+https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git"
  #"http://wiki.qemu.org/download/linux-0.2.img.bz2"
)

sha256sums=(
  'SKIP'
  #'41c222db3c669724dd202d2f0fe655ad88f847d8c263ed08bb90219082e7b423'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "git.log"

  ./util/KVMTOOLS-VERSION-GEN # Generate 'KVMTOOLS-VERSION-FILE', needed for pkgver().
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(awk '{print $3}' KVMTOOLS-VERSION-FILE)"
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
  cd "${srcdir}/${_pkgname}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dvm755 lkvm "${pkgdir}/usr/bin/lkvm"
  # install -Dvm644 "${srcdir}/linux-0.2.img" "${pkgdir}/usr/share/kvmtool/linux-0.2.img"

  # cd "${pkgdir}/usr/bin"
  # ln -svr "${pkgdir}/usr/bin/lkvm" "${pkgdir}/usr/bin/vm"

  for _docfile in git.log CREDITS-Git INSTALL KVMTOOLS-VERSION-FILE README; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  for _licensefile in COPYING; do
    install -Dvm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_licensefile}"
  done
}
