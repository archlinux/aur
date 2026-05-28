# Maintainer: David Hrabě <david.hrabe12@seznam.cz>
pkgname=awscurl-git
pkgver=0.42.r0.g89c74fa
pkgrel=1
pkgdesc="Curl-like tool with AWS Signature Version 4 request signing"
arch=('any')
url="https://github.com/okigan/awscurl"
license=('MIT')
depends=(
    'python'
    'python-awscrt'
    'python-boto3'
    'python-botocore'
    'python-configargparse'
    'python-requests'
    'python-urllib3'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
)
provides=('awscurl')
conflicts=('awscurl')
options=('!debug')
source=("${pkgname}::git+https://github.com/okigan/awscurl.git")
b2sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname}"
    pytest
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/awscurl/README.md"
}