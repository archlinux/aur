# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: adrien1018 (https://aur.archlinux.org/account/adrien1018)
# Contributor: fs4000
# Contributor: trapanator
# Contributor: tomprogrammer

pkgname=phc-intel-dkms-stable
groups=(
  'linux-phc'
  'phc-intel'
)
_downloadver=rev44 # Set this to specify what to download.
pkgver=0.3.2.rev44
pkgrel=6
pkgdesc="Frequency driver for Intel CPUs with undervolting feature. DKMS-based kernel module, stable branch."
url="https://gitlab.com/linux-phc/phc-intel"
arch=('any')
license=('GPL2')
depends=(
  'dkms'
)
makedepends=()
optdepends=(
  'phc-intel-scripts: To control the driver.'
)
provides=(
  'linux-phc'
  "phc-intel-dkms=${pkgver}"
  "phc-intel-patch=${pkgver}" # It provides also the kernel patches.
  "PHC-INTEL-MODULE"          # This means kernel-side support; packages providing kernel module, but also kernel packages which have that builtin, can set this.
)
conflicts=(
  "phc-intel-dkms"
)
source=(
  "https://gitlab.com/linux-phc/phc-intel/-/archive/${_downloadver}/phc-intel-${_downloadver}.tar.bz2"
  'dkms.conf.in'
)
sha256sums=(
  'f3b70962e94c604adf9285f06ed1f1aaadcdee88f9ddf213255ed96c97d0c096' # Main source
  '9162c25d0df436a00d8b45d9e97c24a1f2999f5b8a4f78f2995df15d2d31baa7' # dkms.conf.in
)

# prepare() {
#   cd "phc-intel-${_downloadver}"
# 
#   # ## Switch to stable branch -- not needed, since stable is the default, and when doing it here then it would fail if the currently running kernel headers are not installed (e.g. due to a recent upgrade):
#   # make canny
# }

pkgver() {
  cd "phc-intel-${_downloadver}"

  _ver="$(grep -E '^[[:space:]]*VERSION[[:space:]]*=' Makefile | tail -n1 | sed -E -e 's|^[[:space:]]*VERSION[[:space:]]*=[[:space:]]*||' -e 's|[[:space:]]*#.*$||')"
  _upstreamrev="${_downloadver}"
  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.${_upstreamrev}"
  fi
}

build() {
  cd "${srcdir}"

  sed -E -e "s|%%VERSION%%|${pkgver}|g" dkms.conf.in > dkms.conf
}

package() {
  cd "phc-intel-${_downloadver}"

  umask 022
  install -dvm755                        "${pkgdir}/usr/src/phc-intel-${pkgver}"
  install -Dvm644 "${srcdir}/dkms.conf"  "${pkgdir}/usr/src/phc-intel-${pkgver}/dkms.conf"

  install -Dvm644 "phc-intel.modprobe"   "${pkgdir}/usr/lib/modprobe.d/phc-intel.conf"
  cp -Rv inc Makefile                    "${pkgdir}/usr/src/phc-intel-${pkgver}"/

  for _docfile in changelog README.1st; do
    install -Dvm644 "${_docfile}"        "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  install -dvm755                        "${pkgdir}/usr/share/doc/${_pkgname}/docs"
  cp -rv docs/*                          "${pkgdir}/usr/share/doc/${_pkgname}/docs"/

  install -Dvm644 gpl-2.0.txt            "${pkgdir}/usr/share/licenses/${pkgname}/gpl-2.0.txt"
  ln -svf "/usr/share/licenses/${pkgname}/gpl-2.0.txt"  "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
