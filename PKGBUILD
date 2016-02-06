# Maintainer: drgn <ttemplate223 at gmail dot com>
# Pretty much stolen from lemonbar-git

pkgname=lemonbar-sm-git
_pkgname=lemonbar
pkgver=1.0.r157.gf1f885a
pkgrel=1
pkgdesc="Fork of lemonbar, with xft support and the ability to select monitor."
arch=('i686' 'x86_64')
url="https://github.com/osense/bar"
license=('MIT')
depends=('libxcb' 'libxft')
makedepends=('git')
provides=('lemonbar')
conflicts=('lemonbar-xft-git' 'lemonbar-git' 'lemonbar-ucs4-git')
source=("$_pkgname::git+https://github.com/osense/bar.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"

        if git_version=$( git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/; s/-/./g' 2>/dev/null ); then
            IFS='-' read last_tag tag_rev commit <<< "$git_version"
            printf '%s.r%s.%s' "$last_tag" "$tag_rev" "$commit"
        else
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
        fi
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

