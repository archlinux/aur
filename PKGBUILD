# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: adrien1018 (https://aur.archlinux.org/account/adrien1018)
# Contributor: fs4000
# Contributor: trapanator
# Contributor: tomprogrammer

_pkgbase=phc-intel-dkms-testing
pkgbase="${_pkgbase}-git"
_pkgname="${_pkgbase}"
pkgname="${pkgbase}"
groups=(
  'linux-phc'
  'phc-intel'
)
pkgver=0.4.0.rev45.r53.20230627.a7ab7a8
_phcver="$(awk -F. '{print $1"."$2"."$3}' <<<"${pkgver}")"
pkgrel=1
pkgdesc="Frequency driver for Intel CPUs with undervolting feature. DKMS-based kernel module, testing branch, latest git checkout."
url="https://gitlab.com/linux-phc/phc-intel"
arch=('any')
license=('GPL2')
depends=(
  'dkms'
)
makedepends=(
  'git'
)
optdepends=(
  'phc-intel-scripts: To control the driver.'
)
provides=(
  'linux-phc'
  "${_pkgname}=${pkgver}"
  "phc-intel-dkms=${pkgver}"
  "phc-intel-patch=${pkgver}" # It provides also the kernel patches.
  "PHC-INTEL-MODULE"          # This means kernel-side support; packages providing kernel module, but also kernel packages which have that builtin, can set this.
)
conflicts=(
  "${_pkgname}"
  "phc-intel-dkms"
)
source=(
  "${_pkgbase}::git+${url}.git"
  'testing.makefile.patch'
  'dkms.conf.in'
)
sha256sums=(
  'SKIP'
  '082229d12993de097ed60339dd7b3ba36c9cb3d92abf1722516b2921cc07ebc6' # testing.makefile.patch
  '9162c25d0df436a00d8b45d9e97c24a1f2999f5b8a4f78f2995df15d2d31baa7' # dkms.conf.in
)

prepare() {
  cd "${srcdir}/${_pkgbase}"

  ## Switch to testing branch:
  #make brave # This will error out if the currently running kernel's headers are not installed -- which is likely after an upgrade.
  ## Manually change Makefile to testing variant:
  printf '%s\n' "Patching 'Makefile' to build testing variant ..."
  patch -N --follow-symlinks -i "${srcdir}/testing.makefile.patch" Makefile

  ## Generate GIT log
  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgbase}"

  _ver="$(grep -E '^[[:space:]]*VERSION[[:space:]]*=' Makefile | tail -n1 | sed -E -e 's|^[[:space:]]*VERSION[[:space:]]*=[[:space:]]*||' -e 's|[[:space:]]*#.*$||')"
  _upstreamrev="$(git describe --tags)"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.${_upstreamrev}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}"

  sed -E -e "s|%%VERSION%%|${pkgver}|g" dkms.conf.in > dkms.conf
}

package() {
  cd "${srcdir}/${_pkgbase}"

  umask 022
  install -dvm755                        "${pkgdir}/usr/src/phc-intel-${pkgver}"
  install -Dvm644 "${srcdir}/dkms.conf"  "${pkgdir}/usr/src/phc-intel-${pkgver}/dkms.conf"

  install -Dvm644 "phc-intel.modprobe"   "${pkgdir}/usr/lib/modprobe.d/phc-intel.conf"
  cp -Rv inc Makefile                    "${pkgdir}/usr/src/phc-intel-${pkgver}"/

  for _docfile in changelog README.1st "${srcdir}/git.log"; do
    install -Dvm644 "${_docfile}"        "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  install -dvm755                        "${pkgdir}/usr/share/doc/${_pkgname}/docs"
  cp -rv docs/*                          "${pkgdir}/usr/share/doc/${_pkgname}/docs"/

  install -Dvm644 gpl-2.0.txt            "${pkgdir}/usr/share/licenses/${pkgname}/gpl-2.0.txt"
  ln -svf "/usr/share/licenses/${pkgname}/gpl-2.0.txt"  "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
