# Maintainer: Elijah Bansley <elijahbansley@gmail.com>
pkgname=funkin-git
pkgver=v0.2.4.r13.gbe5d769
pkgrel=1
pkgdesc="Build Friday Night Funkin from it's repository and install it with shortcuts."
arch=('x86_64')
url="https://github.com/ninjamuffin99/Funkin"
license=('unknown')
depends=()
makedepends=('git' 'haxe' 'wget')
provides=('funkin')
conflicts=('funkin')
source=("$pkgname"::"git://github.com/ninjamuffin99/Funkin.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
	git submodule update --init
}

build() {
	cd "$srcdir/$pkgname"
	mkdir -p ~/haxelib
	haxelib setup ~/haxelib
    haxelib install lime
    haxelib install openfl
    haxelib install flixel
    haxelib run lime setup flixel
    haxelib run lime setup <<EOF
y
EOF
    haxelib install flixel-tools
    haxelib run flixel-tools setup <<EOF
y
4
EOF
    haxelib update flixel
    haxelib update flixel-addons
    wget -O newgrounds.zip https://codeload.github.com/Geokureli/Newgrounds/zip/master
    haxelib install newgrounds.zip
	lime build linux -final
}

check() {
	cd "$srcdir/$pkgname"
	#make -k check
}

package() {
	cd "$srcdir/$pkgname"
	
	install -dm755 "$pkgdir/usr/share/funkin"
	cp -R $srcdir/$pkgname/export/release/linux/bin/* "$pkgdir/usr/share/funkin/"
	
	cat <<EOF > $srcdir/$pkgname/funkin.sh
#!/bin/bash
pushd /usr/share/funkin > /dev/null
./Funkin
popd > /dev/null
EOF
	
	install -D $srcdir/$pkgname/funkin.sh $pkgdir/usr/bin/funkin
	
	cat <<EOF > $srcdir/$pkgname/funkin.desktop
[Desktop Entry]
Version=1.0
Name=Friday Night Funkin
GenericName=Rhythm Game
Comment="PRETTY DOPE ASS GAME" PLAYSTATION MAGAZINE MAY 2003 ISSUE
Type=Application
Terminal=false
Exec=funkin
Icon=funkin
Categories=Game
Keywords=game;funkin;friday;fridaynight;night;
EOF

	install -D $srcdir/$pkgname/art/icon.png $pkgdir/usr/share/pixmaps/funkin.png
    install -D $srcdir/$pkgname/funkin.desktop $pkgdir/usr/share/applications/funkin.desktop
}
