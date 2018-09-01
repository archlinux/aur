# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Jacob Mischka <jacob@mischka.me>

pkgname=brave-bin
pkgver=0.23.105
pkgrel=1
pkgdesc='A web browser that stops ads and trackers by default. Binary release.'
arch=('x86_64')
url='https://www.brave.com'
license=('custom:several')
depends=('gtk3' 'gconf' 'nss' 'alsa-lib' 'libxss' 'libgnome-keyring' 'ttf-font')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support')
provides=("${pkgname%-bin}" 'brave-browser')
conflicts=("${pkgname%-bin}")
source=("$pkgname-$pkgver.tar.bz2::https://github.com/brave/browser-laptop/releases/download/v${pkgver}dev/brave.tar.bz2"
        'MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt'
        "$pkgname.desktop")
options=(!strip)
sha512sums=('a2063278b2c1f9a50571caf6a3a7b550daff7c52803402680790cbce571a9a8fca95de58ed1579b920582b7cbd4dcd453a0dd8c645506bd773b28fbeb9ced7e2'
            'b8823586fead21247c8208bd842fb5cd32d4cb3ca2a02339ce2baf2c9cb938dfcb8eb7b24c95225ae625cd0ee59fbbd8293393f3ed1a4b45d13ba3f9f62a791f'
            '400d345271a3c98be668e4aa08743d707647c92ee35951e937238ac07074119cfdb9601e1934cdf46014bd181b26ab0b568e4cab67c790efe53d029d8b0f9c55')

_bdir=brave-linux-x64

build() {
	if [[ ! (-r /proc/sys/kernel/unprivileged_userns_clone && $(< /proc/sys/kernel/unprivileged_userns_clone) == 1 && -n $(zcat /proc/config.gz | grep CONFIG_USER_NS=y) ) ]]; then
		echo "User namespaces are not detected as enabled on your system, brave will run with the sandbox disabled"
	fi
}

package() {
    install -d -m0755 "$pkgdir/usr/lib"
    cp -a --reflink=auto "$_bdir" "$pkgdir/usr/lib/$pkgname"

    _launcher="$pkgdir/usr/bin/brave"
    install -Dm0755 /dev/stdin "$_launcher"<<END
#!/usr/bin/sh

FLAG="--no-sandbox"

if [[ -r /proc/sys/kernel/unprivileged_userns_clone && \$(< /proc/sys/kernel/unprivileged_userns_clone) == 1 && -n \$(zcat /proc/config.gz | grep CONFIG_USER_NS=y) ]]; then
	FLAG=""
fi

exec "/usr/lib/${pkgname}/brave" "\$FLAG" -- "\$@"
END

    install -Dm0644 -t "$pkgdir/usr/share/applications" "$pkgname.desktop"
    install -Dm0644 "$_bdir/resources/extensions/brave/img/braveAbout.png" "$pkgdir/usr/share/pixmaps/brave.png"
    install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname" "MPL2"
    mv "$pkgdir/usr/lib/$pkgname/"{LICENSE,LICENSES.chromium.html} "$pkgdir/usr/share/licenses/$pkgname"

    ln -s /usr/lib/PepperFlash "$pkgdir/usr/lib/pepperflashplugin-nonfree"
}
