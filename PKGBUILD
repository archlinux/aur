# Maintainer: Piroro-hs

pkgname='zulu-17-fx-bin'
_javaver=17
pkgver="$_javaver.0.17"
_zuluver="$_javaver.62.17"
pkgrel=1
pkgdesc='Azul Zulu Builds of OpenJDK With OpenJFX are open source, TCK-tested and certified builds of OpenJDK.'
arch=('x86_64')
url='https://www.azul.com/downloads'
license=('LicenseRef-Zulu')
groups=()
# TODO: Add library dependencies?
depends=('ca-certificates-utils'
         'java-environment-common'
         'java-runtime-common')
makedepends=()
optdepends=()
provides=("java-environment=$_javaver"
          "java-environment-openjdk=$_javaver"
          "java-runtime=$_javaver"
          "java-runtime-openjdk=$_javaver"
          "java-runtime-headless=$_javaver"
          "java-runtime-headless-openjdk=$_javaver"
          "java-openjfx=$_javaver")
conflicts=()
replaces=()
backup=("etc/${pkgname%-bin}/logging.properties"
        "etc/${pkgname%-bin}/management/jmxremote.access"
        "etc/${pkgname%-bin}/management/management.properties"
        "etc/${pkgname%-bin}/net.properties"
        "etc/${pkgname%-bin}/security/java.policy"
        "etc/${pkgname%-bin}/security/java.security"
        "etc/${pkgname%-bin}/security/policy/limited/default_local.policy"
        "etc/${pkgname%-bin}/security/policy/limited/default_US_export.policy"
        "etc/${pkgname%-bin}/security/policy/limited/exempt_local.policy"
        "etc/${pkgname%-bin}/security/policy/unlimited/default_local.policy"
        "etc/${pkgname%-bin}/security/policy/unlimited/default_US_export.policy"
        "etc/${pkgname%-bin}/sound.properties")
install="$pkgname.install"
source=("https://cdn.azul.com/zulu/bin/zulu$_zuluver-ca-fx-jdk$pkgver-linux_x64.tar.gz")
sha256sums=('1a16f93442ede69d3b1e69d78d0bcf99453971675c7ae147f9a4fe530c9a4fd9')

# Based on java17-openjdk package
# https://gitlab.archlinux.org/archlinux/packaging/packages/java17-openjdk/-/blob/582950f9492887cb1ff241e623067fd1f02dd35d/PKGBUILD#L258
package() {
  local jvmdir="$pkgdir/usr/lib/jvm/${pkgname%-bin}"

  cd "$srcdir/zulu$_zuluver-ca-fx-jdk$pkgver-linux_x64"

  install -dm755 "$jvmdir"

  cp -a bin demo include jmods lib release "$jvmdir"

  install -dm755 "$pkgdir/etc"
  cp -a conf "$pkgdir/etc/${pkgname%-bin}"
  ln -s "/etc/${pkgname%-bin}" "$jvmdir/conf"

  install -dm755 "$pkgdir/usr/share/licenses"
  cp -a legal "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/share/licenses/$pkgname" "$jvmdir/legal"

  install -Dm644 man/man1/*.1 -t "$pkgdir/usr/share/man/man1/"
  rename -l -- .1 "-${pkgname%-bin}.1" "$pkgdir/usr/share/man/man1/"*.1
  ln -s /usr/share/man "$jvmdir/man"

  install -Dm644 DISCLAIMER OPENJFX_LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -Dm644 readme.txt Welcome.html -t "$pkgdir/usr/share/doc/$pkgname/"

  rm -f "$jvmdir/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "$jvmdir/lib/security/cacerts"
}
