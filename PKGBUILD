# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

_gitname=kora
_author=bikass
pkgname="korla-icon-theme-git"
pkgver=r580.e774871
pkgrel=1
pkgdesc="Kora is an SVG icon theme with lots of new icons and other ones based on Papirus."
arch=("any")
url="https://github.com/${_author}/${_gitname}"
license=("GPL3")
depends=("gtk-update-icon-cache")
optdepends=(
    "hicolor-icon-theme: fallback Freedesktop.org Hicolor icon theme"
    "breeze-icons: fallback Breeze icon theme for Plasma Desktop"
    "gnome-icon-theme: fallback Gnome icon theme for Gnome Desktop")
makedepends=("git")
provides=("korla-icon-theme" "korla-icon-theme-git" "${_gitname}-icon-theme" "${_gitname}-icon-theme-git")
conflicts=("korla-icon-theme" "${_gitname}-icon-theme")
install="$pkgname.install"
source=("git+${url}.git")
md5sums=("SKIP")

_iconpath=usr/share/icons
_iconcache=icon-theme.cache
_iconnewcachescript=create-new-icon-theme.cache.sh

pkgver(){
    cd "${_gitname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "${srcdir}/${_gitname}"
    
    # Delete useless files from source folder
    rm -f "${_gitname}/$_iconnewcachescript"
    rm -f "${_gitname}/$_iconcache"
    rm -f "${_gitname}-light/$_iconnewcachescript"
    rm -f "${_gitname}-light/$_iconcache"
    rm -f "${_gitname}-light-panel/$_iconnewcachescript"
    rm -f "${_gitname}-light-panel/$_iconcache"
    rm -f "${_gitname}-pgrey/$_iconnewcachescript"
    rm -f "${_gitname}-pgrey/$_iconcache"

    install -dm755 "$pkgdir/$_iconpath"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    
    # The following --no-preserve=mode option is necessary since the creator works with 
    # the theme locally and he messed with modes in the past making some icons unreadable 
    # and some directories not executable if installed system wide while he didn't notice 
    # any issue because he installed the theme under the local icon folder on his system.
    cp -dr --no-preserve=mode "${_gitname}" "$pkgdir/$_iconpath/${_gitname}"
    cp -dr --no-preserve=mode "${_gitname}-light" "$pkgdir/$_iconpath/${_gitname}-light"
    cp -dr --no-preserve=mode "${_gitname}-light-panel" "$pkgdir/$_iconpath/${_gitname}-light-panel"
    cp -dr --no-preserve=mode "${_gitname}-pgrey" "$pkgdir/$_iconpath/${_gitname}-pgrey"
    
    # Create empty icon cache files, they will be filled during post_install and
    # post_upgrade scripts
    touch -a "$pkgdir/$_iconpath/${_gitname}/$_iconcache"
    touch -a "$pkgdir/$_iconpath/${_gitname}-light/$_iconcache"
    touch -a "$pkgdir/$_iconpath/${_gitname}-light-panel/$_iconcache"
    touch -a "$pkgdir/$_iconpath/${_gitname}-pgrey/$_iconcache"
    
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
