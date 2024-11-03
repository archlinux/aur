# Maintainer: Louna Bartel <lou@bartel.org>
pkgname=celeste-studio-git
pkgver=v3.41.6.r1.g6220e22
pkgrel=1
pkgdesc="A TAS editor for the video game Celeste. (source release)"
arch=(x86_64)
url="https://github.com/EverestAPI/CelesteTAS-EverestInterop"
license=('MIT')
makedepends=(dotnet-sdk git zlib hicolor-icon-theme gcc-libs glibc)
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}::git+${url}.git"
	"git+https://github.com/SomeoneSom/Featherline_StudioV3.git"
	"CelesteStudio.desktop")
sha256sums=('SKIP'
            'SKIP'
            'bb45423bbc74d8718bb5cfeb8b745c94b201bf64a51bcb0bfd601e131543b670')
prepare() {
  cd ${pkgname}-${pkgver}
  git submodule init
  git config submodule.libs/Featherline_StudioV3.url "$srcdir/external"
  git -c protocol.file.allow=always submodule update
}
pkgver() {
	cd ${pkgname}-${pkgver}
	git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
	cd "${pkgname}-${pkgver}/Studio/CelesteStudio.GTK"
	dotnet publish -r linux-x64 -p:PublishSingleFile=true
}
package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	mkdir -p "$pkgdir/usr/bin/"
	install -Dm755 "$srcdir/${pkgname}-${pkgver}/Studio/CelesteStudio.GTK/bin/Debug/net7.0/linux-x64/publish/CelesteStudio.GTK" "$pkgdir/usr/bin/CelesteStudio"
	install -Dm644 "$srcdir/${pkgname}-${pkgver}/Studio/CelesteStudio/Assets/Icon.ico" "$pkgdir/usr/share/icons/hicolor/256x256/apps/CelesteStudio.ico"
	install -Dm644 "$srcdir/CelesteStudio.desktop" "$pkgdir/usr/share/applications/CelesteStudio.desktop"
	install -Dm644 "$srcdir/${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
