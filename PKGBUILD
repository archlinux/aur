# Maintainer: Eduard Tolosa <edu4rdshl@pm.me>

pkgname=xodus-nexus-bin
_pkgname=xodus-nexus
pkgver=0.3.8
pkgrel=2
_appimage="Xodus-Nexus-${pkgver}-x86_64.AppImage"
pkgdesc='Xbox-inspired launcher for Microsoft Store PC games on Linux, built on Xodus'
arch=(x86_64)
url='https://github.com/domsvoboda/xodus-nexus'
license=(MIT)
depends=(alsa-lib gtk3 nss xdg-utils)
optdepends=(
  'org.freedesktop.secrets: keep the Xbox account signed in'
  'steam: Add to Steam integration'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip !debug)
install=$pkgname.install
source=(
  "${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/domsvoboda/xodus-nexus/v${pkgver}/LICENSE"
  "${_pkgname}.desktop"
  "${_pkgname}"
)
noextract=("${_appimage}")
sha256sums=('d33a3a36b1aff00d872f68ce3c8456347b272cb94f20c44faf848c5725a7c3a3'
            '639b735fd2f65779b82c4aab471f1fcdf927e10e1c21250911f75d44d136ff11'
            '686f0162e483642dd660f24202fb45d64af109a8b2050e055a5313cba79bd9d7'
            '2f73a67081c31c8e5190776d0c1dc989bfa7fbdb1f22f03732c71b7c25a1cc5b')

prepare() {
  cd "$srcdir"

  chmod +x "${_appimage}"
  "./${_appimage}" --appimage-extract > /dev/null
}

package() {
  cd "${srcdir}"

  # The upstream wrapper (opt/xodus-nexus/xodus-nexus) resolves its own directory
  # from $0, so it must be exec'd from /usr/bin instead of symlinked.
  install -dm755 "$pkgdir/opt/$_pkgname"
  cp -a squashfs-root/. "$pkgdir/opt/$_pkgname/"
  rm -rf "$pkgdir/opt/$_pkgname"/{AppRun,.DirIcon,usr,$_pkgname.desktop,$_pkgname.png}
  chmod -R u+rwX,go+rX,go-w "$pkgdir/opt/$_pkgname"

  install -Dm755 -t "$pkgdir/usr/bin" $_pkgname

  # upstream may change the shipped icon sizes, so install whatever is there
  for _icon in squashfs-root/usr/share/icons/hicolor/*/apps/$_pkgname.png; do
    install -Dm644 "$_icon" "$pkgdir/${_icon#squashfs-root/}"
  done

  install -Dm644 -t "$pkgdir/usr/share/applications" $_pkgname.desktop
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

