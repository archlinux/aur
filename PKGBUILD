# Maintainer: nobodyinperson <nobodyinperson at posteo de>
# Contributor: AlphaJack <alpha at tuta dot io>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname="opentimestamps-client-git"
pkgver=0.7.2.r7.gcd71c76
pkgrel=1
pkgdesc="Command-line tool to create and validate timestamp proofs with the OpenTimestamps protocol"
license=("LGPL-3.0-or-later")
arch=("any")
provides=("opentimestamps-client")
conflicts=("opentimestamps-client")
url="https://github.com/opentimestamps/opentimestamps-client"
depends=(python-{opentimestamps,appdirs,gitpython,pysocks})
optdepends=("bitcoin-daemon: verify timestamps against a local Bitcoin node")
makedepends=("git" "python-build" "python-installer" "python-setuptools" "python-wheel")
source=("git+$url.git")
sha256sums=("SKIP")

pkgver(){
 cd "opentimestamps-client"
 git describe --long --tags | sed 's/^opentimestamps-client-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
 cd "opentimestamps-client"
 rm -rf build dist ./*.egg-info
}

build(){
 cd "opentimestamps-client"
 python -m build --wheel --no-isolation
}

check(){
 cd "opentimestamps-client"
 python -m unittest discover -v
}

package(){
 cd "opentimestamps-client"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -m755 ots-git-gpg-wrapper.sh -Dt "$pkgdir"/usr/bin
 install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
