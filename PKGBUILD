# Maintainer: Eduard Tolosa <edu4rdshl@pm.me>

pkgname=nexus-launcher-bin
_pkgname=nexus-launcher
pkgver=0.5.0
pkgrel=1
_appimage="Xodus-Nexus-${pkgver}-x86_64.AppImage"
pkgdesc='Xbox-inspired launcher for Microsoft Store PC games on Linux, built on Xodus'
arch=(x86_64)
url='https://github.com/domsvoboda/nexus-launcher'
license=(MIT)
depends=(alsa-lib gtk3 nss xdg-utils)
optdepends=(
  'org.freedesktop.secrets: keep the Xbox account signed in'
  'steam: Add to Steam integration'
  'python-gobject: Nexus Overlay'
  'webkit2gtk-4.1: Nexus Overlay'
  'gtk-layer-shell: Nexus Overlay on Wayland'
)
provides=("$_pkgname")
conflicts=("$_pkgname" xodus-nexus)
replaces=(xodus-nexus-bin)
options=(!strip !debug)
install=$pkgname.install
source=(
  "${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/domsvoboda/${_pkgname}/v${pkgver}/LICENSE"
  "${_pkgname}.desktop"
  "${_pkgname}"
)
noextract=("${_appimage}")
sha256sums=('9a28294adb20345dcc5673e6085b44824d5fce105060e822867ce9d375a633ff'
            '639b735fd2f65779b82c4aab471f1fcdf927e10e1c21250911f75d44d136ff11'
            '241cb6a099ad271cbf99ec73b29a8f7572be72acd68d28cf23318573152ec7ea'
            'b55222463f13c4d67f81f1fc70bd4a42a7412c5fe48b4815b977633a6001777f')

prepare() {
  cd "$srcdir"

  chmod +x "${_appimage}"
  "./${_appimage}" --appimage-extract > /dev/null
}

package() {
  cd "${srcdir}"

  # Upstream still names the executable, desktop file and icons xodus-nexus.
  # The upstream wrapper (opt/nexus-launcher/xodus-nexus) resolves its own
  # directory from $0, so it must be exec'd from /usr/bin instead of symlinked.
  install -dm755 "$pkgdir/opt/$_pkgname"
  cp -a squashfs-root/. "$pkgdir/opt/$_pkgname/"
  rm -rf "$pkgdir/opt/$_pkgname"/{AppRun,.DirIcon,usr,xodus-nexus.desktop,xodus-nexus.png}
  chmod -R u+rwX,go+rX,go-w "$pkgdir/opt/$_pkgname"

  install -Dm755 -t "$pkgdir/usr/bin" $_pkgname

  # upstream may change the shipped icon sizes, so install whatever is there
  for _icon in squashfs-root/usr/share/icons/hicolor/*/apps/xodus-nexus.png; do
    _icondir=${_icon#squashfs-root/}
    install -Dm644 "$_icon" "$pkgdir/${_icondir%/*}/$_pkgname.png"
  done

  install -Dm644 -t "$pkgdir/usr/share/applications" $_pkgname.desktop
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
