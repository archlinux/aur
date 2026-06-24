# Maintainer:  dreieck
# Contributor: Guillaume DELVIT <guiguid@free.fr>

_pkgname=zram-init
pkgname=${_pkgname}-git
pkgver=13.3.r120.20260607.96579c7
pkgrel=1
pkgdesc="Setup zram-based tmpfs and swap devices on boot."
arch=('any')
url='https://github.com/vaeth/zram-init'
license=('GPL-2.0-only')
depends=('bash')
makedepends=('git')
optdepends=(
  "push: To be able to use options '-K', '-M', '-2', '-Z' to pass generic arguments."
  "zram-init-openrc: For corresponding OpenRC Init script."
  "util-linux: To use 'zramctl'."
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=()
backup=("etc/modprobe.d/zram.conf")
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"
  git log > git.log

  make clean
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
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

  make all
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" PREFIX=/usr SYSCONFDIR=/etc BINDIR="${pkgdir}"/usr/bin install

  ## Remove OpenRC files
  rm -R "${pkgdir}/etc"/{conf.d,init.d}

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"  git.log AUTHORS ChangeLog README.md
}
