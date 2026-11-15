# Maintainer: storbake
# Contributor: envolution
# Contributor: Matt R <dev at rhoatech.com>
# Contributor: Christian Hesse <mail at eworm.de>
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail.com> ([community] package)

pkgname=remmina-git
_pkgbase=remmina
pkgver=1.4.44+r10619+ge2220109c
pkgrel=1
pkgdesc='A remote desktop client written in GTK+ - git checkout'
arch=(x86_64)
url='https://www.remmina.org/'
license=('GPL-2.0-or-later')
depends=('avahi' 'avahi-gtk' 'bash' 'cairo' 'curl' 'glib2' 'glibc' 'gtk3'
         'hicolor-icon-theme' 'json-glib' 'libappindicator' 'libgcc'
         'libgcrypt' 'libsodium' 'libssh' 'libx11' 'openssl' 'pango' 'python' 'vte3'
         'wayland')
makedepends=('git' 'cmake' 'freerdp' 'gobject-introspection' 'gtk-vnc' 'harfbuzz'
             'kwallet5' 'libsecret' 'libsoup3' 'libvncserver' 'ninja'
             'plasma-wayland-protocols' 'spice-gtk' 'spice-protocol'
             'webkit2gtk-4.1' 'xorgproto')
# AAD support links WebKitGTK and libsoup into the RDP plugin for all connections.
optdepends=('freerdp: RDP plugin (also requires webkit2gtk-4.1)'
            'libsecret: Secret plugin'
            'libsoup3: RDP plugin'
            'libvncserver: VNC plugin'
            'spice-gtk: Spice plugin'
            'pyhoca-cli: X2Go plugin'
            'webkit2gtk-4.1: RDP (including AAD authentication) and WWW plugins'
            'gtk-vnc: GVNC plugin'
            'kwallet5: kwallet plugin'
            'gnome-terminal: external tools')
replaces=('remmina-plugins')
provides=('remmina-plugins')
conflicts=('remmina')
source=('git+https://gitlab.com/remmina/remmina.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgbase}" || return
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
    -DCMAKE_EXPORT_COMPILE_COMMANDS='ON' \
    -DHAVE_LIBAPPINDICATOR='ON' \
    -DWITH_FREERDP3='ON' \
    -DWITH_RDP_AUTH_AAD='ON' \
    -DENABLE_KDE_OUTPUT_ORDER_V1='ON' \
    -DWITH_NEWS='OFF' \
    -DWITH_KF5WALLET='ON' \
    -DWITH_X2GO='ON' \
    -DWITH_GVNC='ON' \
    -Wno-dev

  # Upstream can skip these features even when explicitly enabled.
  if ! grep -q -- '-DWITH_RDP_AUTH_AAD' build/compile_commands.json; then
    printf '%s\n' 'RDP AAD support was not enabled; FreeRDP must be built with WITH_AAD=ON.' >&2
    return 1
  fi
  if ! grep -q '^#define HAVE_KDE_OUTPUT_ORDER_V1' build/config.h; then
    printf '%s\n' 'Plasma monitor ordering was not enabled; check plasma-wayland-protocols and wayland-scanner.' >&2
    return 1
  fi

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

