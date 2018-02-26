# Maintainer: Lin Ruoshui <lin.ruohshoei@gmail.com>
# Contributor: hexchain <i at hexchain.org>
pkgname=hmcl
pkgver=2.7.9.55
pkgrel=1
pkgdesc="Hello Minecraft! Launcher, a powerful Minecraft launcher."
arch=(any)
license=('GPL3')
url="https://github.com/mclauncher/HMCL"
makedepends=('unzip')
depends=('java-environment>=8' 'bash' 'hicolor-icon-theme')
noextract=("HMCL-$pkgver.jar")
source=('hmcl-launch-script'
        'hmcl.desktop.in'
        # "$url/releases/download/v${pkgver%.*}/HMCL-$pkgver.jar")
	"HMCL-${pkgver}.jar::https://github.com/LinRs/HMCL/releases/download/v2.7.9/HMCL-${pkgver}.jar"
	#"hmcl::git+$url.git#commit=cbb2a1b5755389b751d24730bc93de1011bed119"
	)

prepare() {
    cd "$srcdir"
    sed "s|@@VERSION@@|$pkgver|" hmcl.desktop.in > hmcl.desktop
    unzip -o "HMCL-$pkgver.jar" org/jackhuang/hmcl/icon.png
}

#build() {
#    cd "$srcdir/hmcl"
#    chmod +x gradlew
#    ./gradlew clean build
#}

package() {
    cd "$srcdir"
    install -D -m755 "${srcdir}/hmcl-launch-script" "${pkgdir}/usr/bin/hmcl"
    install -D -m644 "${srcdir}/HMCL-${pkgver}.jar" "${pkgdir}/usr/share/hmcl/HMCL.jar"
    install -D -m644 "${srcdir}/hmcl.desktop" "${pkgdir}/usr/share/applications/hmcl.desktop"

    # install icon
    cd "$srcdir/org/jackhuang/hmcl"
    #install -Dm644 icon-new.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
     for size in 16 24 32 48 64 72 128 256 512; do
         target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
         mkdir -p $target
         convert icon.png -resize ${size}x${size} "$target/$pkgname.png"
     done
}
sha256sums=('0300218f29af82e9b302a94b37a4c9a92aea26b960bfd1b2e16c0130ac61cfcf'
            '902a51543e6fc45f8f050233dcee493a5125052df14a7e10548edfc48cf4d528'
            'a6c9d4bd3bea1e71c3e84378373f9806c91d8363ff26d290582a03eebb7c4725')
