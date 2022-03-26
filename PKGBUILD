# Maintainer: copygirl <copygirl@mcft.net>
_pkgname=vsmodelcreator
pkgname=$_pkgname-git
pkgver=r322.d2eb492
pkgrel=1
pkgdesc="Vintage Story Model Creator"
arch=("any")
url="https://github.com/anegostudios/vsmodelcreator"
license=("Apache")
depends=("java-runtime>=8")
makedepends=("git" "java-environment>=8")
source=("git+https://github.com/anegostudios/vsmodelcreator.git"
        "vsmodelcreator.desktop"
        "vsmodelcreator.sh")
md5sums=("SKIP"
         "93ebcec3e1e896caf3685171c1d74df4"
         "c73547c2875d92655e67ed75fd98dd85")

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	# Build the application
	mkdir -p bin
	javac -cp "libs/*" -d bin $(find src -name "*.java")
	# Create a .jar file
	jar cfe "$_pkgname".jar "at.vintagestory.modelcreator.Start" -C bin . -C assets .
	# Specifying the main entry class here, but not actually using it in the launch script.
}

package() {
	# Copy console launcher .sh
	install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"$_pkgname"
	# Copy application icon and .desktop launcher file
	install -Dm644 "$_pkgname"/assets/appicon.ico "$pkgdir"/usr/share/pixmaps/"$_pkgname".ico
	install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
	
	cd "$_pkgname"
	# Copies .jar file, libs and native libraries
	install -Dm755 vsmodelcreator.jar "$pkgdir"/usr/share/java/"$_pkgname"/vsmodelcreator.jar
	install -Dm644 -t "$pkgdir"/usr/share/java/"$_pkgname"/libs/ libs/*
	install -Dm644 -t "$pkgdir"/usr/share/java/"$_pkgname"/natives/linux/ natives/linux/*
	# TODO: See if we can depend on other packages that provide our native dependencies.
}
