# Maintainer: Winona Schroeer-Smith (Wolfizen) <wolfizen@wolfizen.net>

pkgname='ddnswolf-git'
pkgver=1
pkgrel=2
pkgdesc='Dynamic DNS updater'
arch=('any')
url='https://github.com/Wolfizen/DDNSWolf'
license=('GPL3')
depends=(
    'python>=3.9'
    'python-cloudflare'
    'python-dnspython>=2.0'
    'python-netifaces'
    'python-pyhocon'
    'python-requests'
)
makedepends=(
    'git'
    'python-gitpython'
    'python-setuptools'
)
source=(
    # Use local source if present. LOCAL_SOURCE is a directory path to
    # a (potentially modified) checkout of the DDNSWolf repo.
    $([ ! -z "${LOCAL_SOURCE}" ] \
        && echo "DDNSWolf::git+file://${LOCAL_SOURCE}" \
        || echo 'git+https://github.com/Wolfizen/DDNSWolf.git')
)
sha256sums=(
    'SKIP'
)
backup=('etc/ddnswolf.conf')

prepare() {
    # This copy needs to be done a second time because makepkg will do
    # a "clone" of the local repo, but changes in the working directory
    # also need to be copied.
    if [ ! -z "${LOCAL_SOURCE}" ]; then
        echo "LOCAL_SOURCE present. Copying working directory from '${LOCAL_SOURCE}'"
        cp -r "${LOCAL_SOURCE}/." "${srcdir}/DDNSWolf"
    fi
}

pkgver() {
    cd "${srcdir}/DDNSWolf"
    python 'ddnswolf/version.py' | sed 's/-/_/g'
}

build() {
    cd "${srcdir}/DDNSWolf"
    python 'setup.py' build
}

package() {
    cd "${srcdir}/DDNSWolf"
    python 'setup.py' install --skip-build --optimize=1 --root="${pkgdir}" --prefix='usr/'
}
