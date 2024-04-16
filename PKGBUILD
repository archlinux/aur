# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: bert (https://aur.archlinux.org/account/bert)

_pkgbase="kplex"
pkgbase="${_pkgbase}-git"
pkgname=("${pkgbase}")
pkgver=1.4+2.r221.20200827.2433cea
pkgrel=2
arch=(
  'i486'
  'i586'
  'i686'
  'x86_64'
  'aarch64'
  'armv6h'
  'armv6l'
  'armv7h'
  'armv7l'
  'armv8h'
  'loong64'
  'risc64'
)
pkgdesc='NMEA-0183 multiplexer for GNU/Linux capable of managing inputs from serial lines, pseudo terminals and network interfaces.'
url='http://www.stripydog.com/kplex/'
license=('GPL-3.0-or-later')
makedepends=('git')
depends=('glibc')
provides=("${_pkgbase}=${pkgver}")
conflicts=("${_pkgbase}")
source=("${_pkgbase}::git+https://github.com/stripydog/kplex")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgbase}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgbase}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgbase}"
  make
}

package() {
  cd "${srcdir}/${_pkgbase}"

  # copy service file from deb package
  install -Dvm644 -t "${pkgdir}/usr/lib/systemd/system" 'kplex.service'

  # copy example conf from deb package
  install -Dvm644 "kplex.conf.ex" "${pkgdir}/etc/kplex.conf"

  # create dest dir and build
  install -dvm755 "${pkgdir}/usr"
  install -dvm755 "${pkgdir}/usr/share/man/man1"
  make DESTDIR="${pkgdir}/usr" MANDIR="${pkgdir}/usr/share/man" install

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" README CHANGELOG CONTRIBUTING git.log
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgbase}/COPYING"
}

