# Maintainer: Chris Nixon <chris.nixon@sigma.me.uk>
pkgname=pyenv-git
pkgver=v1.0.0.6.rdcc109f
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
  # Get the first part of the latest tag and append the current revision
  echo "$(git describe --long --tags | sed 's/\(^.*\)-.*.*/\1/;s/-/./g').r$(git log --pretty=format:'%h' -n 1)"
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
