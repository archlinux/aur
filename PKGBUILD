# Maintainer:  tywyqu <tywyqu at hi2 dot in>
# Contributor: M A <morealaz at gmail dot com>
# Contributor: Saeid Ahmed <itsaeid@gmail.com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Rob Lynn <rob22uk at gmail dot com>
# Contributor: DerFlob <derflob at derflob dot de>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>

pkgname=tilda-wayland-git
pkgver=1.5.2.r0.g0d7a986
pkgrel=1
pkgdesc="A Gtk based drop down terminal for Linux and Unix. With Wayland support."
arch=('x86_64')
url="https://github.com/lanoxx/tilda"
license=('GPL')
depends=('confuse' 'vte3')
makedepends=('git')
provides=("${pkgname%-wayland-git}")
conflicts=("${pkgname%-wayland-git}")
source=("git+${url}.git"
    "${url}/commit/b16c4fc5855899ce9eabc64673dc96afbdebeead.patch"
    "${url}/commit/89187b6d2f5042428c5cefb21e447254088dfe58.patch")
sha512sums=('SKIP'
    '52e959f2e063da4bef288e86e26fb9d623e9c6cc5180eb6e23ccadd79f3ffb361431ff09c513b100b9b3800228e6b35efb16f7697dab66b056bd811ec2fafab0'
    'f92e2ac69d15fca463b5bbc725a641fab45574ef8032e465e30a44ab3ff130444c588793461f30db0fd1d0a2d37bc94b2538e45e0816160825983c5c327f2b2a')

pkgver() {
    cd ${pkgname%-wayland-git}
    git describe --long --tags $(git rev-list --tags --max-count=1) | sed 's/^tilda-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${pkgname%-wayland-git}
    git am ../b16c4fc5855899ce9eabc64673dc96afbdebeead.patch
    git am ../89187b6d2f5042428c5cefb21e447254088dfe58.patch
    sed -E "s|@BINDIR@/tilda|@BINDIR@/tilda --dbus|g" -i tilda.desktop.in
}

build() {
    cd ${pkgname%-wayland-git}
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd ${pkgname%-wayland-git}
    make DESTDIR="${pkgdir}/" install

    toggle="dbus-send --session --type=method_call --dest=com.github.lanoxx.tilda.Actions0 /com/github/lanoxx/tilda/Actions0 com.github.lanoxx.tilda.Actions.Toggle"
    printf "\n\e[1;31m==> Add Keyboard Shortcut to toggle tilda:\e[0m\n    $toggle\n\e[1;31m==> --------------------------------------\e[0m\n"
}
# vim:set ts=4 sw=4 et:
