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
        '0007-start-stop-graphical-session.target.patch'
        '0008-Fix-quoting-of-strings-in-service-files.patch'
        '0009-Simplify-handling-of-XDG_RUNTIME_DIR.patch')
sha512sums=('SKIP'
            '8a21e62b7ff0982a5406e98510a3004c62f883b9fae0cad5b63f6a7df520896b65c726321da515dab754a91ed94280922e3f424ecc983c1a33eb1ec287b268a2'
            'b69a09f98f8a5cad8164cd48c5f6a78f2ce0e9818fb77ccf2a3e243cd0f2023e438022b20aad9e6b5edd90e1bb862326db79dc423630682d4c43e897090d3da1'
            '532c3045f52f872704876bdf56afbc7470c5d17e46655dd4040d545b6d3eb34a8791909e554c560471f9494c7382107839bcff1e48be242d5eea0092482165cd'
            '2d58ebb5c6109161a3646266f992b310de164075e55f1cd7f23e56535c1786cd539194de6681ee03387bdb4c08d96677f2de046bc8c2e18bc9ac9d5a0b4c26db'
            '720cde09229189fe6f25d60107415cec02494f93feaabe41d0a935c7fe2ff1145f1d0aca3f354ea4defd9816c2cf88616605e39d0364124f579932838e556798'
            'b63d548f357d786f28f0371ea451329ed2ee2f05d6337dc81db2903bb519f2abe820d7d49d0b46028939b691f6f9550bfb5566199340e1f4219f35098e671674'
            '0619e8ad0a55b2b26c149fc4d13c60f0334cba6c04289c940df794a4cae20824e056f4a9cc5b423570a55c90ba9ab2c434e47d79d5881fbeb36ee4383198d232'
            'fd2a7e20a6920c92a437ce5962b3fb101961e4428c5f2758627e5a4abf6dc733e0838ad43a0e8711a3d10359d1ba99f3fce7842c66f8082ed611f4487256d68c'
            '60c7cc94765c8b0bb309a4babe17d3a2dc6e5fa72b93ecd61bb631eb6f20ab500ebadb45892a0903108b89b9d1c2f654568b5db30ca043cf823bc518e084ba92'
            '6b2fe273ead62c202f1925f609f95de92ae8babff69a8eaaa70209d1113749aaf59b3a0308c3cceceb0f315504e2610ae2a07923aa9863cd9296c725996876fc'
            '6f1c5427f43446850c432027c5ec75d9dac5b7609afb7f8acdc014da3ccdc1639d0aace6e442a81f4cc783a1df0a18191b485850e88f0e5c8895555ca76866c6'
            '45c8e299be85cb7f1e3e3989df6cf5d0b08291d36abad5372649a9ce996be6e00dda64d7dd1a0445d2c121e59cc246683df16793973921b75245d7abf30a8282')

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
    'libnotify'
    'light'
    'lisgd'
    'mpv'
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
