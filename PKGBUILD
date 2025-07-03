# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-daemon-git
_pkgname=deepin-daemon
pkgver=6.1.41.r3.g93fcceb0f
pkgrel=1
pkgdesc='Daemon handling the DDE session settings'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-daemon"
license=('GPL3')
# deepin-session-shell not added for org.deepin.dde.LockFront1, because bring in
#                      deepin-session for non-DDE users is not desirable
depends=('deepin-desktop-schemas' 'deepin-api' 'deepin-app-services' 'deepin-wloutput-daemon'
         # TODO
         'gtk3' 'libx11' 'gdk-pixbuf-xlib' 'gdk-pixbuf2' 'libxi' 'libpulse' 'glib2' 'libxcursor'
         'libxcrypt' 'libgudev' 'pam' 'iso-codes'
         # accounts
         'accountsservice'
         # accounts/grub
         'deepin-polkit-agent' 'deepin-polkit-agent-ext-gnomekeyring'
         # accounts/keybinding/systeminfo
         'deepin-desktop-base'
         # appearance
         'fontconfig' 'noto-fonts'
         # audio/session
         'pulse-native-provider' 'alsa-lib'
         # bin/backlight_helper
         'ddcutil'
         # clipboard
         'libxfixes'
         # dock
         'bamf'
         # gesture
         'deepin-widgets'
         # image_effect
         'deepin-session-ui' 'sudo'
         # inputdevices
         'imwheel' 'libxkbfile' 'procps-ng' 'psmisc'
         # iw
         'libnl'
         # keybinding
         'gvfs'
         # keybinding/default-terminal
         'deepin-application-manager'
         # misc
         'librsvg'
         # network
         'mobile-broadband-provider-info' 'org.freedesktop.secrets' 'xdg-utils'
         # network/system
         'systemd' 'systemd-libs'
         # system
         'dmidecode' 'libinput' 'lshw' 'upower'
         # systeminfo
         'lsb-release' 'udisks2' 'util-linux')
makedepends=('sqlite' 'deepin-gettext-tools' 'git' 'mercurial' 'python-gobject' 'networkmanager'
             'bluez' 'go')
optdepends=('networkmanager: for network management support'
            'bluez: for bluetooth support'
            'iw: for miracast module'
            'proxychains-ng: for proxy configuration module')
conflicts=($_pkgname)
provides=($_pkgname)
groups=('deepin-git')
install="$pkgname.install"
source=("$pkgname::git+https://github.com/linuxdeepin/dde-daemon")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  rm -rf system/uadp
  rm -rf session/uadpagent

  # https://github.com/linuxdeepin/developer-center/discussions/3327
  # sed -i 's#/usr/libexec#/usr/lib#' keybinding/shortcuts/system_shortcut.go
  sed -i 's#${PREFIX}/libexec/#${PREFIX}/lib/#;s#${DESTDIR}/lib#${DESTDIR}${PREFIX}/lib#' Makefile
}

build() {
  cd $pkgname

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  # make -C network/nm_generator gen-nm-code
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PAM_MODULE_DIR=usr/lib/security install
}

