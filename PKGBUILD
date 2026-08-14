pkgname="mypitch-git"
pkgrel=1
pkgver=1.0.r5.g6ffc42c
pkgdesc="Simple functional ear trainer"
arch=("x86_64")
makedepends=("dotnet-sdk")
depends=("fluidsynth")
source=("git+https://github.com/saverinonrails/MyPitch")
sha256sums=("SKIP")
options=('!debug')

build() {
	cd $srcdir/MyPitch/MyPitch.Desktop
	dotnet publish --output dist
}

package() {
	cd $srcdir/MyPitch/MyPitch.Desktop/dist
	rm MyPitch.Desktop.dbg && rm MyPitch.pdb
	install -d -m 755 $pkgdir/usr/bin
    echo -e "#!/bin/bash\n exec /usr/lib/MyPitch/MyPitch.Desktop \"\$@\"" > $pkgdir/usr/bin/MyPitch
	chmod +x $pkgdir/usr/bin/MyPitch
    install -d -m 755 $pkgdir/usr/lib/MyPitch && cp -r * $pkgdir/usr/lib/MyPitch
    cd $srcdir 
	cat > mypitch.desktop <<EOF
[Desktop Entry]
Name=MyPitch.Desktop
Comment=Simple Functional Ear Trainer
Exec=MyPitch
Icon=mypitch
Terminal=false
Type=Application
GenericName=MyPitch
Keywords=Music;Ear Training;
EOF
	install -d -m 755 $pkgdir/usr/share/applications && cp mypitch.desktop $pkgdir/usr/share/applications
	cd "$srcdir/MyPitch/MyPitch.AppImg"
	install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	install -m644 mypitch.svg \
	    "$pkgdir/usr/share/icons/hicolor/scalable/apps/mypitch.svg"
}
  

pkgver() {
    cd "$srcdir/MyPitch"
	git describe --long --tags --abbrev=7 2>/dev/null \
	    | sed 's/^v//; s/\(.*\)-\([0-9]*\)-g/\1.r\2.g/; s/-//g' \
	    || printf "r%s.g%s\n" \
	        "$(git rev-list --count HEAD)" \
	        "$(git rev-parse --short=7 HEAD)"
}
