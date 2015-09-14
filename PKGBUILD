# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Fabiano Rosas <fabianorosas@gmail.com>

set -u
_gitauth='fabianorosas'
_pkgname='lastpkgs'
pkgname="${_pkgname}"
pkgver=0.9.4
pkgrel=1
pkgdesc='Lists or removes packages from the last N reboots. Good for cleaning up after experimenting with new programs.'
arch=('any')
url="https://github.com/${_gitauth}/${_pkgname}"
license=('GPL')
_verwatch=("${url}/releases" "${url#*github.com}/archive/\(.*\)\.tar\.gz" 'l')
_srcdir="${_pkgname}-${pkgver}"
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('1be404d7180342b7e61d7eae5fe6520941ea6a9900a3a1511a35e10c9ab71950')

if [ "${pkgname%-git}" != "${pkgname}" ]; then # this is easily done with case
  unset _verwatch
  makedepends=('git')
  provides+=("${_pkgname}=${pkgver%%.r*}")
  conflicts+=("${_pkgname}")
  _srcdir="${_pkgname}"
  source[0]="${url//https:/git:}.git"
  :;sha256sums[0]='SKIP'
pkgver() {
  set -u
  cd "${_srcdir}"
  #printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's|-|.|g'
  git describe --long | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}
fi

package() {
  set -u
  depends=('bash')
  cd "${_srcdir}"
  install -Dpm755 'lastpkgs' -t "${pkgdir}/usr/bin/"
  set +u
}
set +u
