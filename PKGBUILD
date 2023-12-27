# Maintainer: Aren <rn+aur@peacevolution.org>
# Contributor: dni <office@dnilabs.com>

pkgname=('sxmo-utils-git' 'sxmo-utils-sway-git')
pkgver=1.15.1.r20.6a024f2
pkgrel=1
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
        '10-sxmo.conf'
        'sxmo-setpermissions.service')
sha512sums=('SKIP'
            '0e5abaaa638d544e83f674fdfbccdec705faa541d3dd272d22580c1997cb1e40785a1d3dbe1ec0f7aad21d07c6ebdf715eb028dba8aab8f9e9f08a01005bd7d8'
            'f315c6fbfc842a9ced93c8f493ce601f46fd0a4a0974bef22730e3e693aeff6b4c259ddc0165a6a891c6889b016c33ed5b640d787b16a1ca5525fa9f8a8b0096'
            '9790135846977e6d0ff681858db99e3c2dc8040a505db5b24f5cc5eefb474971db627f7a2af4ab60130e865f2c024543915f30b57a485cf56ece98dca94759ee'
            '20be8a30ddcd0c3acc22c3a8171e397d34cef8a3b32ad5e624105826c3ad9d1ad561a00ddbab32d931753fd782faaf2ffa1f231b1158404a2e5723189d189079'
            '8d60d253b5399f64a565c244a8ef210a646ed5e00ef2cc234e3170103ee5629d10fdb7847fa6cf01d41da9cb904a7ed1a72c3e7c915fd46b3646555a354f00e1'
            'f31200582fcb3888509788a88459f27249dc2340937265fd81be54d567c92c8ed19a6b74d0dc29b82645fc27c98e67e7fc085ee8bb5843b16b0af6c759aaa601'
            '8a21e62b7ff0982a5406e98510a3004c62f883b9fae0cad5b63f6a7df520896b65c726321da515dab754a91ed94280922e3f424ecc983c1a33eb1ec287b268a2'
            'b69a09f98f8a5cad8164cd48c5f6a78f2ce0e9818fb77ccf2a3e243cd0f2023e438022b20aad9e6b5edd90e1bb862326db79dc423630682d4c43e897090d3da1'
            '532c3045f52f872704876bdf56afbc7470c5d17e46655dd4040d545b6d3eb34a8791909e554c560471f9494c7382107839bcff1e48be242d5eea0092482165cd')

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
    'brightnessctl'
    'conky'
    'dunst'
    'libnotify'
    'lisgd'
    'mpv'
    'ttf-dejavu-nerd'
    'upower'
    )
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
