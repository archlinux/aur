# Maintainer: Cyrille Pontvieux <cyrille@enialis.net>
_bin_name=ci-toolbox
pkgname=citbx4gitlab
pkgver=8.1.1
pkgrel=1
pkgdesc="CI toolbox for Gitlab"
arch=('any')
url="https://gitlab.com/mbedsys/citbx4gitlab"
license=('GPL3' 'APACHE')
depends=(
    'bash'
    'coreutils'
    'curl'
    'docker'
    'gawk'
    'git'
    'jq'
    'python-yaml'
    'sed'
)
optdepends=('git-lfs: large file system support')
source=(
    "$pkgname-$pkgver.tar.xz::https://gitlab.com/api/v4/projects/mbedsys%2f$pkgname/packages/generic/$_bin_name/$pkgver/$_bin_name-$pkgver.tar.xz"
    "archlinux.patch"
)
sha256sums=('026c41d0c3388f3e60dc43acd0a5a22ae57628a4f8a37b74b208eeb7b5068b07'
            'ad8a8ba83e8c2b9631bb94062a72020ed7bfa1df3f6d48fdc6e885324f2f7f8a')

prepare() {
    cd "$srcdir"
    patch -p1 -i "archlinux.patch"
    (
        cd lib/$_bin_name/env-setup
        ln -s archlinux.sh "arch linux.sh"
        ln -s archlinux.sh "manjaro linux.sh"
    )
    mv bin/$_bin_name lib/$_bin_name/
}

package() {
    cd "$pkgdir"
    mkdir -p usr/lib usr/bin usr/share/bash-completion/completions
    cp -a "$srcdir/lib/$_bin_name" "usr/lib/$pkgname"
    cp -a "$srcdir/share/bash-completion/completions/$_bin_name" usr/share/bash-completion/completions/
    (cd usr/bin && ln -s "../lib/$pkgname/$_bin_name" $_bin_name)
}
