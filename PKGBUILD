# Maintainer: Tim van Leuverden <tvanleuverden at gmail dot com>
# Contributor: Joost Bremmer
# Contributor: Mubashshir <ahmubashshir at gmail dot com>

pkgname=trackma
pkgver=0.8.5
pkgrel=1
pkgdesc="A lightweight and simple program for updating and using lists on several media tracking websites."
url="https://z411.github.io/trackma/"
arch=('any')
conflicts=('trackma-git')
license=('GPL3')
depends=('python')

makedepends=('git'
             'python-setuptools'
             'desktop-file-utils')
			 
optdepends=('python-gobject:   GTK frontend'
            'python-cairo:     GTK frontend'
            'python-pyqt5:     Qt frontend'
            'python-urwid:     ncurses frontend'
            'python-pillow:    thumbnail images for GUI frontends'
			'python-pyinotify: instant media recognition tracker'
			'python-pydbus:    MPRIS media recognition tracker'
            'lsof:             polling tracker/pyinotify alternative')

source=("${pkgname}-${pkgver}::git+https://github.com/z411/${pkgname}.git#tag=v${pkgver}"
        "anime-relations::git+https://github.com/erengy/anime-relations.git"
        "${pkgname}-curses.desktop"
        "${pkgname}-gtk.desktop"
        "${pkgname}-qt.desktop")

sha256sums=('SKIP'
            'SKIP'
            '80be9ffc3eb66456004a438a3da8950ed8382faa00a3fe61c5ef3980090c4dce'
            'a737f0fd38af4c472dfbca8503f57763bbec7c91568221298db317421a6c5604'
            '988f4c4422577f0657e9ff8a9695ef44796ee6a9c43e07ee7a81369f25c2761f')

prepare() {
  cd ${pkgname}-${pkgver}

  git submodule init
  git config submodule."trackma/data/anime-relations".url $srcdir/anime-relations
  git submodule update
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1

  install -Dvm644 "${pkgname}/data/icon.png" \
  "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -Dvm644 "${srcdir}/trackma-curses.desktop" \
  "${pkgdir}/usr/share/applications/${pkgname}-curses.desktop"

  install -vm644  "${srcdir}/trackma-gtk.desktop" \
  "${pkgdir}/usr/share/applications/${pkgname}-gtk.desktop"

  install -vm644  "${srcdir}/trackma-qt.desktop" \
  "${pkgdir}/usr/share/applications/${pkgname}-qt.desktop"
}

# vim: sw=2 ts=2 tw=80 et:
