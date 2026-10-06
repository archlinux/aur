# Maintainer: Ca11back
# Contributor: venhal <1138706183@qq.com>

pkgname=ctyun-clouddesk-bin
pkgver=4.1.0.1346
pkgrel=2
pkgdesc="天翼云电脑 Linux 客户端（Public）"
arch=('x86_64')
url="https://www.ctyun.cn/products/cloudcomputer"
license=('LicenseRef-Proprietary' '0BSD')
options=('!strip' '!debug')
provides=("ctyunclouddeskpublic-bin=$pkgver")
conflicts=('ctyunclouddeskpublic-bin')

depends=(
  'alsa-lib' 'dbus' 'expat' 'fontconfig' 'freetype2' 'gdk-pixbuf2'
  'glib2' 'glibc' 'gtk3' 'libdrm' 'libgcc' 'libglvnd' 'libgudev'
  'libpulse' 'libstdc++' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor'
  'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxkbcommon'
  'libxkbcommon-x11' 'libxrandr' 'libxrender' 'libxslt' 'libxss'
  'nspr' 'nss' 'opus' 'pixman' 'sqlite' 'systemd-libs' 'v4l-utils'
  'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm'
  'xz' 'zlib'
)

source=("${pkgname}-${pkgver}.deb::https://desk.ctyun.cn/desktop/software/clientsoftware/download/7996be544023a0e2432281e1363f9fe2"
        'ctyun-clouddesk' 'ctyunclouddeskpublic.conf' 'LICENSE')
sha256sums=('61840ae48b70133844327c400da6f25fab1bf7f477225fccb319ff14df19f18a'
            '3688a27a5fa9ab62304f65f4842164fd2a75b4b78b746c617f3ba21165234911'
            '755c30a9b9fdd21a5ca1ce6eeee25b139e705af4acc88835bc1ffb1db292ca72'
            '1d68fcad5c0989b4a28631cf48f32eeba6fddd88a277b4603a09f183eaea7d34')

prepare() {
  mkdir -p "$srcdir/payload"
  bsdtar -xf "$srcdir/data.tar.gz" -C "$srcdir/payload"
}

package() {
  cp -a "$srcdir/payload/opt" "$pkgdir/"
  # Select desktop support rather than copying usr/bin's Debian updater.
  install -Dm644 "$srcdir/payload/usr/share/applications/CtyunClouddeskPublic.desktop" \
    "$pkgdir/usr/share/applications/CtyunClouddeskPublic.desktop"
  # Debian /lib aliases /usr/lib on Arch; install units explicitly.
  install -Dm644 "$srcdir/payload/lib/systemd/system/clouddesktop-daemon.service" \
    "$pkgdir/usr/lib/systemd/system/clouddesktop-daemon.service"
  install -Dm755 "$srcdir/ctyun-clouddesk" "$pkgdir/usr/bin/ctyun-clouddesk"
  sed -i 's|^Exec=.*|Exec=/usr/bin/ctyun-clouddesk|' \
    "$pkgdir/usr/share/applications/CtyunClouddeskPublic.desktop"
  install -Dm644 "$srcdir/ctyunclouddeskpublic.conf" \
    "$pkgdir/usr/lib/tmpfiles.d/ctyunclouddeskpublic.conf"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/packaging-0BSD.txt"
  # These are upstream third-party notices, not a license grant for the client.
  cp -a "$srcdir/payload/opt/ctg/CtyunClouddeskPublic/licenses" \
    "$pkgdir/usr/share/licenses/$pkgname/upstream"
}
