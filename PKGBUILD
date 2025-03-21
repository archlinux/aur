# Maintainer: storbake
# Contributor: envolution
# Contributor: Matt R <dev at rhoatech.com>
# Contributor: Christian Hesse <mail at eworm.de>
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail.com> ([community] package)

pkgname=remmina-git
_pkgbase=remmina
pkgver=1.4.39+r10075+g96819db53
pkgrel=1
pkgdesc='A remote desktop client written in GTK+ - git checkout'
arch=(x86_64)
url='http://www.remmina.org/'
license=('GPL-2.0-or-later')
depends=('avahi' 'bash' 'cairo' 'curl' 'gcc-libs' 'glib2' 'glibc' 'gtk3'
         'hicolor-icon-theme' 'json-glib' 'libayatana-appindicator' 'libgcrypt'
	 'libsodium' 'libssh' 'libx11' 'openssl' 'pango' 'python' 'vte3')
makedepends=('git' 'cmake' 'freerdp' 'gobject-introspection' 'gtk-vnc' 'harfbuzz'
             'kwallet5' 'libvncserver' 'ninja' 'spice-gtk' 'spice-protocol'
             'webkit2gtk-4.1' 'xorgproto')
optdepends=('freerdp: RDP plugin'
            'libsecret: Secret plugin'
            'libvncserver: VNC plugin'
            'spice-gtk: Spice plugin'
            #'pyhoca-cli: X2Go plugin'
            'webkit2gtk-4.1: WWW plugin'
            'gtk-vnc: GVNC plugin'
            'kwallet5: kwallet plugin'
            'gnome-terminal: external tools')
replaces=('remmina-plugins')
provides=('remmina-plugins')
conflicts=('remmina')
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
  cmake -S "${_pkgbase}" -B build -G Ninja \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_INSTALL_LIBDIR='/usr/lib' \
		-DWITH_APPINDICATOR='ON' \
		-DWITH_FREERDP3='ON' \
		-DWITH_NEWS='OFF' \
		-DWITH_KF5WALLET='ON' \
		-DWITH_X2GO='ON' \
		-DWITH_GVNC='ON' \
		-Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
