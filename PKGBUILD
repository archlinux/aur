# Maintainer: Andrea Manenti <andrea [dot] manenti [at] yahoo [dot] com>
pkgname=scalar_blocks-git
pkgver=240.6698eeb
pkgrel=1
pkgdesc="Algorithm for computing numerical derivatives of scalar conformal blocks"
arch=(x86_64)
license=('MIT')
url="https://gitlab.com/bootstrapcollaboration/scalar_blocks"
depends=('trilinos-sacado' 'eigen' 'gmp') 
makedepends=('git' 'python')
source=('git+https://gitlab.com/bootstrapcollaboration/scalar_blocks.git'
        'libname-and-dl.patch'
        'string_file_deprecated.patch')
sha256sums=('SKIP'
            '96f526ad07ae2447dcfc721b8fb06a3dba11ffd3ae2b1a9d33161a8f2e33e07d'
            '6194d95d5f290d508876910a10f93b4b76f475014e31fcf11e7b36e43a7cfbd9')

pkgver() {
        cd "$srcdir"/scalar_blocks
        echo `git rev-list --count master`.`git rev-parse --short master`
}

build () {
        cd "$srcdir"/scalar_blocks

        git apply ../libname-and-dl.patch
        git apply ../string_file_deprecated.patch

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

