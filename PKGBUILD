# Maintainer: Duong Do Minh Chau <duongdominhchau@gmail.com>
_gh_api="https://api.github.com"
_repo="francescmm/GitQlient"

pkgname=gitqlient
pkgver=1.6.3
pkgrel=1
pkgdesc="GitQlient: Multi-platform Git client written with Qt"
arch=(x86_64)
url="https://github.com/$_repo"
license=('LGPL')
depends=(git qt5-base)
makedepends=(curl)
source=("$url/releases/download/v${pkgver}/${pkgname}_${pkgver}.tar.gz")
sha256sums=(93b68ff1d717db1b745469238d88fdca9a29e87d4b25e97a0410fa8fc7f558d4)

_release_hash() {
    curl --silent "${_gh_api}/repos/$_repo/git/ref/tags/v${pkgver}" | jq -r '.object.sha'
}

build() {
    cd "${pkgname}_${pkgver}"
    # By default `qmake` use current directory name, but the `.pro` file
    # name is `GitQlient`, not `GitQlient-$pkgver`, so we need to explicitly
    # specify the `.pro` file here
    # We also need to fetch the SHA hash and set the version manually as this is
    # a release tarball, not a git repo. Without doing this, the build script will
    # include the commit hash of the AUR repo in the tooltip of GitQlient About.
    qmake PREFIX="/usr" VERSION="$pkgver" GQ_SHA="$(_release_hash)" GitQlient.pro
    make
}

package() {
    cd "${pkgname}_${pkgver}"
    make INSTALL_ROOT="${pkgdir}" install
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/gitqlient"
}
