# Maintainer: Ben Cooper <contactme at bengcooper dot co dot uk>
# Co-Maintainer: Polarian <polarian@polarian.dev>
_projectid=160
_buildid=3271
pkgname=onedev
pkgver=7.9.4
pkgrel=3
pkgdesc="A self-hosted Git server with CI/CD and Kanban"
arch=('x86_64')
depends=('java-runtime-headless>11.0.0' 'git>2.11.1' 'curl' 'fontconfig' 'ttf-dejavu')
url="https://code.onedev.io/onedev/server"
license=('MIT' 'BSD' 'Apache' 'LGPL2.1' 'MPL2' 'custom:Oracle Technology Network License'
         'custom:Microsoft Software License' 'custom:Sun Microsystems Inc Binary Code License'
         'custom:Jetty License')
source=("https://code.onedev.io/~downloads/projects/$_projectid/builds/$_buildid/artifacts/onedev-$pkgver.tar.gz"
        "sysusers.conf"
        "onedev.service")
sha256sums=('709f721d0df65f29bb1b1d8bef7a39b3afd77193ea14c1711681ed3ca00618f7'
            'ed8573826c9c89d7a35e3f8b52d4de69c9377fc713b5227bf30f12a45f0c2c82'
            'b5c84783296f23287341ca36a62d64204b71285c42e040a788c8864b65d231e6')
backup=(opt/onedev/conf/hibernate.properties
        opt/onedev/conf/logback.xml
        opt/onedev/conf/server.properties
        opt/onedev/conf/wrapper.conf
        opt/onedev/conf/wrapper-license.conf)

build() {
  cd "$srcdir"
  tar -xvzf "onedev-$pkgver.tar.gz"
}

package() {
  install -o 663 -g 663 -d "$pkgdir/opt/onedev"
  cp -r "$srcdir/$pkgname-$pkgver"/* "$pkgdir/opt/onedev"
  chown -R 663:663 "$pkgdir/opt/onedev"
  install -D -m 0644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/onedev.conf"
  install -D -m 0644 onedev.service "$pkgdir/usr/lib/systemd/system/onedev.service"
  install -D -m 0644 "$srcdir/$pkgname-$pkgver/license.txt" "$pkgdir/usr/share/licenses/onedev/LICENSE"
  install -D -m 0644 "$srcdir/$pkgname-$pkgver/3rdparty-licenses/antlr-license.txt" "$pkgdir/usr/share/licenses/onedev/antlr/LICENSE"
  install -D -m 0644 "$srcdir/$pkgname-$pkgver/3rdparty-licenses/asm-license.txt" "$pkgdir/usr/share/licenses/onedev/asm/LICENSE"
  install -D -m 0644 "$srcdir/$pkgname-$pkgver/3rdparty-licenses/jetty-license.txt" "$pkgdir/usr/share/licenses/onedev/jetty/LICENSE"
  install -D -m 0644 "$srcdir/$pkgname-$pkgver/3rdparty-licenses/ojdbc-license.txt" "$pkgdir/usr/share/licenses/onedev/ojdbc/LICENSE"
  install -D -m 0644 "$srcdir/$pkgname-$pkgver/3rdparty-licenses/slf4j-license.txt" "$pkgdir/usr/share/licenses/onedev/slf4j/LICENSE"
  install -D -m 0644 "$srcdir/$pkgname-$pkgver/3rdparty-licenses/sqljdbc-license.txt" "$pkgdir/usr/share/licenses/onedev/sqljdbc/LICENSE"
  install -D -m 0644 "$srcdir/$pkgname-$pkgver/3rdparty-licenses/sun-license.txt" "$pkgdir/usr/share/licenses/onedev/sun/LICENSE"
}

pre_upgrade() {
  exec "$pkgdir/opt/onedev/bin/upgrade.sh /opt/onedev"
}

# vim:set ts=2 sw=2 et:
