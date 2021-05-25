# Maintainer: la Fleur <lafleur chez boum.org>
# Contributor: la Fleur <lafleur chez boum.org>

# This is the git PKGBUILD for servicewall

pkgname=servicewall-git
_pkgname=${pkgname%-git}
pkgdesc="The firewall that remembers the different networks you connect to."
pkgver=0.4.8.r0.0a20b1a
pkgrel=1
arch=("any")
url="https://git.relatif.moi/lafleur/servicewall"
#url="https://pypi.python.org/pypi/servicewall"
license=("GPL3")
depends=(
    "python"
    "python-iptables"
    "python-argparse"
    "python-arpreq"
    "python-systemd"
    "ulogd"
)
provides=("$_pkgname")
conflicts=("$_pkgname")
optdepends=("python-argcomplete" "networkd-dispatcher" "networkmanager")
makedepends=("python-distribute" "python-setuptools" "git")
install=servicewall.install
backup=(
    "etc/servicewall/realms.json"
)

# Sources for git repos :
source=("${_pkgname}::git+https://git.relatif.moi/lafleur/${_pkgname}.git")

# Sources for non-git repos :
#options=(!emptydirs)
#source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2")

md5sums=("SKIP")


pkgver() {
  #cd "${srcdir}/${_pkgname}-${pkgver}"
  cd "${srcdir}/${_pkgname}"
  # git, no tags available
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  # Git, tags available
  printf "%s" "$(git describe --long --all | sed 's#^tags/##' | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

