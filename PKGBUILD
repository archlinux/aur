# Maintainer: RamazanBerk20 <ramazanberksirin@protonmail.com>
pkgname=sirinvpn-bin
# 1.0.0-rc.1 in SemVer: pkgver cannot hold a hyphen, and 1.0.0rc1 sorts before 1.0.0.
pkgver=1.0.0rc1
pkgrel=1
_tag="v${pkgver/rc/-rc.}"
pkgdesc="Self-hosted WireGuard VPN: set up your own VPS and connect your devices (prebuilt)"
arch=('x86_64')
url="https://github.com/RamazanBerk20/SirinVPN"
license=('AGPL-3.0-only')
depends=('ca-certificates' 'cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'iproute2' 'iputils' 'libayatana-appindicator' 'libsoup3' 'nftables' 'polkit'
         'procps-ng' 'systemd' 'util-linux' 'webkit2gtk-4.1' 'wireguard-tools' 'zlib')
optdepends=('networkmanager: Wi-Fi automation and an unmanaged measurement probe interface'
            'org.freedesktop.secrets: remember SSH logins in the desktop keyring')
provides=("sirinvpn=$pkgver")
conflicts=('sirinvpn' 'sirinvpn-git')
install=sirinvpn.install
# Keep the release's exact binaries.
options=('!strip' '!debug')
# The release's signed Debian package: the same bytes its manifest lists.
_deb="SirinVPN_${_tag#v}_amd64.deb"
source_x86_64=("$_deb::$url/releases/download/$_tag/$_deb"
               "LICENSE-$pkgver::https://raw.githubusercontent.com/RamazanBerk20/SirinVPN/$_tag/LICENSE")
noextract=("$_deb")
# Filled from the published release by scripts/update-aur-checksums.sh.
sha256sums_x86_64=('1a0aa744fabba43e771f5fa7f0adc3d5141d9b2a1187dce0c9c835c937f2e30b'
                   'd8a6cc31abc16b6748c7a21f21611f5a1ec33f67d22ca23d7da1c19b95496bee')

package() {
  local data_archive
  mkdir -p "$srcdir/deb"
  bsdtar -xf "$srcdir/$_deb" -C "$srcdir/deb"
  data_archive=$(find "$srcdir/deb" -maxdepth 1 -name 'data.tar.*' -print -quit)
  bsdtar -xf "$data_archive" -C "$pkgdir"
  # Tauri names the 256 px icon folder "256x256@2"; icon themes look in 256x256.
  mv "$pkgdir/usr/share/icons/hicolor/256x256@2" "$pkgdir/usr/share/icons/hicolor/256x256"
  # pacman owns these files: the app offers package-manager updates, not dpkg.
  printf 'aur\n' >"$srcdir/install-method"
  install -Dm644 "$srcdir/install-method" "$pkgdir/usr/lib/sirinvpn/install-method"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
