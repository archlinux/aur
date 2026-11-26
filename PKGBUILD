# Maintainer: Ilya Obukhov
#
# Rendered from packaging/aur/PKGBUILD.in by deploy/scripts/release-aur.sh. Do not edit a published copy; change the
# template.
pkgname=puramai-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='Puramai desktop app (repackaged from the official .deb)'
arch=('x86_64')
url='https://puramai.io-workshop.net/'
license=('LicenseRef-Puramai')
# The bundled JRE is linked against these (checked with namcap); xdg-utils is the .deb's own dependency.
depends=('alsa-lib' 'fontconfig' 'hicolor-icon-theme' 'libglvnd' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'xdg-utils' 'zlib')
# The runtime inside /opt/puramai is a prebuilt JRE: stripping it would break it.
options=('!strip' '!debug')
source=("https://puramai.io-workshop.net/download/puramai_${pkgver}_amd64.deb"
        'LICENSE')
noextract=("puramai_${pkgver}_amd64.deb")
sha256sums=('71f25f87ee66ed41e821565e836f973cd05f882e86c39acbcedff2da65803440'
            '26a02bba9618166b1d2c9f4af1a084be050112c93a344269759370e45cd961d1')

prepare() {
  # makepkg would extract a .deb by itself; the .deb is an ar archive of tarballs, so unpack the data one by hand.
  mkdir -p deb
  bsdtar -xf "puramai_${pkgver}_amd64.deb" -C deb
  mkdir -p root
  bsdtar -xf deb/data.tar.* -C root
}

package() {
  install -d "$pkgdir/opt"
  cp -a root/opt/puramai "$pkgdir/opt/puramai"

  # The .deb's launcher and .desktop file point into /opt/puramai; a symlink and a hand-written entry are used instead.
  install -d "$pkgdir/usr/bin"
  ln -s /opt/puramai/bin/puramai "$pkgdir/usr/bin/puramai"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/puramai.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Puramai
Comment=Puramai
Exec=puramai
Icon=puramai
Terminal=false
Categories=Utility;
DESKTOP

  install -Dm644 root/opt/puramai/lib/puramai.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/puramai.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
