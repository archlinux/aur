# Maintainer: Your Name cakephone@proton.me
pkgname=bbsync-git
pkgver=r.HEAD
pkgrel=1
pkgdesc="Automatic Downloads Of Your Blackboard Content (unofficial git version)"
arch=('any')
url="https://github.com/sanjacob/BlackboardSync"
license=('GPL-2.0-only')
depends=(
    'python>=3.10'
    'python-pyqt6>=6.7.1'
    'python-pyqt6-webengine>=6.7.0'
    'python-beautifulsoup4>=4.12.2'
    'python-pydantic>=2.1.1'
    'python-pathvalidate>=3.1.0'
    'python-dateutil'
    'python-appdirs'
    'python-lxml>=4.7.1'
    'python-requests>=2.25.0'
    'python-packaging>=23.1'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools>=64'
    'python-setuptools-scm>=8'
)
provides=('blackboardsync' 'bbsync')
conflicts=('blackboardsync' 'bbsync')
source=("${pkgname}::git+https://github.com/sanjacob/BlackboardSync.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    
    # Install desktop file
    install -Dm644 packaging/linux/app.bbsync.BlackboardSync.desktop \
        "${pkgdir}/usr/share/applications/app.bbsync.BlackboardSync.desktop"
    
    # Install icon
    install -Dm644 packaging/linux/icon.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/app.bbsync.BlackboardSync.svg"
    
    # Install metainfo
    install -Dm644 packaging/linux/app.bbsync.BlackboardSync.metainfo.xml \
        "${pkgdir}/usr/share/metainfo/app.bbsync.BlackboardSync.metainfo.xml"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
