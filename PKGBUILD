# Maintainer: Andrea Manenti <andrea [dot] manenti [at] yahoo [dot] com>
pkgname=scalar_blocks-git
pkgver=240.6698eeb
pkgrel=2
pkgdesc="Algorithm for computing numerical derivatives of scalar conformal blocks"
arch=(x86_64)
license=('MIT')
url="https://gitlab.com/bootstrapcollaboration/scalar_blocks"
depends=('trilinos-sacado' 'eigen' 'gmp') 
makedepends=('git' 'python')
source=('git+https://gitlab.com/bootstrapcollaboration/scalar_blocks.git'
        'libname-and-dl.patch')

pkgver() {
        cd "$srcdir"/scalar_blocks
        echo `git rev-list --count master`.`git rev-parse --short master`
}

build () {
        cd "$srcdir"/scalar_blocks

        git apply ../libname-and-dl.patch
        
        if command -v mpicxx &> /dev/null
        then
            export CXX=mpicxx
            export CC=mpicc
        fi

        python waf configure --prefix=/usr --trilinos-dir=/usr
        python waf
}

package() {
        cd "$srcdir"/scalar_blocks/build

        install -vDm 755 scalar_blocks "$pkgdir"/usr/bin/scalar_blocks
}

sha256sums=('SKIP'
            '96f526ad07ae2447dcfc721b8fb06a3dba11ffd3ae2b1a9d33161a8f2e33e07d')
