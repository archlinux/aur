# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: rilian-la-te <ria.freelander@gmail.com>

_disable_mate=0
_disable_xfce=0
_disable_vala=0
_disable_budgie=0

_base="vala"
_pkg="genmon"
_pkgname="${_pkg}-plugin"
_name="generic-monitor"
pkgname=(
  "${_pkgname}-common"
)
depends=()
_opts=(
  -DCMAKE_INSTALL_PREFIX=/usr 
  -DCMAKE_INSTALL_LIBDIR=lib
  -DCMAKE_INSTALL_LIBEXECDIR=lib
)

makedepends=(
  'cmake'
  "${_base}"
  'gtk3'
  'libpeas')

if (("${_disable_mate}" == 0));then
	_opts+=(-DENABLE_MATE=ON)
	pkgname+=("mate-panel-${_pkg}")
	makedepends+=("mate-panel")
#	msg "Mate applet enabled"
else
	_opts+=(-DENABLE_MATE=OFF)
fi

if (("${_disable_xfce}" == 0)); then
	_opts+=(-DENABLE_XFCE=ON)
	pkgname+=("xfce4-panel-${_pkg}-ng")
	makedepends+=('xfce4-panel>=4.11.2')
#	msg "Xfce applet enabled"
else
	_opts+=(-DENABLE_XFCE=OFF)
fi

if (("${_disable_vala}" == 0)); then
	_opts+=(-DENABLE_VALAPANEL=ON)
	pkgname+=("${_base}-panel-${_pkg}")
	makedepends+=("${_base}-panel>=0.4.60")
#	msg "Vala Panel applet enabled"
else
	_opts+=(-DENABLE_VALAPANEL=OFF)
fi

if (("${_disable_budgie}" == 0)); then
	_opts+=(-DENABLE_BUDGIE=ON)
	pkgname+=("budgie-${_pkg}")
	makedepends+=('budgie-desktop')
#	msg "Budgie applet enabled"
else
	_opts+=(-DENABLE_BUDGIE=OFF)
fi


#msg "If you want to disable an applet, edit pkgbuild variables _disable_[applet]"

pkgbase="${_name}-plugin"
_project="xfce4-${_pkgname}"
_ns="${_base}-panel-project"
_repo="https://gitlab.com/${_ns}"
_cmake_name="cmake-${_base}"
_dbusmenuname="${_base}-dbusmenu"
pkgver=2021.10.27
pkgrel=3
_pkgdesc=("Cyclically spawns a script/program, captures its output "
	  "and displays the resulting string in the panel")
pkgdesc="${_pkgdesc[*]}"
url="${_repo}/${_project}"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'pentium4')
license=('LGPL')
_commit="d8f2540730747f955f45ba1fbd32e2aaa3277ad2"
# _cmake_commit="d041cd5bd5527926ca1217c751b9e7878eed1283"
_cmake_commit="r3"
source=("${url}/-/archive/${_commit}/${_project}-${_commit}.tar.gz"
        "${_repo}/${_cmake_name}/-/archive/${_cmake_commit}/${_cmake_name}-${_cmake_commit}.tar.gz")
sha256sums=('566352618c3cbd6d7218df5a93ef9dd6fda17b63d304b9f0dfc99666246cdf81'
            '1d0710b220f0ddc1f045dc5a310537fb8fb7ee2069156e84e28de1c2516f0903')

prepare() {
  cd "${srcdir}/${_cmake_name}-${_cmake_commit}"
  cp -r . "${srcdir}/${_project}-${_commit}/cmake"
  ls "${srcdir}/${_project}-${_commit}"
  sed "/FallbackVersion.cmake/d" \
      -i "${srcdir}/${_project}-${_commit}/CMakeLists.txt"
}

build(){
  cd "${srcdir}/${_project}-${_commit}"
  cmake ./ "${_opts[@]}"
  make
}

package_xfce4-panel-genmon-ng(){
  pkgdesc="${_pkgdesc[*]}"
  depends=('gtk3'
           'xfce4-panel>=4.11.2'
           "${_pkgname}-common")
  provides=("xfce4-panel-${_pkg}")
  cd "${srcdir}/${_project}-${_commit}"
  make -C "src" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/genmon-scripts"
  rm -rf "${pkgdir}/usr/lib/${_base}-panel"
  rm -rf "${pkgdir}/usr/share/mate-panel"
  rm -rf "${pkgdir}/usr/share/${_base}-panel"
  rm -rf "${pkgdir}/usr/lib/mate-panel"
  rm -rf "${pkgdir}/usr/lib/budgie-desktop"
  rm -rf "${pkgdir}/usr/share/glib-2.0"
  rm -rf "${pkgdir}/usr/share/dbus-1"
}

package_mate-panel-genmon(){
  pkgdesc="${_pkgdesc[*]}"
  depends=('gtk3'
           'mate-panel'
           "${_pkgname}-common")
  cd "${srcdir}/${_project}-${_commit}"
  make -C "src" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/${_pkg}-scripts"
  rm -rf "${pkgdir}/usr/lib/${_base}-panel"
  rm -rf "${pkgdir}/usr/lib/xfce4"
  rm -rf "${pkgdir}/usr/share/xfce4"
  rm -rf "${pkgdir}/usr/share/${_base}-panel"
  rm -rf "${pkgdir}/usr/lib/budgie-desktop"
  rm -rf "${pkgdir}/usr/share/glib-2.0"
}

package_vala-panel-genmon(){
  pkgdesc="${_pkgdesc[*]}"
  depends=('gtk3'
           "${_base}-panel>=0.4.60"
           "${_pkgname}-common")
  provides=("${_base}-panel-applets-${_pkg}")
  cd "${srcdir}/${_project}-${_commit}"
  make -C "src" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/${_pkg}-scripts"
  rm -rf "${pkgdir}/usr/lib/xfce4"
  rm -rf "${pkgdir}/usr/share/xfce4"
  rm -rf "${pkgdir}/usr/share/mate-panel"
  rm -rf "${pkgdir}/usr/lib/mate-panel"
  rm -rf "${pkgdir}/usr/lib/budgie-desktop"
  rm -rf "${pkgdir}/usr/share/glib-2.0"
  rm -rf "${pkgdir}/usr/share/dbus-1"
}

package_budgie-genmon(){
  _base="vala"
  _pkg="genmon"
  _pkgname="${_pkg}-plugin"
  _project="xfce4-${_pkgname}"
  _pkgdesc=("Cyclically spawns a script/program, captures its output "
            "and displays the resulting string in the panel")
  pkgdesc="${_pkgdesc[*]}"
  depends=('budgie-desktop'
           'gtk3'
           'libpeas'
           "${_pkgname}-common")
  cd "${srcdir}/${_project}-${_commit}"
  make -C "src" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/${_pkg}-scripts"
  rm -rf "${pkgdir}/usr/lib/xfce4"
  rm -rf "${pkgdir}/usr/share/xfce4"
  rm -rf "${pkgdir}/usr/share/mate-panel"
  rm -rf "${pkgdir}/usr/share/${_base}-panel"
  rm -rf "${pkgdir}/usr/lib/mate-panel"
  rm -rf "${pkgdir}/usr/lib/${_base}-panel"
  rm -rf "${pkgdir}/usr/share/glib-2.0"
  rm -rf "${pkgdir}/usr/share/dbus-1"
}

package_genmon-plugin-common(){
  pkgdesc="Translations and script examples for GenMon"
  depends=('bash' 'perl')	
  optdepends=("xfce4-panel-${_pkg}: XFCE4 panel applet"
  	      "mate-panel-${_pkg}: MATE panel applet"
  	      "${_base}-panel-${_pkg}: Vala panel applet"
  	      "budgie-${_pkg}: Budgie panel applet")
  arch=('any')
  cd "${srcdir}/${_project}-${_commit}"
  make -C "po" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share/xfce4"
  rm -rf "${pkgdir}/usr/share/mate-panel"
  rm -rf "${pkgdir}/usr/share/${_base}-panel"
  rm -rf "${pkgdir}/usr/share/dbus-1"
  rm -rf "${pkgdir}/usr/lib/mate-panel"
  rm -rf "${pkgdir}/usr/lib/${_base}-panel"
  rm -rf "${pkgdir}/usr/lib/budgie-desktop"
  rm -rf "${pkgdir}/usr/lib/xfce4"
}
