# Maintainer: Tim van Leuverden <tvanleuverden at gmail dot com>
# Contributor: Joost Bremmer
# Contributor: Mubashshir <ahmubashshir at gmail dot com>
# Contributor: Evgeniy <evgfilim1 at gmail dot com>

pkgname=trackma
pkgver=0.9
pkgrel=1
pkgdesc="A lightweight and simple program for updating and using lists on several media tracking websites."
url="https://z411.github.io/trackma/"
arch=('any')
conflicts=('trackma-git')
license=('GPL3')
depends=('python')

makedepends=('git'
             'python-build'
             'python-installer'
             'python-poetry-core'
             'python-wheel'
             'desktop-file-utils')
			 
optdepends=('python-gobject:     GTK frontend'
            'python-cairo:       GTK frontend'
            'python-pyqt5:       Qt frontend'
            'python-urwid:       ncurses frontend'
            'python-pillow:      thumbnail images for GUI frontends (required for Qt)'
            'python-pyinotify:   instant media recognition tracker'
            'python-pydbus:      MPRIS media recognition tracker'
            'python-anitopy-git: anitopy title parser'
            'lsof:               polling tracker/pyinotify alternative')

source=("${pkgname}-${pkgver}::git+https://github.com/z411/${pkgname}.git#tag=v${pkgver}"
        "anime-relations::git+https://github.com/erengy/anime-relations.git"
        "${pkgname}-curses.desktop"
        "${pkgname}-gtk.desktop"
        "${pkgname}-qt.desktop")

sha256sums=('4671f7534c09c7f4d7f5ab94184b12541447be861904b82804b8cc6d61427e47'
            'SKIP'
            '80be9ffc3eb66456004a438a3da8950ed8382faa00a3fe61c5ef3980090c4dce'
            'a737f0fd38af4c472dfbca8503f57763bbec7c91568221298db317421a6c5604'
            '988f4c4422577f0657e9ff8a9695ef44796ee6a9c43e07ee7a81369f25c2761f')

prepare() {
  cd ${pkgname}-${pkgver}

  git submodule init
  git config submodule."trackma/data/anime-relations".url $srcdir/anime-relations
  git -c protocol.file.allow=always submodule update
}

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl

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
