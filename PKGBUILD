# Maintainer: Aren <rn+aur@peacevolution.org>
# Contributor: dni <office@dnilabs.com>

pkgname=('sxmo-utils-git' 'sxmo-utils-sway-git')
pkgver=1.15.2.r50.0b58e5e
pkgrel=2
pkgdesc="Utility scripts, programs, and configs that hold the sxmo UI environment together"
url="https://git.sr.ht/~mil/sxmo-utils"
arch=('x86_64' 'aarch64')
license=('AGPL3')
makedepends=('libx11' 'xorgproto' 'linux-headers' 'busybox' 'scdoc' 'git')
source=("git+https://git.sr.ht/~mil/sxmo-utils"
        '0001-Use-sh-to-resolve-hooks-in-services.patch'
        '0002-Use-KillMode-process-so-systemd-doesn-t-stop-apps.patch'
        '0003-Add-PartOf-to-services-so-they-stop-when-the-graphic.patch'
        '0004-Fix-quoting-of-strings-in-service-files.patch'
        '0005-Add-hook-to-manage-services.patch'
        '0006-start-stop-graphical-session.target.patch'
        '00-sxmo.rules'
        '10-sxmo.conf')
sha512sums=('SKIP'
            'b85d430141601aba9c0c1b2c782abc2b259b4dbc4b099bd2ddd57403c8b75da7e3e3e8d2ff4c95a783f8cb5ba709fe856b8e52ce3cb5ccc70b3c08c9cec0e625'
            '708e6c073ec9503fd10d14f6f090a694777e77ad92f38885416d368d482e61f2e3aba18d220100f7dd03c3fe80a799b8d3ff59bbac6b58ecbab48c31886cda72'
            '4eb8b89021a910b295bbf7c032e03fd017ce82ccb2e5d101e085de0fe03b58b7e30c0602904155d48a3520c07590826a79f77fa0092a53eae43744e599247014'
            '015e9d8fc54d5e16a403bb5a64fe473f2c5fdd846d927e7e4487c11541f02a022a51d0de7ed25b5e0934374f7a29c05d452cb8651bcbf1c9be5287924495b7e1'
            '2ee19773bc515621699b424d609ef3a29ba8a7bf444b51d8259cd71f69d39d1dd9960aa1d0e0effd4ff5c226ce7812991806c1fe1ab56a951ec7759902fbd687'
            '7ecc3a7da7bdd98f173202fda300d2b5f0e353d725c4c74d491b0ff713bb5779dd4a5642e37f457d4272fa4013ba060cff34e2b7a9f44c784c7788cfb6c0664a'
            '8a21e62b7ff0982a5406e98510a3004c62f883b9fae0cad5b63f6a7df520896b65c726321da515dab754a91ed94280922e3f424ecc983c1a33eb1ec287b268a2'
            'b69a09f98f8a5cad8164cd48c5f6a78f2ce0e9818fb77ccf2a3e243cd0f2023e438022b20aad9e6b5edd90e1bb862326db79dc423630682d4c43e897090d3da1')

pkgver() {
  cd "sxmo-utils"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "sxmo-utils"

  for patch in ../*.patch; do
    echo "applying: $patch"
    patch -p1 < "$patch"
  done
}

build() {
  make -C "sxmo-utils"
}

package_sxmo-utils-git() {
  backup=('etc/doas.conf')
  depends=(
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
    'brightnessctl'
    'conky'
    'dunst'
    'libnotify'
    'lisgd'
    'mpv'
    'ttf-dejavu-nerd'
    'upower')
  optdepends=('bemenu-ncurses: sxmo menus over ssh'
              'bonsai: better multikey script'
              'clickclack: haptic feedback'
              'codemadness-frontends: Youtube & Reddit scripts'
              'iio-utils: proximitylock script'
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
    SERVICEDIR=/usr/lib/systemd/user \
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
  install -Dm640 "$pkgdir/etc/doas.d/sxmo.conf" "$pkgdir/etc/doas.conf"
}

package_sxmo-utils-sway-git() {
  pkgdesc="Use sway as the window manager with sxmo"
  url="https://sr.ht/~mil/Sxmo/"
  arch=('any')
  provides=('sxmo-utils-sway')
  conflicts=('sxmo-utils-sway')
  depends=('bemenu-wayland'
           'foot'
           'grim'
           'imv'
           'mako'
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
  optdepends=('sway-git: better touch event handling')

  make -C "sxmo-utils" DESTDIR="$pkgdir" install-sway
}
