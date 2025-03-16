# Maintainer: fridge <echo dW5sb3ZhYmxlX2ZyaWRnZTM1NkBhbGVlYXMuY29tCg== | base64 -d>
pkgname="gourmand-bin"
pkgver="1.1.0"
pkgrel="1"
pkgdesc="A manager, editor, and organizer for recipes."
url="https://github.com/GourmandRecipeManager/${pkgname%-bin}"
license=("GPL-2.0-only")
source=("${pkgname%-bin}-$pkgver.appimage::$url/releases/download/$pkgver/Gourmand-$pkgver-$CARCH.AppImage" "${pkgname%-bin}.svg")
b2sums=("SKIP" "992209e55c98b849a282415f0936cf85944ff7c8eda8deba4a7181a917401fd158a295dcdffcbbc4553e42b058e7dd4746e5a68deb2b4ae1d56b0357cf7d83ce")
arch=("x86_64")
makedepends=("gendesk" "coreutils" "curl" "jq")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=$pkgver")
options=("!strip")

pkgver()
{
    local info; info="$(curl -sS https://api.github.com/repos/GourmandRecipeManager/${pkgname%-bin}/releases)"
    jq -r '[.[] | select(.tag_name | test("rc") | not)] | first | .tag_name' <<< "$info"
}

build()
{
    gendesk -f -n --categories="Utility" --startupnotify="true" --exec="gourmand -q"
}

package()
{
    install -Dvm755 "${pkgname%-bin}-$pkgver.appimage" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dvm644 "${pkgname%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dvm644 "${pkgname%-bin}.svg" "$pkgdir/usr/share/icons/${pkgname%-bin}.svg"
}
