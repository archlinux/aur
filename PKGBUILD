# Maintainer: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>
# Contributor: Carlos Mogas da Silva <r3pek@r3pek.org>
# Contributor: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname='budgie-screenshot-applet'
pkgver='0.4.3'
pkgrel='4'
pkgdesc='A Budgie applet for taking and uploading screenshots to Imgur and Imagebin.'
arch=('i686' 'x86_64')
url="https://github.com/cybre/${pkgname}"
license=('GPL2')
depends=('libpeas' 'budgie-desktop' 'json-glib' 'gnome-desktop')
makedepends=('intltool' 'meson' 'ninja' 'vala' 'gobject-introspection')
source=("git+${url}.git#tag=v${pkgver}"
        '01-fix-gtk-3.24-compilation.patch'
        '02-Fixes-compilation-errors-with-Vala-0.44.patch')
sha256sums=('SKIP'
            '328a13065e28d8d5a8ae623ebb0e5fb3341df5aa082d5d3dfc0630d9abda5704'
            '8c92ea4fb70a76c08337c5aa414669db9a043a197227c7ad6a4c2fda735d8871')
changelog='CHANGELOG'

pkgver () {
  cd ${pkgname}

  git describe --tags | sed 's/v//; s/-/.r/; s/-/./'
}

prepare () {
  cd ${pkgname}

  patch -p1 < "${srcdir}/${source[1]}"
  patch -p1 < "${srcdir}/${source[2]}"
}

build () {
  arch-meson ${pkgname} build
  ninja -C build
}

package () {
  DESTDIR="${pkgdir}" ninja -C build install
}
