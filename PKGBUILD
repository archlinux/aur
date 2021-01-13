# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=kora-icon-theme
pkgver=1.4.0
pkgrel=2
pkgdesc="SVG icon theme suitable for every desktop environment (dark and light versions, HiDPI support)"
arch=("any")
url="https://github.com/bikass/kora"
license=("GPL3")
depends=("gtk-update-icon-cache")
provides=("kora-icon-theme")
conflicts=("kora-icon-theme" "korla-icon-theme")
replaces=("korla-icon-theme")
optdepends=(
    "hicolor-icon-theme: fallback Freedesktop.org Hicolor icon theme"
    "breeze-icons: fallback Breeze icon theme for Plasma Desktop"
    "adwaita-icon-theme: fallback Adwaita icon theme for Gnome Desktop")
install="$pkgname.install"
source=("https://github.com/bikass/kora/archive/v$pkgver.tar.gz" "fix-index.patch::https://github.com/bikass/kora/commit/eddfba54ab7003b2855eb235f9093cf725bf0cb0.patch")
sha256sums=("94f4c568c0f59eafa4a0d8a63ab5675bcb19fd121dda0add145037b83553e16c" "c28b6ddf749e361b7b8c27ad7bcbe82e5b8b9b649594a9fb4dcdb7f3ab82d63b")

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

    # Fix index
    patch -p1 < "$srcdir/fix-index.patch"

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
