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
_coinstall=0

_pkgname=dockbarx
pkgname="${_pkgname}"-gtk3-git
_branchname='pygi-migration'
epoch=1
pkgver=0.92+33+gfd33e48
pkgrel=1
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
provides=("${_pkgname}=${pkgver%%+*}")
#source=("${_pkgname}"::git+https://github.com/M7S/dockbarx.git#branch=${_branchname})
source=("${_pkgname}"::git+https://github.com/amper128/dockbarx.git#branch=${_branchname}
        '34fe342585e7b3f87ffe04a98079826ff6b7f32a.patch')

_commits=('1aa7665c0bebfd5a5f9cf4ec5bc6980ad67e83c4'
          '84dcc2825d44557571138cb16f9533b339b91370'
          '1d270a7a29847b69082800aa82f7779a0c675909')
for _commit in "${_commits[@]}" ; do 
	source+=("https://github.com/M7S/dockbarx/commit/${_commit}.patch")
	sha256sums+=('SKIP')
done

sha256sums=('SKIP'
            '7b81316a73b68fd5c38351f1501569c166aed300d41fb62898f5adfb25a9f161'
            '1b1f527436b85ba460a0c95cd1bbfceb3ce16a8ab82c215c2f18456e4fe874bc'
            '6eba00088c1094aee041b26407d5c8e9f19da2eaee491cc9aff92a11285efba2'
            'c3100ef3c9c6592c11e687837eaca3242fdd4b3074aedd8414961f6fad658f5f')

[ "${_coinstall}" == '1' ] || conflicts+=("${_pkgname}" "${_pkgname}-git")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s/-/+/g"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  for _commit in "${_commits[@]}" ; do
    echo ">> ${_commit}"
    patch -Np1 -i ../"${_commit}".patch
  done
  patch -uNp2 -r- -i ../34fe342585e7b3f87ffe04a98079826ff6b7f32a.patch
  if [[ "${_coinstall}" == '1' ]] ; then
    find . -type f -exec sed -i -e 's:dockbarx:dockbarm:g;s:Dockbarx:Dockbarm:g' \
                                -e 's:DockbarX:DockbarM:g;s:DockBarx:DockBarm:g;s:DockBarX:DockBarM:g' \
                                -e 's:dockx:dockm:g;s:DockX:DockM:g' \
                                -e 's:dbx:dbm:g;s:Dbx:Dbm:g;s:DBX:DBM:g' \
                                -e 's:namebar:namebarm:g;s:Namebar:Namebarm:g;s:NameBar:NameBarm:g' '{}' \;
    mv dock{x,m}
    mv dock{x,m}_applets
    mv Dock{X,M}.desktop
    for _file in $( find . -name "*dockbarx*" ) ; do
      mv "${_file}" "${_file/dockbarx/dockbarm}"
    done
    for _file in $( find . -name "*DockbarX*" ) ; do
      mv "${_file}" "${_file/DockbarX/DockbarM}"
    done
    for _file in $( find . -maxdepth 2 -name "*DockBarX*" ) ; do
      mv "${_file}" "${_file/DockBarX/DockBarM}"
    done
    for _file in $( find . -name "*DockBarX*" ) ; do
      mv "${_file}" "${_file/DockBarX/DockBarM}"
    done
    for _file in $( find . -name "*dbx*" ) ; do
      mv "${_file}" "${_file/dbx/dbm}"
    done
    for _file in $( find . -name "*namebar*" ) ; do
      mv "${_file}" "${_file/namebar/namebarm}"
    done
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"
  [[ "${_coinstall}" == '1' ]] && _suffix='m' || _suffix='x'

  python2 setup.py install --root "${pkgdir}"

  mkdir -p "${pkgdir}"/usr/share/pixmaps
  install -Dm644 "${srcdir}/${_pkgname}"/icons/hicolor/128x128/apps/dockbar"${_suffix}".png "${pkgdir}"/usr/share/pixmaps/dockbar"${_suffix}".png

  mkdir -p "${pkgdir}"/usr/share/glib-2.0/schemas/
  install -m 644 "${srcdir}/${_pkgname}"/org.dockbar.dockbar"${_suffix}".gschema.xml "${pkgdir}"/usr/share/glib-2.0/schemas/

  sed -i 's:^Categories=.*:Categories=Settings:' "${pkgdir}"/usr/share/applications/db"${_suffix}"_preference.desktop
}
