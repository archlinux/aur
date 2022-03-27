# Author: futpib <futpib@gmail.com>
# Inspired by `cask' AUR package by Sebastien Duthil <duthils@duthils.net>

pkgname=cask-git
pkgver=r1135.218433b
pkgrel=1
pkgdesc="Project management tool for Emacs"
arch=('any')
url='https://github.com/cask/cask'
license=('GPL')
depends=('emacs' 'python')
makedepends=('git')
provides=('cask')
conflicts=('cask')
source=("git+https://github.com/cask/cask.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/cask"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/cask"

    # cask executable needs to be one directory deeper than cask-cli.el
    __prefix="${pkgdir}/usr/share/cask"
    install -d "${__prefix}"
    install -Dm644 *.el "${__prefix}/"
    install -d "${__prefix}/bin"
    install -Dm755 "bin/cask" "${__prefix}/bin"
    touch "${__prefix}/.no-upgrade"  # Stop cask performing self-upgrades.

    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/share/cask/bin/cask" "${pkgdir}/usr/bin/"

    __site_lisp="${pkgdir}/usr/share/emacs/site-lisp/cask"
    install -d "${__site_lisp}"
    ln -s "/usr/share/cask/"cask{,-bootstrap}.el "${__site_lisp}/"
}
