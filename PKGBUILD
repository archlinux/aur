# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=dockbarx
pkgname="${_pkgname}"-gtk3-git
_branchname='pygi-python3'
epoch=1
pkgver=0.93+43+gc3b2e9d
pkgrel=1
pkgdesc="DockBarX GTK3 port. (Standalone panel and mate applet)"
arch=('i688' 'x86_64')
url="https://github.com/M7S/dockbarx"
license=('GPL3')
depends=('libkeybinder3' 'python-cairo' 'python-dbus' 'python-gobject' 'python-pillow'
         'python-xlib' 'python-xdg')
makedepends=('python-polib' 'python-setuptools')
optdepends=('mate-panel: mate applet'
            'zeitgeist: recently used file list'
            'xfce4-dockbarx-plugin-gtk3-git: xfce4 plugin')
makedepends=('git')
provides+=("${_pkgname}=${pkgver%%+*}")
source=("${_pkgname}"::git+https://github.com/M7S/dockbarx.git#branch=${_branchname})
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s/-gtk3//;s/-/+/g"
}

package() {
  cd "${srcdir}/${_pkgname}"

  python setup.py install --root "${pkgdir}" --optimize=1

  mkdir -p "${pkgdir}"/usr/share/pixmaps
  install -Dm644 "${srcdir}/${_pkgname}"/icons/hicolor/128x128/apps/dockbarx.png "${pkgdir}"/usr/share/pixmaps/dockbarx.png

  mkdir -p "${pkgdir}"/usr/share/glib-2.0/schemas/
  install -m 644 "${srcdir}/${_pkgname}"/org.dockbar.dockbarx.gschema.xml "${pkgdir}"/usr/share/glib-2.0/schemas/

  sed -i 's:^Categories=.*:Categories=Settings:' "${pkgdir}"/usr/share/applications/dbx_preference.desktop
}
