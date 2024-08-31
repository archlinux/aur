# Maintainer: rilian-la-te <ria.freelander@gmail.com>

_opts=(
	-DCMAKE_INSTALL_PREFIX=/usr 
	-DCMAKE_INSTALL_LIBDIR=lib
	-DCMAKE_INSTALL_LIBEXECDIR=lib
)

makedepends=('vala' 'gtk3' 'vala-panel>=0.4.62' 'libwnck3' 'meson' 'ninja' 'git' 'glib2-devel')
pkgname=(
'vala-panel-applets-xembed-git'
)
pkgbase=vala-panel-applets-gpl-git
_pkgbase=vala-panel-applets-gpl
pkgver=r91.e158438
pkgrel=1
pkgdesc="Cyclically spawns a script/program, captures its output and displays the resulting string in the panel"
url="https://gitlab.com/vala-panel-project/vala-panel-applets-gpl"
arch=('i686' 'x86_64')
license=('GPL')
source=("git+https://gitlab.com/vala-panel-project/${_pkgbase}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
	meson build "${srcdir}/${_pkgbase}" --prefix=/usr
	meson compile -C build
}

package_vala-panel-applets-xembed-git(){
	pkgdesc="Old XEmbed system tray for vala-panel"
	depends=('gtk3' 'vala-panel>=0.4.62' 'libx11' 'libxrender')
	provides=("vala-panel-applets-xembed")
	conflicts=("vala-panel-applets-xembed")
	DESTDIR="${pkgdir}" meson install -C build
	rm -rf ${pkgdir}/usr/share/{vala-panel-applets,glib-2.0,locale}
	rm -rf ${pkgdir}/usr/share/vala-panel/applets/{com.solus.icontasks,org.valapanel.flowtasks}.plugin
	rm -rf ${pkgdir}/usr/lib/vala-panel/applets/{libicontasks,libflowtasks}.so
}


