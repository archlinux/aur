# Contributor: Spyros Stathopoulos <foucault.online@gmail.com>
pkgname=pkgupdate-git
_gitname=pkgupdate
pkgver=117.d87c556
pkgrel=1
pkgdesc="Simple monitor server for pacman and AUR updates"
arch=('i686' 'x86_64')
url="https://github.com/foucault/pkgupdate"
license=('GPL3')
depends=('python' 'cron')
conflicts=('pkgupdate')
backup=('etc/pkgupdate.conf')
optdepends=('pygtk: for the gtk+ client'
            'gtk3: for the gtk+ 3 client'
            'python-gobject: for the gtk+ 3 client'
            'gnome-icon-theme: for the gtk+ clients')
makedepends=('git' 'python-docutils')
source=("${_gitname}::git://github.com/foucault/pkgupdate.git")
md5sums=('SKIP')
install='pkgupdate.install'

pkgver() {
  cd "${srcdir}"/"${_gitname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/${_gitname}"
  python setup.py build
}

package() {
  cd "${srcdir}/$_gitname"
  python setup.py install --prefix=/usr --root="${pkgdir}"
  # gtk client is a python2 script
  if [ `grep '#!/usr/bin/python$' "${pkgdir}/usr/bin/pkgupdate_gtk.py"` ]; then
    sed -i -e "s|/usr/bin/python|/usr/bin/python2|" "${pkgdir}/usr/bin/pkgupdate_gtk.py"
  fi
  install -D -m755 "${srcdir}/$_gitname/sync_sandbox.sh" \
    "${pkgdir}/etc/cron.hourly/sync_sandbox"
  chmod 600 "${pkgdir}/etc/pkgupdate.conf"
  install -D -m644 "${srcdir}/$_gitname/pkgupdate.service" \
    "${pkgdir}/usr/lib/systemd/system/pkgupdate.service"
}
# vim:ts=2:sw=2:et
