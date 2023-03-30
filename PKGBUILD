# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
_pkgname=cheesecutter
_gitname=CheeseCutter

pkgname=cheesecutter-git
pkgver=2.9.beta.3.r30.g84450d3
pkgrel=1
pkgdesc="Tracker program for composing music for the C64 SID chip"
arch=('x86_64')
url="https://github.com/theyamo/${_gitname}"
license=('GPL2')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('acme' 'gcc-d' 'git')
provides=('cheesecutter')
conflicts=('cheesecutter' 'cheesecutter-stereo')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_gitname}"
    sed -i -r 's/^COMFLAGS=.*/COMFLAGS=-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now/' Makefile
    make release
}

package() {
    cd "${srcdir}/${_gitname}"

    install -dm755 ${pkgdir}/usr/bin
    install -m755 ccutter ${pkgdir}/usr/bin
    install -m755 ct2util ${pkgdir}/usr/bin

    install -dm755 ${pkgdir}/usr/share/applications
    install -m644 arch/fd/ccutter.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop

    install -dm755 ${pkgdir}/usr/share/doc/${_pkgname}
    install -m644 doc/README ${pkgdir}/usr/share/doc/${_pkgname}

    install -dm755 ${pkgdir}/usr/share/licenses/${_pkgname}
    install -m644 LICENSE.md ${pkgdir}/usr/share/licenses/${_pkgname}

    install -dm755 ${pkgdir}/usr/share/icons/hicolor/32x32/apps
    install -dm755 ${pkgdir}/usr/share/icons/hicolor/48x48/apps
    install -dm755 ${pkgdir}/usr/share/icons/hicolor/96x96/apps
    install -m644 icons/cc32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png
    install -m644 icons/cc48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_pkgname}.png
    install -m644 icons/cc96.png ${pkgdir}/usr/share/icons/hicolor/96x96/apps/${_pkgname}.png

    install -dm755 ${pkgdir}/usr/share/${_pkgname}/tunes
    install -m644 tunes/*.ct ${pkgdir}/usr/share/${_pkgname}/tunes
}
