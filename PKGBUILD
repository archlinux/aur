# Maintainer: Massimo Pavoni (damax) <real dot damax at gmail dot com>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Morten Linderud <morten@linderud.pw>
# Contributor: Andreas Krinke <andreas dot krinke at gmx dot de>

pkgname=gephi
pkgver=0.11.1
pkgrel=2
pkgdesc="An interactive graph visualization and exploration platform"
arch=('x86_64')
url="https://gephi.org"
license=('CDDL-1.0 AND GPL-3.0-only')
_jdk=17
depends=("java-runtime=$_jdk" "java-environment=$_jdk" 'libxxf86vm' 'libnet' 'freetype2')
makedepends=('gendesk')
options=(!strip)
source=("https://github.com/gephi/gephi/releases/download/v$pkgver/gephi-$pkgver-linux-x64.tar.gz")
b2sums=('2732808c268ac2002e535cb4e9051c1f3e9cfd9de56aad9d055ab85eb8ef5359930e00132a4d37777f38a413136e1e931130efc8975b611c9db16f301ff7cac5')

prepare() {
  gendesk -n --name "Gephi - The Open Graph Viz Platform" \
    --pkgname "$pkgname" \
    --pkgdesc "$pkgdesc" \
    --categories "Graphics;Education;Science;Network;DataVisualization" \
    --exec "gephi %F" \
    --genericname "Network Visualization"
}

package() {
  cd "$srcdir/gephi-$pkgver"

  install -d "$pkgdir/usr/share/gephi"
  cp -r * "$pkgdir/usr/share/gephi"

  chmod 644 "$pkgdir/usr/share/gephi/etc/gephi.conf"

  find "$pkgdir" -type f \( -iname '*.dll' -o -iname '*.exe' \
    -o -name '.lastModified' \) -delete

  install -d "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/gephi" <<EOF
#!/bin/sh
export GEPHI_JDK=/usr/lib/jvm/java-${_jdk}-openjdk
exec /usr/share/gephi/bin/gephi "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/gephi"

  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 "$srcdir/$pkgname-$pkgver/flathub/gephi.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/gephi.png"
}
