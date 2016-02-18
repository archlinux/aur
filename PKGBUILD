pkgname="terminal_markdown_viewer"
pkgver=125.a153696
pkgrel=1
pkgdesc="Styled Terminal Markdown Viewer"
url="https://github.com/axiros/terminal_markdown_viewer"
arch=('any')
license=('BSD')
makedepends=()
depends=(python2-markdown python2-pygments python2-yaml python2)
source=(git+https://github.com/axiros/terminal_markdown_viewer)
md5sums=(SKIP)

pkgver() {
    cd "${pkgname}"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "$srcdir/terminal_markdown_viewer"

    sed -re '1s/env python$/&2.7/' -i mdv.py
}

package() {
    local target="${pkgdir}/usr/lib/python2.7/site-packages/mdv/"

    cd "$srcdir/terminal_markdown_viewer"

    install -dm755 $target
    install -Dm644 mdv.py $target/mdv.py
    install -Dm644 __init__.py $target/__init__.py
    install -Dm644 docopt.py $target/docopt.py
    install -Dm644 ansi_tables.json $target/ansi_tables.json
    install -Dm644 tabulate.py $target/tabulate.py

    install -dm755 ${pkgdir}/usr/bin
    cat > ${pkgdir}/usr/bin/mdv <<CAT
#!/bin/bash

exec python2 ${target##$pkgdir}/mdv.py "\${@}"

CAT

    chmod +x ${pkgdir}/usr/bin/mdv
}
