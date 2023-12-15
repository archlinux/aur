# Author:     David Rosca <nowrep@gmail.com>
# Maintainer: Martin Stibor <martin.von.reichenberg@proton.me>

pkgname=dualsensectl-git
_pkgname=dualsensectl
pkgver=0.4.r1.g602ffe4
pkgrel=2
pkgdesc='Tool for controlling Sony PlayStation 5 DualSense controller on Linux'
arch=('any')
url='https://github.com/nowrep/dualsensectl'
license=('GPL2')
depends=('systemd' 'systemd-libs' 'dbus' 'hidapi' 'gcc-libs' 'glibc')
makedepends=('git' 'gcc' 'make' 'pkgconf')
provides=('dualsensectl')
conflicts=('dualsensectl')
source=("${_pkgname}-${pkgver}::git+https://github.com/nowrep/dualsensectl#branch=main")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g' ||
    											 
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
    make -C "${srcdir}/${_pkgname}-${pkgver}/"
}

package() {
    make -C "${srcdir}/${_pkgname}-${pkgver}/" DESTDIR="${pkgdir}/" install all
}

install() {
    $(CC) "${srcdir}/${_pkgname}-${pkgver}/main.c" -o "$(TARGET)" "$(DEFINES)" "$(CFLAGS)" "$(LIBS)"
    install -D -m 755 -p "${srcdir}/${_pkgname}-${pkgver}/$(TARGET)" "$(DESTDIR)/usr/bin/$(TARGET)"
    install -D -m 755 -p "${srcdir}/${_pkgname}-${pkgver}/completion/$(TARGET)" "$(DESTDIR)/usr/share/bash-completion/completions/$(TARGET)"
    install -D -m 755 -p "${srcdir}/${_pkgname}-${pkgver}/completion/_$(TARGET)" "$(DESTDIR)/usr/share/zsh/site-functions/_$(TARGET)"
}
