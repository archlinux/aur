# Maintainer: Kaleb <vitor.guttler@edu.pucrs.br>
pkgname=python-boto3-git
pkgver=1.43.101.r0.ga1acf79e
pkgrel=1
pkgdesc="Boto3, an AWS SDK for Python"
arch=('any')
url="https://github.com/boto/boto3"
license=('Apache-2.0')
depends=('python' 'python-botocore' 'python-jmespath' 'python-s3transfer')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('python-boto3')
conflicts=('python-boto3')
# Pinned to the master branch: boto3's default branch is "develop" (an
# integration branch with no reachable release tags), while releases are
# actually tagged on "master". Without this pin, git describe --tags below
# always fails to find a tag from develop's history, which is why the
# --always fallback was previously needed and why pkgver ended up as a bare
# commit hash (e.g. "2ad1b198") instead of a proper X.Y.Z.rN.gHASH version.
source=("git+https://github.com/boto/boto3.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "boto3"
    # Get the latest tag version and combine with revision count and short hash
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "boto3"
    python -m build --wheel --no-isolation
}

package() {
    cd "boto3"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
