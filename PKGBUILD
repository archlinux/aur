# Maintainer: Aren <rn+aur@peacevolution.org>
# Contributor: dni <office@dnilabs.com>

pkgname=('sxmo-utils-git' 'sxmo-utils-sway-git')
pkgver=1.17.1.r135.3ce3bf0
pkgrel=1
pkgdesc="Utility scripts, programs, and configs that hold the sxmo UI environment together"
url="https://git.sr.ht/~mil/sxmo-utils"
arch=('x86_64' 'armv7h' 'aarch64')
license=('AGPL-3.0-only')
makedepends=('libx11' 'xorgproto' 'linux-headers' 'busybox' 'scdoc' 'git')
source=("git+https://git.sr.ht/~mil/sxmo-utils"
        '00-sxmo.rules'
        '10-sxmo.conf')
sha512sums=('SKIP'
            '8a21e62b7ff0982a5406e98510a3004c62f883b9fae0cad5b63f6a7df520896b65c726321da515dab754a91ed94280922e3f424ecc983c1a33eb1ec287b268a2'
            'b69a09f98f8a5cad8164cd48c5f6a78f2ce0e9818fb77ccf2a3e243cd0f2023e438022b20aad9e6b5edd90e1bb862326db79dc423630682d4c43e897090d3da1')

pkgver() {
  cd "sxmo-utils"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  make -C "sxmo-utils"
}

package_sxmo-utils-git() {
  backup=('etc/doas.conf')
  depends=(
    'glibc' 'sh'

    # Shell utilities
    'bc'
    'curl'
    'gawk'
    'jq'
    'less'
    'net-tools' # netstat command
    'pnc'

    # Core dependcies
    'callaudiod'
    'opendoas'
    'geoclue'
    'inotify-tools'
    'mmsd-tng'
    'mnc' # for suspend
    'modemmanager'
    'ncurses' # for the weather script
    'networkmanager'
    'superd'
    'vvmd'
    'xdg-user-dirs'

    # Audio
    # TODO: alsa-utils is only required for sxmo_record.sh, it can probably be
    # removed soon
    'alsa-utils'
    'bluez'
    'bluez-utils'
    'libpulse'
    'pulse-native-provider'

    # Core GUI dependencies
    'conky'
    'dunst'
    'libnotify'
    'light'
    'lisgd'
    'mpv'
    'ttf-dejavu-nerd'
    'upower')
  optdepends=('bemenu-ncurses: sxmo menus over ssh'
              'bonsai: better multikey script'
              'clickclack: haptic feedback'
              'codemadness-frontends: Youtube script'
              'iio-sensor-proxy: proximitylock & autorotate scripts'
              'j4-dmenu-desktop: all apps menu generated from .desktop files'
              'mediainfo: sound recorder'
              'pipewire-pulse: recommended sound server'
              'sfeed: Rss and atom feeds'
              'vim: The default editor'
              'yt-dlp: Play videos from the web')
  provides=('sxmo-utils')
  conflicts=('sxmo-utils')

  make -C "sxmo-utils" \
    OPENRC=0 \
    DESTDIR="$pkgdir" \
    EXTERNAL_SERVICES=0 \
    install-scripts install-docs

  # Allow access to ModemManager and NetworkManager
  install -Dm644 -t "$pkgdir/usr/share/polkit-1/rules.d" "00-sxmo.rules"

  # Prevent logind from handling the power button
  install -Dm644 -t "$pkgdir/etc/systemd/logind.conf.d" "10-sxmo.conf"

  # Fixup mode to match polkit
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"

  # fix directory permissions, TODO this should be done upstream
  chmod 750 "$pkgdir/etc/doas.d"

  # HACK: doas is built without --with-doas-confdir so install the sxmo config directly
  install -Dm640 "$pkgdir/etc/doas.d/50-sxmo.conf" "$pkgdir/etc/doas.conf"
}

package_sxmo-utils-sway-git() {
  pkgdesc="Use sway as the window manager with sxmo"
  url="https://sr.ht/~mil/sxmo/"
  arch=('any')
  provides=('sxmo-utils-sway')
  conflicts=('sxmo-utils-sway')
  depends=('bemenu-wayland'
           'foot'
           'grim'
           'imv'
           'dunst'
           'slurp'
           'sway'
           'swaybg'
           'swayidle'
           'sxmo-utils-git'
           'wl-clipboard'
           'wob'
           'wtype'
           'wvkbd'
           'xorg-xwayland')

  make -C "sxmo-utils" DESTDIR="$pkgdir" install-sway
}
