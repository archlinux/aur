# Maintainer: Sam Collier <samcollier916@gmail.com>
pkgname=ue4-docker-git
pkgver=0.0.116.r6.g2a1e922
pkgrel=1
pkgdesc="Windows and Linux containers for Unreal Engine (git version)"
arch=('any')
url="https://github.com/adamrehn/ue4-docker"
license=('MIT')
depends=(
    'python>=3.8'
    'python-colorama'
    'python-docker>=6.1.0'
    'python-humanfriendly'
    'python-jinja>=2.11.3'
    'python-packaging>=19.1'
    'python-psutil'
    'python-termcolor'
    'docker'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools>=61'
)
optdepends=(
    'nvidia-container-toolkit: for GPU support in Linux containers'
    'ue4cli-git: for additional UE4 command-line tools'
)
provides=("ue4-docker=${pkgver}")
conflicts=('ue4-docker')
source=("${pkgname}::git+https://github.com/adamrehn/ue4-docker.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
    
    if [ -d "docs" ]; then
        cp -r docs "$pkgdir/usr/share/doc/${pkgname%-git}/"
    fi
}
