# Maintainer: rilian-la-te <ria.freelander@gmail.com>

_pkgname=vala-panel
pkgname=${_pkgname}-git
pkgver=0.5.2
pkgrel=1
pkgdesc="Gtk3 panel for compositing window managers"
url="https://gitlab.com/vala-panel-project/vala-panel"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('gtk3' 'libwnck3' 'gtk-layer-shell' 'appmenu-glib-translator')
makedepends=('meson' 'vala' 'git')
provides=("vala-panel=${pkgver}")
conflicts=('vala-panel-sntray' 'vala-panel-sntray-git')
optdepends=('vala-panel-appmenu-valapanel: Global Menu'
			'vala-panel-applets-xembed: Old system tray'
			'vala-panel-applets-icontasks: Budgie tasklist'
			'vala-panel-genmon: GenMon applet')
source=("git+https://gitlab.com/vala-panel-project/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  meson build "${srcdir}/${_pkgname}" --prefix=/usr --libdir=lib --libexecdir=lib -Dwnck=enabled -Dplatforms=x11,layer-shell
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}


