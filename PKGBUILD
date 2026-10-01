# Maintainer: Nyefan <archuserrepository at nyefan dot org>

pkgname="darkly-art-bin"
pkgver="0.10.0"
pkgrel="1"
pkgdesc="Forbidden Editor for Artists"
arch=("x86_64")
url="https://github.com/darkly-art/darkly"
license=("AGPL-3.0-or-later")
options=("!strip" "!debug")
depends=(
  "glibc" "libgcc"
  "gtk3" "glib2" "pango" "cairo" "at-spi2-core"
  "nss" "nspr"
  "alsa-lib" "libcups" "dbus" "expat" "systemd-libs"
  "mesa" "libglvnd"
  "libx11" "libxcb" "libxcomposite" "libxdamage" "libxext" "libxfixes" "libxrandr" "libxkbcommon"
  "libnotify" "xdg-utils"
)
optdepends=(
  "libpulse: PulseAudio/PipeWire audio output"
  "libsecret: secure credential storage"
  "gnome-keyring: secret service backend for libsecret"
  "kwallet: secret service backend for libsecret (KDE)"
  "kde-cli-tools: file deletion support (kioclient)"
  "trash-cli: file deletion support (trash-put)"
  "libva: hardware video decoding"
  "gtk4: --gtk-version=4 support"
  "lsb-release: distribution detection"
)

provides=("darkly-art=${pkgver}")
conflicts=("darkly-art")
source=("${pkgname}-v${pkgver}.deb::https://github.com/darkly-art/darkly/releases/download/v${pkgver}/darkly-desktop_${pkgver}_amd64.deb")
sha256sums=("c74ec6621ed3e6323c5c9d7fc0b612f58d46e336af0a9dde200b0e9255f90c87")

prepare() {
  pushd "${srcdir}" >/dev/null
    mkdir "root"
    bsdtar -xf data.tar.* -C "root"
    pushd "root" >/dev/null
      mkdir -p "opt"
      mv "usr/lib/darkly-desktop" "opt/darkly-desktop"
      ln -sf "/opt/darkly-desktop/darkly" "usr/bin/darkly-desktop"
      rmdir "usr/lib"
      rm -r "usr/share/lintian"
    popd >/dev/null
  popd >/dev/null
}

package() {
  cp -a "${srcdir}/root/." "${pkgdir}/"
}

