# Contributor: twa022 <twa022 at gmail dot com>

# The GTK3 version of dockbarx provides a standalone dock and a mate panel applet
# Unfortunately, this is not compatible with xfce4-dockbarx-plugin which embeds
# the GTK2 dockbarx GNOME applet into the xfce4 panel
# So if you want to use dockbarx on both mate and xfce4 you would have to choose
# one or the other version to install
# To get around that, the PKGBUILD optionally lets you _coinstall this package with dockbarx
# by renaming DockBarX to DockBarM (M for Mate)

# 0: No changes -- cannot be _coinstalled with the GTK2 version
# 1: Change dockbarx to dockbarm -- install alongside dockbarx (GTK2 version)
_coinstall=1

_pkgname=dockbarx
pkgname=${_pkgname}-gtk3-git
_branchname="pygi-migration"
_pkgver=0.92
pkgver=626.fd33e48
pkgrel=2
pkgdesc="DockBarX GTK3 port. (Standalone panel and mate applet)"
arch=('i686' 'x86_64')
#url="https://github.com/M7S/dockbarx"
url="https://github.com/amper128/dockbarx"
license=('GPL3')
depends=('libkeybinder3' 'python2-cairo' 'python2-dbus' 'python2-gobject' 'python2-pillow'
         'python2-xlib' 'python2-xdg' 'python2-xcffib' 'gtk3')
optdepends=('mate-panel: mate applet'
            'zeitgeist: recently used file list'
            'compiz-fusion-plugins-main: opacify plugin'
            'dockmanager: dockmanager plugins'
            'cardapio-bzr: Menu applet for standalone dock - dockx')
makedepends=('git')
provides=("${_pkgname}=${_pkgver}")
#source=("${_pkgname}"::git+https://github.com/M7S/dockbarx.git#branch=${_branchname})
source=("${_pkgname}"::git+https://github.com/amper128/dockbarx.git#branch=${_branchname})

[ "${_coinstall}" == '1' ] || conflicts+=("${_pkgname}" "${_pkgname}-git")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  if [[ "${_coinstall}" == '1' ]] ; then
  cd ${srcdir}/${_pkgname}
  find . -type f -exec sed -i -e 's:dockbarx:dockbarm:g;s:Dockbarx:Dockbarm:g' \
                              -e 's:DockbarX:DockbarM:g;s:DockBarx:DockBarm:g;s:DockBarX:DockBarM:g' \
                              -e 's:dockx:dockm:g;s:DockX:DockM:g' \
                              -e 's:dbx:dbm:g;s:Dbx:Dbm:g;s:DBX:DBM:g' \
                              -e 's:namebar:namebarm:g;s:Namebar:Namebarm:g;s:NameBar:NameBarm:g' '{}' \;
  mv dock{x,m}
  mv dock{x,m}_applets
  mv Dock{X,M}.desktop
  for _file in $( find . -name "*dockbarx*" ) ; do
    mv ${_file} ${_file/dockbarx/dockbarm}
  done
  for _file in $( find . -name "*DockbarX*" ) ; do
    mv ${_file} ${_file/DockbarX/DockbarM}
  done
  for _file in $( find . -maxdepth 2 -name "*DockBarX*" ) ; do
    mv ${_file} ${_file/DockBarX/DockBarM}
  done
  for _file in $( find . -name "*DockBarX*" ) ; do
    mv ${_file} ${_file/DockBarX/DockBarM}
  done
  for _file in $( find . -name "*dbx*" ) ; do
    mv ${_file} ${_file/dbx/dbm}
  done
  for _file in $( find . -name "*namebar*" ) ; do
    mv ${_file} ${_file/namebar/namebarm}
  done
  fi
}

package() {
  cd ${srcdir}/${_pkgname}
  [[ "${_coinstall}" == '1' ]] && _suffix='m' || _suffix='x'

  python2 setup.py install --root ${pkgdir}

  mkdir -p ${pkgdir}/usr/share/pixmaps
  install -Dm644 ${srcdir}/${_pkgname}/icons/hicolor/128x128/apps/dockbar${_suffix}.png ${pkgdir}/usr/share/pixmaps/dockbar${_suffix}.png

  mkdir -p "${pkgdir}"/usr/share/glib-2.0/schemas/
  install -m 644 "${srcdir}/${_pkgname}"/org.dockbar.dockbar${_suffix}.gschema.xml "${pkgdir}"/usr/share/glib-2.0/schemas/

  sed -i 's:^Categories=.*:Categories=GTK;GNOME;Settings;X-GNOME-PersonalSettings;:' ${pkgdir}/usr/share/applications/db${_suffix}_preference.desktop
}

sha256sums=('SKIP')
