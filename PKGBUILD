# Author: futpib <futpib@gmail.com>
# Inspired by `cask' AUR package by Sebastien Duthil <duthils@duthils.net>

pkgname=cask
pkgver=r882.d731e96
pkgrel=1
pkgdesc="Project management tool for Emacs"
arch=('any')
url='https://github.com/cask/cask'
license=('GPL')
depends=('emacs' 'python')
makedepends=('git')
source=("git://github.com/cask/cask.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"

    # cask executable needs to be one directory deeper than cask-cli.el
    __prefix="${pkgdir}/usr/share/${pkgname}"
    install -d "${__prefix}"
    install -Dm644 *.el "${__prefix}/"
    install -d "${__prefix}/bin"
    install -Dm755 "bin/cask" "${__prefix}/bin"
    install -d "${__prefix}/templates"
    install -Dm644 templates/* "${__prefix}/templates/"
    touch "${__prefix}/.no-upgrade"  # Stop cask performing self-upgrades.

    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/share/cask/bin/cask" "${pkgdir}/usr/bin/"

    __site_lisp="${pkgdir}/usr/share/emacs/site-lisp/${pkgname}"
    install -d "${__site_lisp}"
    ln -s "/usr/share/${pkgname}/"cask{,-bootstrap}.el "${__site_lisp}/"
}
