_zuluver='21.46.19'
_jrever='21.0.9'

pkgname='zulu-jre21-fx'
pkgver="${_zuluver}_${_jrever}"
pkgrel=1
pkgdesc='An open source, TCK-tested and certified build of OpenJDK (full-runtime environment with OpenJFX included).'
arch=('x86_64' 'aarch64')
license=('GPL-2.0-with-classpath-exception')
depends=(
  'java-runtime-common>=3'
  'ca-certificates-utils'
)
provides=(
  'java-runtime=21'
  'java-runtime-headless=21'
  'java-runtime-openjdk=21'
  'java-runtime-headless-openjdk=21'
  'java-openjfx=21'
)
install="$pkgname.install"
source_x86_64=("https://cdn.azul.com/zulu/bin/zulu$_zuluver-ca-fx-jre$_jrever-linux_x64.tar.gz")
source_aarch64=("https://cdn.azul.com/zulu/bin/zulu$_zuluver-ca-fx-jre$_jrever-linux_aarch64.tar.gz")
sha256sums_x86_64=('f3acb0aea8ccd7a7293bbf580f09b9614b5c8fa7729ac1a0478f7da58cd246e5')
sha256sums_aarch64=('1c034dbdb0de3b0b96475095ca75fe676a577333f9f8cb7f849e9cde7e1bcd92')

_jvmdir="usr/lib/jvm/$pkgname"

package() {
    # Copy main files
    install -d "$pkgdir/$_jvmdir"
    cp -a "$srcdir"/zulu*/. "$pkgdir/$_jvmdir"

    # Conf
    install -d "$pkgdir/etc/$pkgname"
    cp -a "$pkgdir/$_jvmdir/conf/." "$pkgdir/etc/$pkgname"
    rm -r "$pkgdir/$_jvmdir/conf"
    ln -s "/etc/$pkgname" "$pkgdir/$_jvmdir/conf"

    # Legal
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    cp -a "$pkgdir/$_jvmdir/legal/." "$pkgdir/usr/share/licenses/$pkgname"
    rm -r "$pkgdir/$_jvmdir/legal"
    ln -s "/usr/share/licenses/$pkgname" "$pkgdir/$_jvmdir/legal"

    # Link JKS keystore from ca-certificates-utils
    rm -f "$pkgdir/$_jvmdir/lib/security/cacerts"
    ln -sf "/etc/ssl/certs/java/cacerts" "$pkgdir/$_jvmdir/lib/security/cacerts"
}
