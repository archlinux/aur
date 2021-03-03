# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=kora-icon-theme
pkgver=1.4.2
pkgrel=1
pkgdesc="SVG icon theme suitable for every desktop environment (dark and light versions, HiDPI support)"
arch=("any")
url="https://github.com/bikass/kora"
license=("GPL3")
depends=("gtk-update-icon-cache")
provides=("kora-icon-theme" "korla-icon-theme")
conflicts=("kora-icon-theme" "korla-icon-theme")
replaces=("korla-icon-theme")
optdepends=(
    "hicolor-icon-theme: fallback Freedesktop.org Hicolor icon theme"
    "breeze-icons: fallback Breeze icon theme for Plasma Desktop"
    "adwaita-icon-theme: fallback Adwaita icon theme for Gnome Desktop")
install="$pkgname.install"
source=("https://github.com/bikass/kora/archive/v$pkgver.tar.gz")
sha256sums=("31ebec5a82c32ac05e301b51651164c511cde5f0d250a9f91d63494f0cf2fe50")

_iconpath=usr/share/icons
_iconcache=icon-theme.cache
_iconnewcachescript=create-new-icon-theme.cache.sh

package() {
    cd "$srcdir/kora-$pkgver"
    
    # Delete useless files from source folder
    rm -f "kora/$_iconnewcachescript"
    rm -f "kora/$_iconcache"
    rm -f "kora-light/$_iconnewcachescript"
    rm -f "kora-light/$_iconcache"
    rm -f "kora-light-panel/$_iconnewcachescript"
    rm -f "kora-light-panel/$_iconcache"
    rm -f "kora-pgrey/$_iconnewcachescript"
    rm -f "kora-pgrey/$_iconcache"

    install -dm755 "$pkgdir/$_iconpath"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    
    # The following --no-preserve=mode option is necessary since the creator works with 
    # the theme locally and he messed with modes in the past making some icons unreadable 
    # and some directories not executable if installed system wide while he didn't notice 
    # any issue because he installed the theme under the local icon folder on his system.
    cp -dr --no-preserve=mode "kora" "$pkgdir/$_iconpath/kora"
    cp -dr --no-preserve=mode "kora-light" "$pkgdir/$_iconpath/kora-light"
    cp -dr --no-preserve=mode "kora-light-panel" "$pkgdir/$_iconpath/kora-light-panel"
    cp -dr --no-preserve=mode "kora-pgrey" "$pkgdir/$_iconpath/kora-pgrey"
    
    # Create empty icon cache files, they will be filled during post_install and
    # post_upgrade scripts
    touch -a "$pkgdir/$_iconpath/kora/$_iconcache"
    touch -a "$pkgdir/$_iconpath/kora-light/$_iconcache"
    touch -a "$pkgdir/$_iconpath/kora-light-panel/$_iconcache"
    touch -a "$pkgdir/$_iconpath/kora-pgrey/$_iconcache"
    
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
