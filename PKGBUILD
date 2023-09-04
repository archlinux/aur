# Maintainer: redfish <redfish@galactica.pw>

pkgname=python-ipfshttpclient-git
_reponame=py-ipfs-http-client
_name=ipfshttpclient
pkgver=0.8.0a2.r6.gacac2b5
pkgrel=1
pkgdesc="Python API client library for Kubo (aka. IPFS)"
arch=('any')
provides=("python-ipfshttpclient=$pkgver")
conflicts=("python-ipfshttpclient" "python-ipfsapi")
url="https://pypi.python.org/pypi/ipfshttpclient"
license=('MIT')
depends=('python'
         'python-httpcore'
         'python-httpx'
         'python-multiaddr'
         'python-netaddr'
         'python-requests'
         'python-setuptools'
         'python-six'
        )
makedepends=('python-flit')
checkdepends=('kubo>=0.5.0'
	      'python-pytest' 'python-pytest-cov' 'python-pytest-ordering'
	      'python-pytest-dependency' 'python-pytest-order'
	      'python-mock' 'python-pytest-mock'
	      'python-cid' 'python-pytest-cid'
	      'python-pytest-localserver' 'python-pluggy' 'python-py'
	     )
source=("git+https://github.com/ipfs/${_reponame}")
sha256sums=('SKIP')

pkgver() {
    cd $_reponame

    local _ver=$(sed -n 's/__version__ = "\([^"]\+\)"/\1/p'  $_name/version.py)
    if git rev-parse $_ver 2>/dev/null 1>/dev/null
    then
	local _num=$(git describe --tags --long | sed -n 's/^[^-]\+-\([0-9]\+\)-[^-]\+/\1/p')
    else
	local _num=0  # relese not tagged, so don't know cmmmit height from last tag
    fi
    printf "%s.r%u.g%s" $_ver $_num $(git rev-parse --short HEAD)
}

check() {
    cd $srcdir/$_reponame

    # To exclude tests pass: -k 'not test_name'
    ./test/run-tests.py
}

package() {
    cd "$srcdir/$_reponame"

    local _ver=$(echo $pkgver | sed -n 's/^\(.*\)\.r[0-9]\+\.g[0-9a-f]\+$/\1/p')

    python -m flit build
    cd dist/
    tar xf ${_name}-${_ver}.tar.gz
    cd  ${_name}-${_ver}
    python setup.py install --prefix="$pkgdir/usr" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
