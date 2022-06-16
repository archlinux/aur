# Maintainer: Andrea Manenti <andrea [dot] manenti [at] yahoo [dot] com>

pkgname=sdpb-git
pkgver=1515.ec2e4cb
pkgrel=1
pkgdesc="Semidefinite program solver designed for the conformal bootstrap"
arch=(x86_64)
license=('MIT')
url="https://arxiv.org/abs/1909.09745"
depends=('boost' 'libarchive' 'libxml2' 'mpfr' 'rapidjson' 'elemental-gmp-git')
optdepends=('openmpi')
makedepends=('git' 'python')
source=('git+https://github.com/davidsd/sdpb.git'
        'string_file_deprecated.patch')
sha256sums=('SKIP'
            '9273625b2f3a0fbd4f8fa048defd77abd48f3f0c9d39aa9a3d92e88a7057fca0')

pkgver() {
        cd "$srcdir"/sdpb
        echo `git rev-list --count master`.`git rev-parse --short master`
}

build () {
        cd "$srcdir"/sdpb
        git apply "$srcdir"/string_file_deprecated.patch

        python waf configure --prefix=/usr
        python waf
}

package() {
        cd "$srcdir"/sdpb/build

        for bin_name in sdp2functions spectrum pvm2functions sdp2input sdpb approx_objective outer_limits pvm2sdp
        do
            install -vDm 755 "$bin_name" "$pkgdir"/usr/bin/"$bin_name"
        done
}

