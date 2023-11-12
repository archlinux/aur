# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Duy Truong <jimreynold2nd@yahoo.com>

pkgname=ubports-installer
pkgver=0.10.0
pkgrel=1
pkgdesc='A simple tool to install Ubuntu Touch on UBports devices'
arch=('x86_64' 'i686')
url='https://github.com/ubports/ubports-installer'
license=('GPL3')
depends=('android-tools' 'android-udev' 'electron' 'e2fsprogs' 'heimdall' 'p7zip')
makedepends=('npm' 'nodejs' 'electron')
options=('!strip' '!emptydirs')
conflicts=('ubports-installer-git' 'ubports-installer-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ubports/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9962c0e44c28c13e5e77b16804514721009e899b035615edbf404a9bf1a08259')

_srcdir="$pkgname-$pkgver"

prepare() {
	cd "$_srcdir"
	
	npm ci
}

build() {
	cd "$_srcdir"
	
	npm run build
	./node_modules/.bin/electron-builder --linux --x64 --dir -c.electronDist=/usr/lib/electron -c.electronVersion="$(cat /usr/lib/electron/version)"
}

package() {
	cd "$_srcdir"
	
	find ./dist/linux-unpacked/resources/app.asar.unpacked -type d \( -name linux -o -name mac -o -name win32 -o -name darwin \) -print -exec rm -rf {} + &>/dev/null
	install -dm755 "$pkgdir/usr/share/${pkgname}"
	cp -rt "$pkgdir/usr/share/${pkgname}" dist/linux-unpacked/*
	
	cd build/icons
	for i in *x*.png; do
		install -Dm644 "$i" "$pkgdir/usr/share/icons/hicolor/${i%.png}/apps/ubports-installer.png"
	done
	
	install -Dm755 <(cat << EOF
#!/usr/bin/env sh
USE_SYSTEM_7ZA=true USE_SYSTEM_TOOLS=1 electron /usr/share/${pkgname}/resources/app.asar "\$@"
EOF
	) "${pkgdir}/usr/bin/${pkgname}"
	
	install -Dm644 <(cat << EOF
[Desktop Entry]
Name=UBports Installer
Comment=UBports Installer
Exec=${pkgname} %U
Terminal=false
Type=Application
Icon=${pkgname}
Categories=System
EOF
	) "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
