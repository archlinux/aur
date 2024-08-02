# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgname=astal-git
_pkgname=astal
_reponame=Astal
pkgver=r489.0e2a33b
pkgrel=1
pkgdesc="JavaScript/TypeScript framework for creating Linux Desktops ontop of Wayland compositors "
arch=('x86_64')
url="https://github.com/Aylur/Astal"
license=('GPL-3.0-only')
makedepends=('git' 'gobject-introspection' 'glib2-devel' 'meson' 'npm' 'typescript')
depends=('gjs' 'glib2' 'glibc' 'gtk4' 'gtk4-layer-shell' 'libpulse' 'pam')
optdepends=('gnome-bluetooth-3.0: required for bluetooth service'
            'greetd: required for greetd service'
            'libsoup3: required for the Utils.fetch feature'
            'libnotify: required for sending notifications'
            'networkmanager: required for network service'
            'power-profiles-daemon: required for powerprofiles service'
            'upower: required for battery service')
provides=("astal")
backup=('etc/pam.d/astal')
source=("git+${url}"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
        "astal.sh")
sha256sums=('SKIP'
            'SKIP'
            '6f5e5de63dc613cd62497c89540b09de5e0cec64aa0450094d282776e20bb2ee')

pkgver(){
  cd $srcdir/Astal
  #git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd $srcdir/$_reponame
  git submodule init
  git config submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd $srcdir/$_reponame
  npm install
  arch-meson build --libdir "lib/$_pkgname" -Dbuild_types=true
  meson compile -C build
}

package() {
  cd $srcdir/$_reponame
  meson install -C build --destdir "$pkgdir"
  install -Dm 755 ../astal.sh "${pkgdir}/usr/bin/astal"
}
