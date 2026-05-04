# Maintainer: Massimo Pavoni (damax) <real dot damax at gmail dot com>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Morten Linderud <morten@linderud.pw>
# Contributor: Andreas Krinke <andreas dot krinke at gmx dot de>

pkgname=gephi
pkgver=0.11.1
pkgrel=1
pkgdesc="An interactive graph visualization and exploration platform"
arch=('x86_64')
url="https://gephi.org"
license=('CDDL-1.0 AND GPL-3.0-only')
depends=('java-runtime=17' 'java-environment=17' 'libxxf86vm' 'libnet' 'freetype2')
makedepends=('gendesk')
options=(!strip)
source=("https://github.com/gephi/gephi/releases/download/v$pkgver/gephi-$pkgver-linux-x64.tar.gz")
b2sums=('2732808c268ac2002e535cb4e9051c1f3e9cfd9de56aad9d055ab85eb8ef5359930e00132a4d37777f38a413136e1e931130efc8975b611c9db16f301ff7cac5')

prepare() {
  gendesk -n --name "Gephi - The Open Graph Viz Platform" \
    --pkgname "$pkgname" \
    --pkgdesc "$pkgdesc"
}

package() {
  cd "$srcdir/gephi-${pkgver}"

  install -d "${pkgdir}/usr/share/java/${pkgname}"
  cp -r * "${pkgdir}/usr/share/java/${pkgname}"

  # Fix config file permissions so users can read it
  chmod 644 "${pkgdir}/usr/share/java/${pkgname}/etc/gephi.conf"

  find "${pkgdir}" -type f -iname \*.dll -delete
  find "${pkgdir}" -type f -iname \*.exe -delete
  find "${pkgdir}" -type f -name .lastModified -delete

  install -d "${pkgdir}/usr/bin"
  cat >"${pkgdir}/usr/bin/gephi" <<'EOF'
#!/bin/sh
export GEPHI_JDK=/usr/lib/jvm/java-17-openjdk
exec /usr/share/java/gephi/bin/gephi "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/gephi"

  # Install the desktop file
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
