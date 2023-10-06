# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_pkgtag=2.42
pkgname="mtg-desktop-companion"
pkgver=$_pkgtag
pkgrel=1
pkgdesc='Cards manager for magic the gathering'
url='https://github.com/nicho92/MtgDesktopCompanion'
license=('Apache')
depends=('java-runtime>=16')
makedepends=('maven' 'unzip')

source=("$pkgname-$_pkgtag::https://github.com/nicho92/MtgDesktopCompanion/archive/refs/tags/$_pkgtag.tar.gz"
        "start.sh"
        "MtgDesktopCompanion.desktop"
        "pom.diff")
sha512sums=('5554f015687bb2921ade45c68ed7cc5a34460286b848aa1dd7102212472399e343f298542f99f22d6d60abd9ff7c8919b435a628402ed09b1e1d0fcf931c875d'
            '3abcbe1a1b0ca48237b0cf284988c8486b5ea3290bc924ef87c55ebb1b7e8f519697294bb6df9a24d5ca95d760290ed4075e7367c700913fe4d2e649556cd0c7'
            '0bc12e7f5d6057fa13ccc6619dc16cf9f46bf6d0d03568aae1da76c337d426918a61a3f48ea29fe64b847814356bcdd1c49a0187cdf561330fc740586f822530'
            'd2fd81142e7576d5369193f011f569ea87ad6eac73a2f7f82fb4aa3f25be8284b4e5a328cb1bcbbf13566bcb4d1cdd8a237ebb90cb84a6138e64f460fe25fa32')

arch=('any')

prepare() {
	cd "$srcdir/MtgDesktopCompanion-$_pkgtag"
	patch -N --input="${srcdir}/pom.diff"
}

build() {
	cd "$srcdir/MtgDesktopCompanion-$_pkgtag"
	mvn -DskipTests clean package
}

package() {
	cd "$srcdir/MtgDesktopCompanion-$_pkgtag/target"
	unzip "mtg-desktop-companion-$_pkgtag.zip"
	mkdir -p "$pkgdir/usr/share/java/$pkgname"
	cp -r "mtg-desktop-companion/lib/"*.jar "$pkgdir/usr/share/java/$pkgname"
	install -Dm 755 "$srcdir/start.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm 644 "$srcdir/MtgDesktopCompanion-$_pkgtag/src/main/resources/icons/logo.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"
	install -Dm 755 "${srcdir}/MtgDesktopCompanion.desktop" "$pkgdir/usr/share/applications/MtgDesktopCompanion.desktop"
	echo "you might want to clean $HOME/.m3 now"
}
