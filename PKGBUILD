# Maintainer: Nicholas Novak <34256932+NickyBoy89@users.noreply.github.com>
pkgname=cobra-git
pkgver=4.6.r6.g5c1eeef
pkgrel=1
pkgdesc='An interactive (fast) static source code analyzer '
depends=('glibc' 'bash')
optdepends=('tk: For the interactive graphical interfaces'
            'graphviz: To view graphs of finite automata')
makedepends=('git')
arch=('x86_64')
url='https://spinroot.com/cobra/'
license=('BSD-3-Clause')
provides=('cobra')
conflicts=('cobra')
source=("$pkgname"::'git+https://github.com/nimble-code/Cobra')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^version-//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

build() {
    cd "$srcdir/$pkgname"
    # The binary
    make APP="src_app" -C src linux c.ar
    # The GUI app
    cp src/c.ar src_app/
    make LDFLAGS="c.ar -pthread" -C src_app clean all
}

package() {
    cd "$srcdir/$pkgname"

    # Copy the binaries over
    install -Dm 755 src/cobra "${pkgdir}/usr/bin/cobra"

    # The TCL gui files are executable scripts
    install -Dm 755 gui/window.tcl "${pkgdir}/usr/bin/cobra-window"
    install -Dm 755 gui/icobra.tcl "${pkgdir}/usr/bin/icobra"

    # Rules files
    install -d "${pkgdir}/usr/share/${pkgname}/"
    cp -r rules/ "${pkgdir}/usr/share/${pkgname}/"
    
    # License
    install -Dm  644 doc/License "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Man files
    install -d "${pkgdir}/usr/share/man/man1"
    cp doc/*.1 "${pkgdir}/usr/share/man/man1/"

    # The gui application
    install -Dm 755 src_app/cwe "${pkgdir}/usr/bin/"
    install -Dm 755 src_app/scope_check "${pkgdir}/usr/bin/"
    install -Dm 755 src_app/find_taint "${pkgdir}/usr/bin/"
    install -Dm 755 src_app/json_convert "${pkgdir}/usr/bin/"
}
