# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=git-issues-git
_gitname=git-issues
pkgver=r107.389658d
pkgrel=1
pkgdesc="A distributed issue tracking system based on Git repositories, written in Python."
arch=(any)
url=https://github.com/duplys/git-issues
license=(custom:BSD)
depends=(python2)
makedepends=(git)
provides=(git-issues)
conflicts=(git-issues)
source=(git+https://github.com/duplys/git-issues)
md5sums=(SKIP)

pkgver() {
    cd "$_gitname"
    commit=$(git rev-list --count master)
    hash=$(git rev-parse --short HEAD)
    echo "r$commit.$hash"
}

package() {
    cd "$srcdir/$_gitname"
   
    python2 -m compileall *.py
    mkdir -p "$pkgdir"/opt/git-issues
    install *.{py,pyc} "$pkgdir"/opt/git-issues

    sed -i 's|/usr/bin/env python|/usr/bin/env python2|' git-issues *.py    
    install -m755 git-issues "$pkgdir"/opt/git-issues
    mkdir -p "$pkgdir"/usr/bin
    ln -s /opt/git-issues/git-issues "$pkgdir"/usr/bin

    # git-issues wants these to be installed in the same path as the
    # executable. It will copy these into repositories where it is used.
    install README README.textile LICENSE "$pkgdir"/opt/git-issues
        
    install -D LICENSE "$pkgdir"/usr/share/licenses/git-issues-git/LICENSE
}
