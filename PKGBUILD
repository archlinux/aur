# Maintainer: Cooper Pierce <cppierce@andrew.cmu.edu>
pkgname=c0
_reponame="${pkgname}"
pkgver=553
pkgrel=1
epoch=1
pkgdesc="A small safe subset of the C programming language, augmented with contracts"
url="http://c0.cs.cmu.edu"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('libpng>=1.2' 'zlib>=1.2' 'gcc>=5.1' 'ncurses5-compat-libs>=6.0')
makedepends=('mlton' 'git')
provides=('cc0')
source=("$pkgname::git+https://bitbucket.org/c0-lang/c0.git#commit=0547f597f1b2a4603988920d010f66f091ea157d")
md5sums=('SKIP')

build() {
    cd "${_reponame}/cc0"
    ./configure
    # Use 2 cores to avoid OOM issues
    make -j2
}

check() {
    cd "${_reponame}/cc0"
    make check
}

package() {
    cd "${_reponame}/cc0"
    make install PREFIX="${pkgdir}/usr/share/c0"
    bins=('coin' 'cc0' 'codex' 'wrappergen')
    mkdir -p "${pkgdir}/usr/bin"
    for bin in "${bins[@]}"; do
        echo -e "#!/bin/sh\n\n/usr/share/c0/bin/${bin}.bin \$@" > "${pkgdir}/usr/bin/${bin}"
        chmod 755 "${pkgdir}/usr/bin/${bin}"
    done

    # License missing until upstream adds it to repo.
}
