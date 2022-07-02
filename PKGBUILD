# Maintainer: Duong Do Minh Chau <duongdominhchau@gmail.com>
pkgname=gitqlient
pkgver=1.5.0
pkgrel=1
pkgdesc="A Git client originally forked from QGit that has continued its own path"
arch=(x86_64)
url="https://github.com/francescmm/GitQlient"
license=('LGPL')
depends=(git qt5-base qt5-webengine qt5-webchannel)
source=(
    "https://github.com/francescmm/GitQlient/archive/v${pkgver}.tar.gz"
	"git+https://github.com/francescmm/QPinnableTabWidget.git"
    "git+https://github.com/francescmm/QLogger.git"
    "git+https://github.com/francescmm/AuxiliarCustomWidgets.git"
    "git+https://github.com/francescmm/git.git"
)
sha256sums=(
    69850f3123ee2e9618c0061b7460d6ff39f0490cb9790745b1d80192069f90f8
    SKIP
    SKIP
    SKIP
    SKIP
)

prepare() {
    cd "GitQlient-$pkgver"
    for dep in "AuxiliarCustomWidgets" "QPinnableTabWidget" "QLogger" "git"; do
        rmdir "src/$dep"
        ln -sf "$srcdir/$dep" "src/$dep"
    done
}

build() {
    cd "GitQlient-$pkgver"
    # By default `qmake` use current directory name, but the `.pro` file
    # name is `GitQlient`, not `GitQlient-$pkgver`, so we need to explicitly
    # specify the `.pro` file here
    qmake PREFIX="/usr" GitQlient.pro
    make
}

package() {
    cd "GitQlient-$pkgver"
    make INSTALL_ROOT="${pkgdir}" install
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/gitqlient"
}
