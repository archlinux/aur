# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: rilian-la-te <ria.freelander@gmail.com>

_opts=(
	-DCMAKE_INSTALL_PREFIX=/usr 
	-DCMAKE_INSTALL_LIBDIR=lib
	-DCMAKE_INSTALL_LIBEXECDIR=lib
)

_base="vala"
_pkg="vala-panel"
_pkgbase="vala-panel-applets"

makedepends=(
  "${_base}"
  'gtk3'
  "${_pkg}>=0.4.62"
  'libwnck3'
  'meson'
  'ninja')
pkgname=(
  "${_pkgbase}-xembed"
  "${_pkgbase}-icontasks"
)
pkgbase="${_pkgbase}-gpl"
pkgver=2022.05.20
pkgrel=1
pkgdesc="Cyclically spawns a script/program, captures its output and displays the resulting string in the panel"
url="https://gitlab.com/${_pkg}-project/${pkgbase}"
arch=('i686' 'x86_64')
license=('GPL')
_commit="74de68ced30d5195a3e47361ddfb30823be0a757"
source=("${url}/-/archive/${_commit}/${pkgbase}-${_commit}.tar.gz")
sha256sums=('708c419cf4e78aeb7d53514ae399dff9d0395eb3060a2c6dba91c5f027f7eef0')

build(){
	meson build "${srcdir}/${pkgbase}-${_commit}" --prefix=/usr
	meson compile -C build
}

package_vala-panel-applets-xembed(){
	pkgdesc="Old XEmbed system tray for vala-panel"
	depends=('gtk3' 'vala-panel>=0.4.62' 'libx11' 'libxrender')
	DESTDIR="${pkgdir}" meson install -C build
	rm -rf ${pkgdir}/usr/share/{"${_pkgbase}",glib-2.0,locale}
	rm -rf "${pkgdir}/usr/share/${_pkg}/applets/"{com.solus.icontasks,org.valapanel.flowtasks}.plugin
	rm -rf "${pkgdir}/usr/lib/${_pkg}/applets/"{libicontasks,libflowtasks}.so
}

package_vala-panel-applets-icontasks(){
	pkgdesc="Budgie's icontasks for ${_pkg}"
	depends=('gtk3'
		 "${_pkg}>=0.4.62"
		 'libwnck3')
	DESTDIR="${pkgdir}" meson install -C build
	rm -rf "${pkgdir}/usr/share/${_pkgbase}"
	rm -rf "${pkgdir}/usr/share/glib-2.0/schemas/org.valapanel.flowtasks.gschema.xml"
	rm -rf "${pkgdir}/usr/share/${_pkg}/applets/"{org.valapanel.xembed,org.valapanel.flowtasks}.plugin
	rm -rf "${pkgdir}/usr/lib/${_pkg}/applets/"{libflowtasks,libxembed}.so
}
