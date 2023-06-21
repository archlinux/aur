# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: rilian-la-te <ria.freelander@gmail.com>

_disable_mate=0
_disable_xfce=0
_disable_vala=0
_disable_budgie=0

_base="vala"
_pkg="sntray"
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
	pkgname+=("xfce4-panel-${_pkg}")
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

_pkgdesc() {
  local _prog="${1}"
  local _pkgdesc=("Plugin for ${_prog} to show StatusNotifierItems "
                  "(AppIndicators) via FlowBox")
  echo "${_pkgdesc[*]}"
}
	
#msg "If you want to disable an applet, edit pkgbuild variables _disable_[applet]"

pkgbase="${_base}-panel-${_pkg}"
_project="xfce4-${_pkgname}"
_ns="${_base}-panel-project"
_repo="https://gitlab.com/${_ns}"
_cmake_name="cmake-${_base}"
_dbusmenuname="${_base}-dbusmenu"
pkgver=2021.10.27
pkgrel=1
_pkgdesc="$(_pkgdesc xfce4-panel)"
pkgdesc="${_pkgdesc[*]}"
url="${_repo}/${_project}"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'pentium4')
license=('LGPL')
_commit="a5028a3cdfd38eb19593794037ac4fc97a5822e0"
_cmake_commit="d041cd5bd5527926ca1217c751b9e7878eed1283"
source=("${url}/-/archive/${_commit}/${_project}-${_commit}.tar.gz"
        "${_repo}/${_cmake_name}/-/archive/${_cmake_commit}/${_cmake_name}-${_cmake_commit}.tar.gz")
sha256sums=('86d4ddb2fa82057d75bc52f5ced9d9192f7e9377d3bf788b229b22f994e67a73'
            'cedc7b175d81ea3975415ad57fe9ed28c9463e4e500af9912ce1b0352c9c6b10')

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

package_xfce4-panel-sntray(){
  pkgdesc="${_pkgdesc[*]}"
  depends=('gtk3'
           'xfce4-panel>=4.11.2'
           "${_pkgname}-common")
  optdepends=("${_base}-panel-extras-volume: ALSA volume applet"
              "${_base}-panel-extras-battery: UPower battery applet"
              "${_base}-panel-extras-weather: Weather applet"
              "${_base}-panel-extras-xkb: XKB applet"
              'sni-qt: Qt applications for StatusNotifier'
              'libappindicator-gtk2: Gtk2 applications for StatusNotifier'
              'libappindicator-gtk3: Gtk3 applications for StatusNotifier')
  cd "${srcdir}/${_project}-${_commit}"
  make -C "src" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/${_base}-panel"
  rm -rf "${pkgdir}/usr/share/mate-panel"
  rm -rf "${pkgdir}/usr/share/${_base}-panel"
  rm -rf "${pkgdir}/usr/lib/mate-panel"
  rm -rf "${pkgdir}/usr/lib/budgie-desktop"
  rm -rf "${pkgdir}/usr/share/glib-2.0"
  rm -rf "${pkgdir}/usr/share/dbus-1"
}

package_mate-panel-sntray(){
  _pkgdesc="$(_pkgdesc mate-panel)"
  depends=('gtk3'
	   'mate-panel'
	   "${_pkgname}-common")
  optdepends=("${_base}-panel-extras-volume: ALSA volume applet"
              "${_base}-panel-extras-battery: UPower battery applet"
              "${_base}-panel-extras-weather: Weather applet"
              "${_base}-panel-extras-xkb: XKB applet"
              'sni-qt: Qt applications for StatusNotifier'
              'libappindicator-gtk2: Gtk2 applications for StatusNotifier'
              'libappindicator-gtk3: Gtk3 applications for StatusNotifier')
  cd "${srcdir}/${_project}-${_commit}"
  make -C "src" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/${_base}-panel"
  rm -rf "${pkgdir}/usr/lib/xfce4"
  rm -rf "${pkgdir}/usr/share/xfce4"
  rm -rf "${pkgdir}/usr/share/${_base}-panel"
  rm -rf "${pkgdir}/usr/lib/budgie-desktop"
  rm -rf "${pkgdir}/usr/share/glib-2.0"
}

package_vala-panel-sntray(){
  pkgdesc="$(_pkgdesc vala-panel)"
  provides=("${_base}-panel-applets-${_pkg}")
  depends=('gtk3'
	   "${_base}-panel"
	   "${_pkgname}-common")
  optdepends=("${_base}-panel-extras-volume: ALSA volume applet"
              "${_base}-panel-extras-battery: UPower battery applet"
              "${_base}-panel-extras-weather: Weather applet"
              "${_base}-panel-extras-xkb: XKB applet"
              "sni-qt: Qt applications for StatusNotifier"
              'libappindicator-gtk2: Gtk2 applications for StatusNotifier'
              'libappindicator-gtk3: Gtk3 applications for StatusNotifier')
  cd "${srcdir}/${_project}-${_commit}"
  make -C "src" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/xfce4"
  rm -rf "${pkgdir}/usr/share/xfce4"
  rm -rf "${pkgdir}/usr/share/mate-panel"
  rm -rf "${pkgdir}/usr/lib/mate-panel"
  rm -rf "${pkgdir}/usr/lib/budgie-desktop"
  rm -rf "${pkgdir}/usr/share/glib-2.0"
  rm -rf "${pkgdir}/usr/share/dbus-1"
}

package_budgie-sntray(){
  pkgdesc="$(_pkgdesc budgie)"
  depends=('budgie-desktop'
	   'gtk3'
	   'libpeas'
	   "${_pkgname}-common")
  optdepends=("${_base}-panel-extras-volume: ALSA volume applet"
              "${_base}-panel-extras-battery: UPower battery applet"
              "${_base}-panel-extras-weather: Weather applet"
              "${_base}-panel-extras-xkb: XKB applet"
              'sni-qt: Qt applications for StatusNotifier'
              'libappindicator-gtk2: Gtk2 applications for StatusNotifier'
              'libappindicator-gtk3: Gtk3 applications for StatusNotifier')
  cd "${srcdir}/${_project}-${_commit}"
  make -C "src" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/xfce4"
  rm -rf "${pkgdir}/usr/share/xfce4"
  rm -rf "${pkgdir}/usr/share/mate-panel"
  rm -rf "${pkgdir}/usr/share/${_base}-panel"
  rm -rf "${pkgdir}/usr/lib/mate-panel"
  rm -rf "${pkgdir}/usr/lib/${_base}-panel"
  rm -rf "${pkgdir}/usr/share/glib-2.0"
  rm -rf "${pkgdir}/usr/share/dbus-1"
}

package_sntray-plugin-common(){
  _pkgdesc=("Translations and common files "
	   "for StatusNotifier Menu")
  pkgdesc="${_pkgdesc[*]}"
  optdepends=("xfce4-panel-${_pkg}"
	      "mate-panel-${_pkg}"
	      "${pkgbase}"
	      "budgie-${_pkg}")
  replaces=("${_pkgname}-translations")
  arch=('any')
  cd "${srcdir}/${_project}-${_commit}"
  make -C "po" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share/xfce4"
  rm -rf "${pkgdir}/usr/share/mate-panel"
  rm -rf "${pkgdir}/usr/share/${_base}-panel"
  rm -rf "${pkgdir}/usr/lib/"
  rm -rf "${pkgdir}/usr/share/dbus-1"
}
