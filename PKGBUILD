# Maintainer: Andrea Manenti <andrea [dot] manenti [at] yahoo [dot] com>

pkgname=sdpb-git
pkgver=2016.6418959a
pkgrel=1
pkgdesc="A semidefinite program solver for the conformal bootstrap"
arch=(x86_64)
license=('MIT')
url="https://github.com/davidsd/sdpb"
depends=('boost' 'libarchive' 'libxml2' 'mpfr' 'rapidjson' 'elemental-gmp-git' 'intel-oneapi-mkl' 'flint')
optdepends=('openmpi')
makedepends=('git' 'python')
source=('git+https://github.com/davidsd/sdpb.git')
sha256sums=('SKIP')

pkgver() {
        cd "$srcdir"/sdpb
        echo `git rev-list --count master`.`git rev-parse --short master`
}

build () {
        cd "$srcdir"/sdpb

        # 'U' read mode was deprecated in python 3.11
        # This is a workaround
        python waf configure --prefix=/usr 1>&2 2> /dev/null || true # is going to fail but it generates the scripts
        sed -i -e "s/'rU'/'r'/g" .waf*/waflib/Context.py

        python waf configure --prefix=/usr

        # We need to do this one more time
        sed -i -e "s/'rU'/'r'/g" .waf*/waflib/ConfigSet.py
        python waf
}

package() {
        cd "$srcdir"/sdpb/build

        for bin_name in pmp2functions spectrum pmp2sdp sdp2input sdpb approx_objective outer_limits pvm2sdp
        do
            install -vDm 755 "$bin_name" "$pkgdir"/usr/bin/"$bin_name"
        done
}

check () {
        cd "$srcdir"/sdpb/test
        /usr/bin/sh run_all_tests.sh
}
