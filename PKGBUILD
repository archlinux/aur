#Maintainer digital mystik <echo ZGlnaXRhbF9teXN0aWtAcHJvdG9ubWFpbC5jaAo= | base64 -d>

_name=trezor-agent
pkgname=python-trezor-agent-git
pkgver=v0.14.7.r6.gba8a1ba
pkgrel=1
pkgdesc="Hardware-based SSH/PGP agent (Trezor only)"
arch=('any')
url="https://github.com/romanz/trezor-agent"
license=("LGPL3")
provides=('python-trezor-agent')
conflicts=('python-trezor-agent')

# dependencies are for Trezor devices only (other device agents will require their own, some of which are not in the AUR) - please refer to setup.py of each agent for more information

depends=(
         'python' 
         'python-backports.shutil_which' 
         'python-bech32' 
         'python-configargparse'
         'python-construct-classes'
         'python-cryptography'
         'python-daemon' 
         'python-docutils' 
         'python-ecdsa' 
         'python-hidapi'
         'python-mnemonic' 
         'python-pymsgbox' 
         'python-pynacl' 
         'python-semver' 
         'python-simple-rlp'
         'python-trezor' 
         'python-unidecode' 
         'python-wheel' 
         )

makedepends=('git' 'python-setuptools')
source=("$pkgname::git+https://github.com/romanz/$_name.git#branch=master")

b2sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
    
    # NOTE: other agents will require their own dependencies, some of which are not in the AUR
    # comment or uncomment for agent selection (don't forget to do the same under the package section)
    cd "$srcdir/$pkgname/agents/trezor"
    python setup.py build
    
    #cd "$srcdir/$pkgname/agents/keepkey"
    #python setup.py build
    
    #cd "$srcdir/$pkgname/agents/ledger"
    #python setup.py build

    ## Note: needs onlykey (PyPi) ##
    #cd "$srcdir/$pkgname/agents/onlykey"
    #python setup.py build

    ## NOTE: needs jadepy (PyPi) ##
    #cd "$srcdir/$pkgname/agents/jade"
    #python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    
    #comment or uncomment for agent selection
    cd "$srcdir/$pkgname/agents/trezor"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    #cd "$srcdir/$pkgname/agents/keepkey"
    #python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    #cd "$srcdir/$pkgname/agents/ledger"
    #python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    #cd "$srcdir/$pkgname/agents/onlykey"
    #python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    #cd "$srcdir/$pkgname/agents/jade"
    #python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
