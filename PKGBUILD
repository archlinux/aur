# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
#
# Written by the release workflow of
# https://github.com/chmouel/liseur-desktop from packaging/aur/PKGBUILD.in.
# Anything changed here is lost on the next release.

pkgname=liseur-desktop-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Snappy desktop EPUB reader, desktop counterpart of Liseur for Android"
arch=('x86_64' 'aarch64')
url="https://github.com/chmouel/liseur-desktop"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libsecret' 'libnotify' 'xdg-utils')
optdepends=('gnome-keyring: keep remote server passwords in the login keyring')
provides=('liseur-desktop')
conflicts=('liseur-desktop')
options=('!strip' '!debug')

_dl="$url/releases/download/v$pkgver"
source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/chmouel/liseur-desktop/v$pkgver/LICENSE"
        "$pkgname-$pkgver-icon.png::https://raw.githubusercontent.com/chmouel/liseur-desktop/v$pkgver/build/icon.png")
source_x86_64=("$_dl/liseur-desktop-$pkgver-linux-x64.tar.gz")
source_aarch64=("$_dl/liseur-desktop-$pkgver-linux-arm64.tar.gz")
sha256sums=('81bd234328535b3fe013f50b3447ac82b56a73cd9fc520f54b6c11d78d0084a0'
            '49c3d9e5b1961666908e27a598558bbc66936018bdac70972883e469d20cb260')
sha256sums_x86_64=('27e40559cf6a6f895742e7b0a6596776442ab0a79287963e2d3e4c1375b4e6f1')
sha256sums_aarch64=('ab59c57dde906dd9f0810e187e8e6020d9970818726aa891d2c8890355bbdd7c')

package() {
  local _arch=x64
  [[ $CARCH == aarch64 ]] && _arch=arm64

  install -dm755 "$pkgdir/opt/$pkgname"
  cp -a "$srcdir/liseur-desktop-$pkgver-linux-$_arch/." "$pkgdir/opt/$pkgname/"

  # Electron's sandbox helper needs the setuid bit on kernels that refuse
  # unprivileged user namespaces, or the app will not start at all.
  chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/liseur" "$pkgdir/usr/bin/liseur"

  install -Dm644 "$srcdir/$pkgname-$pkgver-icon.png" \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/liseur.png"
  install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/liseur.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Liseur
Comment=Snappy desktop EPUB reader
Exec=liseur %U
Icon=liseur
Terminal=false
Categories=Office;Viewer;Literature;
MimeType=application/epub+zip;
Keywords=epub;ebook;reader;books;
StartupWMClass=liseur
DESKTOP
}
