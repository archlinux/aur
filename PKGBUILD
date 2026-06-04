# Maintainer: MaoYaotang <maoyaotang@163.com>

pkgbase=bc-java-git
pkgname=(bcprov-git bcpkix-git)
_pkgname=bc-java
pkgver=1rv84.r369.g88c3623
pkgrel=1
pkgdesc='Bouncy Castle Crypto APIs for Java'
arch=(any)
url='https://www.bouncycastle.org/java.html'
_url='https://github.com/bcgit/bc-java'
license=(MIT)
depends=(java-runtime-headless)
makedepends=(ant
             strip-nondeterminism)
_archive="$_pkgname"
source=("git+$_url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_archive"
  git describe --long --tags --abbrev=7 | sed 's/^[^0-9]*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_archive"
	ant -f ant/jdk18+.xml clean build-provider build-pkix build
	strip-nondeterminism --timestamp "$SOURCE_DATE_EPOCH" build/artifacts/jdk1.8/jars/bcprov-jdk18on-*.jar
	strip-nondeterminism --timestamp "$SOURCE_DATE_EPOCH" build/artifacts/jdk1.8/jars/bcpkix-jdk18on-*.jar
}

package_bcprov-git() {
	pkgdesc='Bouncy Castle Provider (bcprov) for Java'
	depends=(java-runtime-headless)

	cd "$_archive"
	install -Dm644 -t "$pkgdir/usr/share/java/${pkgname%-git}/" build/artifacts/jdk1.8/jars/bcprov-jdk18on-*.jar
	install -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname%-git}/" LICENSE.html

	# 精准软链接（无通配符）
	jarfile=$(basename build/artifacts/jdk1.8/jars/bcprov-jdk18on-*.jar)
	ln -s "${pkgname%-git}/$jarfile" "$pkgdir/usr/share/java/bcprov.jar"
}

package_bcpkix-git() {
	pkgdesc='Bouncy Castle PKIX/X.509 (bcpkix) for Java'
	depends=(bcprov-git java-runtime-headless)

	cd "$_archive"
	install -Dm644 -t "$pkgdir/usr/share/java/${pkgname%-git}/" build/artifacts/jdk1.8/jars/bcpkix-jdk18on-*.jar
	install -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname%-git}/" LICENSE.html

	# 精准软链接（无通配符）
	jarfile=$(basename build/artifacts/jdk1.8/jars/bcpkix-jdk18on-*.jar)
	ln -s "${pkgname%-git}/$jarfile" "$pkgdir/usr/share/java/bcpkix.jar"
}
