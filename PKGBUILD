pkgname=lw-comm-server-uk-git
pkgver=r259.db55bf5
pkgrel=1
pkgdesc="lw.comm-server - unified communications server for LaserWeb4 (Ukrainian language)"
arch=("x86_64")
url="https://github.com/khvalera/lw.comm-server-uk"
license=('GPL')
depends=('nodejs')
makedepends=('npm' 'yarn')
source=("${pkgname%-git}"::"git+https://github.com/khvalera/lw.comm-server-uk")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/lw-comm-server-uk"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
   cd "$srcdir/lw-comm-server-uk"
   #export NODE_OPTIONS=--openssl-legacy-provider
   yarn install
}

package() {
   cd "$srcdir/lw-comm-server-uk"
   mkdir -p \
        "${pkgdir}/etc/lw-comm-server" \
        "${pkgdir}/usr/lib/lw-comm-server" \
        "${pkgdir}/usr/lib/systemd/system" \
        "${pkgdir}/usr/share/licenses/lw-comm-server"

   install -Dm644  config.js "${pkgdir}/etc/lw-comm-server/"
   install -Dm644 {server.js,grblStrings.js,firmwareFeatures.js,package.json,yarn.lock} "${pkgdir}/usr/lib/lw-comm-server/"
   sed -i "s|./config|/etc/lw-comm-server/config|" "${pkgdir}/usr/lib/lw-comm-server/server.js"
   sed -i "s|__dirname|'/usr/lib/lw-comm-server'|" "${pkgdir}/etc/lw-comm-server/config.js"
   cp -r {node_modules,app} "${pkgdir}/usr/lib/lw-comm-server/"
   install -Dm644 linux/lw-comm-server.service  ${pkgdir}/usr/lib/systemd/system/lw-comm-server.service
   install -Dm644 linux/lw-comm-server.sysusers ${pkgdir}/usr/lib/sysusers.d/lw-comm-server.conf
   install -Dm644 linux/lw-comm-server.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/lw-comm-server.conf
   install -Dm644 {LICENSE,README.*}            ${pkgdir}/usr/share/licenses/lw-comm-server/
}
