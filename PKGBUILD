# Maintainer: Duong Do Minh Chau <duongdominhchau@gmail.com>
pkgname=gitqlient
pkgver=1.2.0
pkgrel=1
pkgdesc="A Git client originally forked from QGit that has continued its own path"
arch=(x86_64)
url="https://github.com/francescmm/GitQlient"
license=('LGPL')
depends=(git qt5-base qlogger-git)
source=(
    "https://github.com/francescmm/GitQlient/archive/v${pkgver}.tar.gz"
    werror.patch
)
sha256sums=(
    SKIP
    04754fa19b0f9db01f6570f5cf1dd81736f47ee18be0ad3e2b0cceda6200f093
)

prepare() {
    cd "GitQlient-$pkgver"

    patch --forward --unified --input "${srcdir}/werror.patch" GitQlient.pro

    sed -ie '/include(QLogger\/QLogger.pri)/d' GitQlient.pro

    # Use QLogger from other package instead of cloning it as submodule
    echo 'LIBS += -lQLogger' >> GitQlient.pro

    # Install into /usr/bin instead of /opt/GitQlient/bin
    echo 'target.path = /usr/bin' >> GitQlient.pro

    qmake GitQlient.pro
}

build() {
    cd "GitQlient-$pkgver"
    make
}

package() {
    cd "GitQlient-$pkgver"
    # This only install one file: the executable...
    make INSTALL_ROOT="${pkgdir}" install
    # ... so we need to install other files by ourselves
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/gitqlient/LICENSE"
    cp -r "AppImage/GitQlient/usr" "${pkgdir}"
}
