# Maintainer: Aren <rn+aur@peacevolution.org>
# Contributor: dni <office@dnilabs.com>

pkgname=('sxmo-utils-git' 'sxmo-utils-sway-git')
pkgver=1.14.1.r4.e8ddbc8
pkgrel=1
pkgdesc="Utility scripts, programs, and configs that hold the sxmo UI environment together"
url="https://git.sr.ht/~mil/sxmo-utils"
arch=('x86_64' 'aarch64')
license=('AGPL3')
makedepends=('libx11' 'xorgproto' 'linux-headers' 'busybox' 'scdoc' 'git')
source=("git+https://git.sr.ht/~mil/sxmo-utils"
        '00-sxmo.rules'
        '10-sxmo.conf'
        'sxmo-setpermissions.service'
        '0001-alias-superd-to-systemd-user.patch'
        '0002-Use-sh-to-resolve-hooks-in-services.patch'
        '0003-Use-KillMode-process-so-systemd-doesn-t-stop-apps.patch'
        '0004-Remove-services-that-systemd-automatically-starts-fr.patch'
        '0005-Separate-services-that-are-provided-by-external-pack.patch'
        '0006-Add-BindsTo-to-services-so-they-stop-when-the-graphi.patch'
        '0007-start-stop-graphical-session.target.patch')
sha512sums=('SKIP'
            '8a21e62b7ff0982a5406e98510a3004c62f883b9fae0cad5b63f6a7df520896b65c726321da515dab754a91ed94280922e3f424ecc983c1a33eb1ec287b268a2'
            'b69a09f98f8a5cad8164cd48c5f6a78f2ce0e9818fb77ccf2a3e243cd0f2023e438022b20aad9e6b5edd90e1bb862326db79dc423630682d4c43e897090d3da1'
            '532c3045f52f872704876bdf56afbc7470c5d17e46655dd4040d545b6d3eb34a8791909e554c560471f9494c7382107839bcff1e48be242d5eea0092482165cd'
            '5eeb6a2d1ab9c4811b5bf602f00e2cc075b86f6a301110730b81850865443696d7a99e19432a53048017295c1d13de46dd897bd646be168903f34ee80128be37'
            '0a872028c1f3b9853a9c1e0c6c659612e1ecb8f1e83b6c1e3ef22e120c04d4347af9ab6987110fa22576b6fce20dd26cf5734725094df46e97bb89764a96f54e'
            '222696d8872dac5a6e72efb72fa058c116b6cbfbb889b727ba4abdaed5c4c5cbe64d5ff71fd1a90c16a14f4c4f9455440652b7c7a046a1b02fc1a444c3f950fb'
            'd847b56a8a6a1f4e500f09ed1d7976a8ac7d24144e0c5265f5d72af46d211d32e676b69c33e3fd29ccbfb36080d521ea1719f41a8a06fd6a18318e01c5570ad5'
            'c7d9317313a9333e8cb52ef55b9d427146458ff0e592004f7e11a7c0d0457da92386886fd07add0c84de89099b03db19a525705c1d9395bf2575c0be65267587'
            'c74f51d2f6897ef0cb38f1ce7ac637352f9866f53bf491c2af86c80dbf73c4c80818dedd1d06cdb381ea73d115b875266a198f1a806ceda494ba735aade00215'
            'f8c5674aeea993387d32672014ec7cffc8616ecfa5027c6da5e737754ffdf4b8fd00d5a99a7f5a67683b21159236d3131b93ebd70b64ecc9aa0042898f3bd020')

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
  cd "sxmo-utils"

  make
}

package_sxmo-utils-git() {
  backup=('etc/doas.conf')
  depends=(
    # Shell utilities
    'bc'
    'curl'
    'gawk'
    'gojq'
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
    'alsa-utils'
    'bluez'
    'bluez-utils'
    'libpulse'
    'pulseaudio'
    'pulseaudio-alsa'

    # Core GUI dependencies
    'conky'
    'dunst'
    'libnotify'
    'light'
    'lisgd'
    'mpv'
    'sxmo-ui'
    'ttf-dejavu-nerd')
  optdepends=('bemenu-ncurses: sxmo menus over ssh'
              'bonsai: better multikey script'
              'clickclack: haptic feedback'
              'codemadness-frontends: Youtube & Reddit scripts'
              'iio-utils: proximitylock script'
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
    install-scripts

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

  install -Dm644 "$srcdir/sxmo-setpermissions.service" "$pkgdir/usr/lib/systemd/system/sxmo-setpermissions.service"
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
