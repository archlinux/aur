# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=cavalier
pkgver=2023.9.0
pkgrel=1
pkgdesc='Audio visualizer based on CAVA'
arch=(any)
url=https://github.com/NickvisionApps/$pkgname
license=(MIT)
depends=(cava 'dotnet-runtime>=7' libadwaita iniparser fftw)
makedepends=(blueprint-compiler 'dotnet-sdk>=7' git)
source=("git+$url" "git+${url%cavalier}cakescripts#commit=c7e3bbbb807bdade8c89e5a3ad057b00fac2102e")
b2sums=('SKIP'
        'SKIP')

prepare() {
	rm -rf cavalier/CakeScripts
	mv cakescripts cavalier/CakeScripts
	cd $pkgname
	dotnet tool restore
}

build() {
        cd $pkgname
        dotnet cake --target=Publish --prefix=/usr --ui=gnome
}

package() {
        cd $pkgname
        dotnet cake --target=Install --destdir="$pkgdir"
        ln -sv org.nickvision.cavalier "$pkgdir"/usr/bin/cavalier
        install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
