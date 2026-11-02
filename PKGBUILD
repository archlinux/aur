# Maintainer: liangshengfeng <liangshengfeng@star-net.cn>
#
# Same as remmina-git, plus a local patch:
#   * announce CF_DIB when the local clipboard holds an image, so Windows
#     applications can paste screenshots that are only available as PNG;
#   * emit a plain 24-bit BITMAPINFOHEADER DIB (some applications reject
#     the 32-bit BITMAPV4HEADER produced for pixbufs with an alpha channel).
# Drop this patch once equivalent support lands upstream.

pkgname=remmina-cf-dib-git
_pkgbase=remmina
pkgver=1.4.43+r10592+gf7ebb11bc
pkgrel=1
epoch=1
pkgdesc='A remote desktop client written in GTK+ - git checkout with CF_DIB image clipboard fix'
arch=(x86_64)
url='https://www.remmina.org/'
license=('GPL-2.0-or-later')
depends=('avahi' 'avahi-gtk' 'bash' 'cairo' 'curl' 'glib2' 'glibc' 'gtk3'
         'hicolor-icon-theme' 'json-glib' 'libayatana-appindicator' 'libgcc'
         'libgcrypt' 'libsodium' 'libssh' 'libx11' 'openssl' 'pango' 'python' 'vte3')
makedepends=('git' 'cmake' 'freerdp' 'gobject-introspection' 'gtk-vnc' 'harfbuzz'
             'kwallet5' 'libvncserver' 'ninja' 'spice-gtk' 'spice-protocol'
             'webkit2gtk-4.1' 'xorgproto')
optdepends=('freerdp: RDP plugin'
            'libsecret: Secret plugin'
            'libvncserver: VNC plugin'
            'spice-gtk: Spice plugin'
            'webkit2gtk-4.1: WWW plugin'
            'gtk-vnc: GVNC plugin'
            'kwallet5: kwallet plugin'
            'gnome-terminal: external tools')
provides=('remmina' 'remmina-plugins')
conflicts=('remmina' 'remmina-git')
install=remmina-cf-dib-git.install
source=('git+https://gitlab.com/remmina/remmina.git'
        'remmina-cf-dib.patch')
sha256sums=('SKIP'
            'bec56f4d27f5cb039b34766665b28f70e6a1d128829887fab2a76f4d104c61d2')

pkgver() {
  cd "${_pkgbase}"
  _version=$(git tag --sort=-v:refname --list | grep '^v[0-9.]*$' | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

prepare() {
  cd "${_pkgbase}"
  patch -Np1 -i "${srcdir}/remmina-cf-dib.patch"
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
