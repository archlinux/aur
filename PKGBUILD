# Maintainer: Chris Nixon <chris.nixon@sigma.me.uk>
pkgname=pyenv-git
pkgver=1.1.3.r33.g48aa0c49
pkgrel=1
pkgdesc='Simple Python version management'
arch=('any')
url='https://github.com/yyuu/pyenv'
license=('MIT')
conflicts=("pyenv")
provides=("pyenv")
depends=()
source=("$pkgname::git+https://github.com/yyuu/pyenv")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$pkgname"
    git checkout $(git describe --tags `git rev-list --tags --max-count=1`)
    cd ..
    mkdir -p "${pkgdir?}"/{opt/pyenv,usr/bin}
    cd "${srcdir?}/$pkgname" || return
    cp -a -- * "$pkgdir"/opt/pyenv
    ln -s /opt/pyenv/libexec/pyenv "$pkgdir/usr/bin/pyenv"

    for bin in pyenv-{,un}install python-build; do
        ln -s /opt/pyenv/plugins/python-build/bin/"$bin" "$pkgdir/usr/bin/$bin"
    done
}
