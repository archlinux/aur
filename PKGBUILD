# Author:     David Rosca <nowrep@gmail.com>
# Maintainer: Martin Stibor <martin.von.reichenberg@proton.me>

pkgname=dualsensectl-git
_pkgname=dualsensectl
pkgver=v0.4.r1.g602ffe4
pkgrel=1
pkgdesc='Tool for controlling Sony PlayStation 5 DualSense controller on Linux'
arch=('any')
url='https://github.com/nowrep/dualsensectl'
license=('GPL2')
depends=('systemd' 'systemd-libs' 'dbus' 'hidapi' 'glibc' 'libudev0-shim')
makedepends=('git' 'base-devel')
conflicts=('dualsensectl')
source=("$_pkgname::git+https://github.com/nowrep/dualsensectl#branch=main")
sha512sums=('SKIP')
options=('!strip')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
    make -C "$_pkgname"
}

package() {
    make -C "$_pkgname" DESTDIR="$pkgdir" install all
}

install() {
    $(CC) main.c -o $(TARGET) $(DEFINES) $(CFLAGS) $(LIBS)
    install -D -m 755 -p $(TARGET) $(DESTDIR)/usr/bin/$(TARGET)
    install -D -m 755 -p completion/$(TARGET) $(DESTDIR)/usr/share/bash-completion/completions/$(TARGET)
    install -D -m 755 -p completion/_$(TARGET) $(DESTDIR)/usr/share/zsh/site-functions/_$(TARGET)
}
