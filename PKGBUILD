# Based on PKGBUILD from: Chris Nixon <chris.nixon@sigma.me.uk>
pkgname=pyenv-virtualenv-git
pkgver=v1.2.2.2.r2b2b87a
pkgrel=1
pkgdesc='Pyenv plugin to manage virtualenv (a.k.a. python-virtualenv)'
arch=('any')
url='https://github.com/yyuu/pyenv-virtualenv'
license=('MIT')
conflicts=("pyenv-virtualenv")
provides=("pyenv-virtualenv")
makedepends=('git')
depends=('pyenv')
source=("$pkgname::git+https://github.com/pyenv/pyenv-virtualenv")
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
    mkdir -p "${pkgdir?}"/{usr/share/pyenv/plugins/pyenv-virtualenv,usr/bin}
    cd "${srcdir?}/$pkgname"
    cp -a -- * "$pkgdir"/usr/share/pyenv/plugins/pyenv-virtualenv

    for bin in $pkgdir/usr/share/pyenv/plugins/pyenv-virtualenv/bin/*; do
        ln -s $pkgdir/usr/share/pyenv/plugins/pyenv-virtualenv/bin/"$(basename $bin)" "$pkgdir/usr/bin/$(basename $bin)"
    done
}
