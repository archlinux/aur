# Maintainer: Giusy Margarita <kurmikon at libero dot it>

_relver=1.2

pkgname=korla-icon-theme-git
pkgver=$_relver
pkgrel=1
pkgdesc="SVG icon theme suitable for every desktop environment (dark and light versions, HiDPI support, git version)"
arch=("any")
url="https://github.com/bikass/korla"
license=("GPL3")
depends=("gtk-update-icon-cache")
optdepends=(
    "hicolor-icon-theme: fallback Freedesktop.org Hicolor icon theme"
    "breeze-icons: fallback Breeze icon theme for Plasma Desktop"
    "gnome-icon-theme: fallback Gnome icon theme for Gnome Desktop")
makedepends=("git")
provides=("korla-icon-theme")
conflicts=("korla-icon-theme")
install="$pkgname.install"
source=("git+https://github.com/bikass/korla.git")
md5sums=("SKIP")

_iconpath=usr/share/icons
_iconcache=icon-theme.cache
_iconnewcachescript=create-new-icon-theme.cache.sh

pkgver() {
    cd "$srcdir/korla"
    
    # Git, no tags available
    printf "$_relver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/korla"
    
    # Delete useless files from source folder
    rm -f "korla/$_iconnewcachescript"
    rm -f "korla/$_iconcache"
    rm -f "korla-light/$_iconnewcachescript"
    rm -f "korla-light/$_iconcache"
    rm -f "korla-light-panel/$_iconnewcachescript"
    rm -f "korla-light-panel/$_iconcache"
    rm -f "korla-pgrey/$_iconnewcachescript"
    rm -f "korla-pgrey/$_iconcache"

    install -dm755 "$pkgdir/$_iconpath"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    
    # The following --no-preserve=mode option is necessary since the creator works with 
    # the theme locally and he messed with modes in the past making some icons unreadable 
    # and some directories not executable if installed system wide while he didn't notice 
    # any issue because he installed the theme under the local icon folder on his system.
    cp -dr --no-preserve=mode "korla" "$pkgdir/$_iconpath/korla"
    cp -dr --no-preserve=mode "korla-light" "$pkgdir/$_iconpath/korla-light"
    cp -dr --no-preserve=mode "korla-light-panel" "$pkgdir/$_iconpath/korla-light-panel"
    cp -dr --no-preserve=mode "korla-pgrey" "$pkgdir/$_iconpath/korla-pgrey"
    
    # Create empty icon cache files, they will be filled during post_install and
    # post_upgrade scripts
    touch -a "$pkgdir/$_iconpath/korla/$_iconcache"
    touch -a "$pkgdir/$_iconpath/korla-light/$_iconcache"
    touch -a "$pkgdir/$_iconpath/korla-light-panel/$_iconcache"
    touch -a "$pkgdir/$_iconpath/korla-pgrey/$_iconcache"
    
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
