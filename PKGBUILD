# Maintainer: Matthew Longley <randomticktock@gmail.com>

pkgname=javacc
pkgver=6.1.3
pkgrel=1
pkgdesc="A parser generator for use with Java[tm]"
arch=('any')
url="http://javacc.java.net/"
license=('BSD')
depends=('java-environment' 'apache-ant')
source=('svn+https://svn.java.net/svn/javacc~svn/tags/release_6_1_3')
sha256sums=('SKIP')

build() {
    cd "$srcdir/release_6_1_3"
    ant
}

package() {
    cd "$srcdir/release_6_1_3"

    install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    mkdir -m755 -p "$pkgdir/usr/share/java/$pkgname/bin" "$pkgdir/usr/bin"

    # install examples
    cp -R "examples/" "$pkgdir/usr/share/java/$pkgname/examples"

    # install documentation
    cp -R "www/doc/" "$pkgdir/usr/share/java/$pkgname/doc"

    # install jar
    install -m755 -D "target/$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/bin/lib/$pkgname.jar"

    # generate scripts to allow direct execution
    for i in jjtree jjdoc javacc; do
	printf "#\!bin/sh\nJAR=\"/usr/share/java/$pkgname/bin/lib/javacc.jar\"\n\njava -classpath \"$JAR\" javacc \"\$@\"\n" > "$pkgdir/usr/share/java/$pkgname/bin/$i";
	cp "$pkgdir/usr/share/java/$pkgname/bin/$i" "$pkgdir/usr/bin/";
    done

    # Set permissions
    chmod -R 755 "$pkgdir/usr/share/java/$pkgname/bin" "$pkgdir/usr/bin"
}
