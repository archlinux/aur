# Maintainer: Yifei Wu <kqwyfg@gmail.com>

pkgname=wizdom.ai
pkgver=3.20.0907
pkgrel=1
pkgdesc="The desktop application for wizdom.ai Library."
arch=('x86_64')
url="https://www.wizdom.ai"
license=('unknown')
depends=()
provides=('wizdom.ai')
options=()
source=("$pkgname-$pkgver.tar::https://app.wizdom.ai/wizdomUpdate?app=wizdom.ai.installer.v3.nix.64")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/$pkgname"
    echo $(sed "s/,/\n/g" package.nw/package.json | grep "\"version\"" | cut -d ":" -f 2 | cut -d "\"" -f 2)
}

package() {
    # install icons
    install -dm755 "$pkgdir/usr/share/icons"
    cp -dpr --no-preserve=ownership "wizdom.ai/package.nw/icon_app_win.png" "$pkgdir/usr/share/icons/wizdom.ai.png"

    # add icon to the .desktop file
    cp "wizdom.ai/wizdom.ai.desktop" "wizdom.ai/wizdom.ai.desktop.new.1"
    echo "Icon=wizdom.ai" >> "wizdom.ai/wizdom.ai.desktop.new.1"

    # fix "Exec=" in the .desktop file
    sed "s/Exec=.*/Exec=bash -c '\/opt\/wizdom.ai\/wizdom.ai' dummy %k/g" "wizdom.ai/wizdom.ai.desktop.new.1" > "wizdom.ai/wizdom.ai.desktop.new.2"

    # fix "NoDisplay" in the .desktop file
    grep -v "NoDisplay" "wizdom.ai/wizdom.ai.desktop.new.2" > "wizdom.ai/wizdom.ai.desktop.new.3"

    # install .desktop file and remove the temporary .desktop files
    install -Dm644 "wizdom.ai/wizdom.ai.desktop.new.3" "$pkgdir/usr/share/applications/wizdom.ai.desktop"
    rm "wizdom.ai/wizdom.ai.desktop.new.1" "wizdom.ai/wizdom.ai.desktop.new.2" "wizdom.ai/wizdom.ai.desktop.new.3"

    # install all the files to /opt
    install -dm755 "$pkgdir/opt"
    cp -dpr --no-preserve=ownership "wizdom.ai" "$pkgdir/opt"
}
