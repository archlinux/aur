# Maintainer: Alex Grabowski <hurufu+aur@gmail.com>

pkgname=aprolog-git
pkgver=0.4.r15.g01ebffa
pkgrel=1
pkgdesc='αProlog a prototype nominal logic programming language'
provides=(aprolog)
arch=(i686 x86_64)
url='https://homepages.inf.ed.ac.uk/jcheney/programs/aprolog/'
license=(GPL-3.0-only)
depends=(rlwrap)
makedepends=(ocaml texlive-bin gzip)
source=(
    'git+https://github.com/aprolog-lang/aprolog.git'
    'https://raw.githubusercontent.com/akcheung/apsys13/refs/heads/master/ttquot.sty'
)
sha256sums=(
    SKIP
    6326af83786801306ac6ed051269dc3121a30eecba8d7932d688fe89eef44cec
)
_share=/usr/share/aprolog

pkgver() {
    cd aprolog
    echo 0.4.r$(git rev-list --count 9aea063..HEAD).g$(git rev-parse --short HEAD)
}

prepare() {
    cp ttquot.sty aprolog/doc
    cp ../config.ml aprolog/src
    chmod -R a-x aprolog/src/*.ml*
}

build() {
    cd aprolog
    mkdir bin
    make -C src aprolog
    make -C doc all
}

check() {
    # It only works when aprolog is already installed, because of hardcoded library path
    make -C aprolog/examples/simple all APROLOG='aprolog -q'
}

package() {
    install -Dm755 ../aprolog.sh "$pkgdir/usr/bin/aprolog"
    cd aprolog
    install -Dm755 src/aprolog "$pkgdir/usr/libexec/aprolog"
    install -Dm644 -t "$pkgdir/$_share" lib/*.apl
    install -Dm644 -t "$pkgdir/usr/share/examples/aprolog" examples/simple/*.apl
    cd doc
    gzip guide.ps
    install -Dm644 guide.ps.gz "$pkgdir/usr/share/doc/aprolog/ps/guide.ps.gz"
    install -Dm644 guide.pdf "$pkgdir/usr/share/doc/aprolog/pdf/guide.pdf"
}
