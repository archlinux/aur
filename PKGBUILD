# Contributor: noonov <noonov@gmail.com>
# Contributor: wtchappell <wtchappell@gmail.com>

_pkgname=awesome
pkgname=awesome-luajit-git
pkgver=20150110
pkgrel=1
pkgdesc="awesome window manager build with luajit"
arch=('i686' 'x86_64')
url="http://awesome.naquadah.org/"
license=('GPL2')
depends=(
  'startup-notification' 'libxdg-basedir' 'dbus' 'luajit'
  'cairo>=1.12.2' 'pango' 'gdk-pixbuf2' 'luajit-lgi'
  'xcb-util'{,-keysyms,-wm}'>=0.3.8' 'xorg-xmessage' 'xcb-util-cursor')
makedepends=('git' 'asciidoc' 'cmake' 'docbook-xsl' 'doxygen' 'imagemagick' 'ldoc' 'xmlto')
optdepends=(
  'rlwrap: readline support for awesome-client'
  'dex: autostart your desktop files'
  'vicious-git: widgets for the Awesome window manager')
provides=('awesome' 'notification-daemon')
backup=('etc/xdg/awesome/rc.lua')
conflicts=('awesome' 'awesome-git' 'awesome34' 'awesome34-luajit')
source=("git+https://github.com/awesomeWM/awesome.git#tag=v3.5.6"
        0001-add-luajit.patch
        awesome.desktop
        awesomeksm.desktop)
install=awesome-luajit.install

pkgver() {
  cd ${srcdir}/${_pkgname}
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
  cd ${srcdir}/${_pkgname}
  export AWESOME_IGNORE_LGI=1
  git apply ${srcdir}/0001-add-luajit.patch
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSCONFDIR=/etc \
    -DLUA_LIBRARIES=/usr/lib/libluajit-5.1.so
  make
}

package() {
  cd ${srcdir}/${_pkgname}

  make DESTDIR=${pkgdir} install

  install -Dm644 ${srcdir}/awesome.desktop \
    ${pkgdir}/usr/share/xsessions/awesome.desktop

  install -Dm644 "$srcdir/awesomeksm.desktop" \
    "$pkgdir/usr/share/apps/ksmserver/windowmanagers/awesome.desktop"
}
md5sums=('SKIP'
         '3aba8866a53f055749aebbd5e32bb43e'
         '2763cab6a20d4b0f2676329d57ed3a45'
         '2c3a0d91b7e12aa20a6bafc403a83cff')
sha1sums=('SKIP'
          '0d419f4ec61226dbda0dd8026877cf0c7c8ad1fb'
          '27c318614e7e52be723de8a1cdec3297c8356a59'
          '8a1634e908a276c755ee6962b36b40acd37cf8a2')
sha256sums=('SKIP'
            '89e8115e22ec4df84681633d87a4b06f1d2705863a4e8e6231de3781d34ec30a'
            '5c5437448cc9f01be6ccbb298f5c86d0f8c4bcae23a22e6af699aff0d10f642f'
            '8f25957ef5453f825e05a63a74e24843aad945af86ddffcc0a84084ca2cf9928')
