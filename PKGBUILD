# @Author: archer
# @Date:   2019-08-02T13:11:00+01:00
# @Last modified by:   archer
# @Last modified time: 2020-11-12T23:17:41+00:00

# Maintainer: George Raven <GeorgeRavenCommunity AT pm dot me>
pkgname=python-kubernetes-git
_pkgsrcname="python-kubernetes"
pkgver=r1756.94e42113a
pkgrel=1
pkgdesc="Python Kubernetes-client git version."
arch=("x86_64")
url="https://github.com/kubernetes-client/python"
_branch="master"
license=("Apache-2.0")
groups=()
depends=("python" "python-certifi" "python-six" "python-dateutil"
         "python-urllib3" "python-yaml" "python-google-auth"
         "python-websocket-client" "python-requests" "python-requests-oauthlib"
         "python-adal")
makedepends=("git")
optdepends=()
provides=("python-kubernetes")
conflicts=("python-kubernetes")
replaces=()
backup=()
options=()
install=
source=("${_pkgsrcname}::git+${url}#branch=${_branch}")
noextract=()
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgsrcname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


prepare() {
  cd "${srcdir}/${_pkgsrcname}"
  git checkout ${_branch} # get off of makepkg branch
  git submodule update --init --recursive # they split their source
  git submodule update --recursive --remote # so pulling submodule
}

build() {
  cd "${srcdir}/${_pkgsrcname}"
}

check() {
  cd "${srcdir}/${_pkgsrcname}"
}

package() {
  cp -Lr "${srcdir}/${_pkgsrcname}" "${srcdir}/${_pkgsrcname}-deref"
  cd "${srcdir}/${_pkgsrcname}-deref"
  python3 ./setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
