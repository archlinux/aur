# Maintainer: Andrea Manenti <andrea [dot] manenti [at] yahoo [dot] com>

pkgname=sdpb-git
pkgver=1691.d6b948b
pkgrel=1
pkgdesc="Semidefinite program solver designed for the conformal bootstrap"
arch=(x86_64)
license=('MIT')
url="https://arxiv.org/abs/1909.09745"
depends=('boost' 'libarchive' 'libxml2' 'mpfr' 'rapidjson' 'elemental-gmp-git' 'intel-oneapi-mkl')
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

        for bin_name in sdp2functions spectrum pvm2functions sdp2input sdpb approx_objective outer_limits pvm2sdp
        do
            install -vDm 755 "$bin_name" "$pkgdir"/usr/bin/"$bin_name"
        done
}

