# Maintainer: envolution
# Contributor: Matt R <dev at rhoatech.com>
# Contributor: Christian Hesse <mail at eworm.de>
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail.com> ([community] package)

pkgname=remmina-git
_pkgbase=remmina
pkgver=1.4.37+r10026+gba55b1a3c
pkgrel=1
pkgdesc='A remote desktop client written in GTK+ - git checkout'
arch=(i686 x86_64)
url='http://www.remmina.org/'
license=('GPL-2.0-or-later')
depends=('zlib' 'libjpeg' 'libssh' 'avahi' 'vte3'
  'libgcrypt' 'libxdmcp' 'libvncserver' 'glib2-docs'
  'libsecret' 'webkit2gtk-4.1' 'libsodium')
makedepends=('git' 'intltool' 'pkgconfig' 'cmake' 'avahi'
  'libxkbfile' 'freerdp' 'gobject-introspection'
  'spice' 'spice-gtk' 'spice-protocol' 'kwallet5' 'gtk-vnc'
  'docbook-xsl' 'libpulse' 'libappindicator-gtk3')
optdepends=('avahi' 'libxkbfile' 'gobject-introspection' 'spice' 'spice-gtk' 'spice-protocol' 'pyhoca-cli')
provides=('remmina' 'grdc' "grdc=${pkgver}" 'remmina-plugins')
conflicts=('remmina' 'grdc')
install=remmina.install
source=('git+https://gitlab.com/remmina/remmina.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  _version=$(git tag --sort=-v:refname --list | grep '^v[0-9.]*$' | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

build() {
  cd $_pkgbase
  mkdir build
  cmake -B build -S ./ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWITH_FREERDP3=ON \
    -DWITH_CUPS=ON \
    -DWITH_LIBSSH=ON \
    -DWITH_NEWS=ON \
    -DWITH_KF5WALLET=ON \
    -DWITH_PYTHONLIBS=ON \
    -DWITH_GVNC=ON \
    -DWITH_X2GO=ON

}

package() {
  cd "$_pkgbase/build"
  DESTDIR="${pkgdir}" make install
}
