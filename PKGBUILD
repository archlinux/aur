# Maintainer: Johan Förberg <johan@forberg.se>

pkgname=softmaker-freeoffice
pkgver=2021.1064
_pkgver="${pkgver/./-}"
_pkgver_major="${pkgver%%.*}"
pkgrel=1
pkgdesc="An alternative to Microsoft Office for personal and business use"
arch=(x86_64)
url="https://www.freeoffice.com/"
license=(custom)
depends=(curl libglvnd libx11 libxext libxmu libxrandr libxrender)
makedepends=(gettext)
source=(
    "https://www.softmaker.net/down/$pkgname-$_pkgver-amd64.tgz"
    template.sh
    template.desktop
    LICENSE
)
md5sums=(
    cc4ab29ebba0b1cf23e01c604be25f88
    SKIP
    SKIP
    SKIP
)

package() {
	cd "$srcdir"

        # Install application
        mkdir -p "$pkgdir/opt/$pkgname"
        tar xf "freeoffice${_pkgver_major}.tar.lzma" -C "$pkgdir/opt/$pkgname" --no-same-owner

        # Install launcher scripts and desktop files
        mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
        for exe in planmaker textmaker presentations; do
            app_dir="/opt/$pkgname" exe="$exe" envsubst <template.sh >"$pkgdir/usr/bin/$exe"
            chmod +x "$pkgdir/usr/bin/$exe"

            app_name="Freeoffice ${exe^}" exe="$exe" envsubst <template.desktop \
                >"$pkgdir/usr/share/applications/$exe.desktop"
        done

        # Install icons
        for size in 16 24 32 48 64 96 128 256 512; do
            d="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"

            mkdir -p "$d"

            ln -sf "/opt/$pkgname/icons/pml_$size.png" "$d/planmaker.png"
            ln -sf "/opt/$pkgname/icons/prl_$size.png" "$d/presentations.png"
            ln -sf "/opt/$pkgname/icons/tml_$size.png" "$d/textmaker.png"
        done

        # Install licence
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
