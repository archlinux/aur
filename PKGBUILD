# Maintainer: QiE2035 <qie2035@qq.com>
pkgname=polymerium-bin
pkgver=1.13.3
pkgrel=1
pkgdesc="Minecraft instance manager: mods, modpacks and one-click instance deployment (official binary)"
arch=('x86_64')
url="https://polymerium.dearain.dev/zh"
license=('MIT')
depends=(
  'brotli'
  'bzip2'
  'expat'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glib2'
  'glibc'
  'icu'
  'krb5'
  'libglvnd'
  'libice'
  'libpng'
  'libsm'
  'libx11'
  'libxcursor'
  'libxext'
  'libxfixes'
  'libxi'
  'libxrandr'
  'openssl'
  'zlib'
)
optdepends=('lttng-ust2.12: CoreCLR tracing support')
provides=("polymerium=$pkgver")
conflicts=('polymerium')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.AppImage::https://github.com/d3ara1n/Polymerium/releases/download/v$pkgver/Polymerium.AppImage"
        "LICENSE.txt::https://raw.githubusercontent.com/d3ara1n/Polymerium/v$pkgver/LICENSE.txt")
sha256sums=('18fba22734484cac91ad1767ecb7d8ae4379cdf5fe0c10cafd5ecf9214bc7e49'
            '002c2696d92b5c8cf956c11072baa58eaf9f6ade995c031ea635c6a1ee342ad1')

prepare() {
  chmod +x "$srcdir/$pkgname-$pkgver.AppImage"
  rm -rf "$srcdir/squashfs-root"
  ( cd "$srcdir" && ./"$pkgname-$pkgver.AppImage" --appimage-extract >/dev/null )
}

package() {
  # self-contained .NET 10 runtime, assemblies and native libraries
  install -dm755 "$pkgdir/opt/polymerium"
  cp --reflink=auto -a "$srcdir/squashfs-root/usr/bin/." "$pkgdir/opt/polymerium/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/polymerium" <<'EOF'
#!/bin/sh
exec /opt/polymerium/Polymerium "$@"
EOF

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/Polymerium.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Polymerium
GenericName=Minecraft Instance Manager
Comment=Manage Minecraft instances, mods and modpacks
Exec=polymerium %U
Icon=Polymerium
Terminal=false
Categories=Game;
Keywords=minecraft;modpack;launcher;instance;mod;
StartupWMClass=Polymerium
EOF

  install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/scalable/apps/Polymerium.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512@2/apps/Polymerium.png"

  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
