# Maintainer: James An <james@jamesan.ca>

_pkgname=webui-aria2
pkgname="$_pkgname-git"
pkgver=r305.091fbb0
pkgrel=2
pkgdesc="Pure HTML/CSS/JS frontend for aria2"
arch=('any')
url="https://github.com/ziahamza/webui-aria2"
license=('MIT')
depends=('aria2')
optdepends=(
    'chromium: browser to access front end'
    'epiphany: browser to access front end'
    'firefox: browser to access front end'
    'google-chrome: browser to access front end'
    'midori: browser to access front end'
    'netsurf: browser to access front end'
    'opera: browser to access front end'
    'rekonq: browser to access front end'
    'xdg-utils: launch main webui-aria2 web page.'
)
makedepends=('git')
changelog=ChangeLog
source=(
    "$pkgname"::"git+https://github.com/ziahamza/$_pkgname.git"
    aria2d.service
    $_pkgname
    ChangeLog
)
md5sums=('SKIP'
         'e66a1b86f501ae22b41ab69d97a0c4ee'
         'da1de4952903892fc0f0b00df1aebb5c'
         '8a11be6666d3fb7fb830b1982a95cbdb')

pkgver() {
    cd "$pkgname"
    (
        set -o pipefail
        git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    rm -rf "$pkgname/.git"
}

package() {
    # install package files
    install -dm755 "$pkgdir/usr/share"
    cp -R "$pkgname" "$pkgdir/usr/share/$_pkgname"
    rm -rf "$pkgdir/usr/bin/$_pkgname/.gitignore"
    rm -rf "$pkgdir/usr/bin/$_pkgname/screenshots"
    find "$pkgdir/usr/share/" -type f -exec chmod 0644 {} +
    find "$pkgdir/usr/share/" -type d -exec chmod 0755 {} +

    # install aria2 systemd service
    install -Dm644 aria2d.service "$pkgdir/usr/lib/systemd/user/aria2d.service"

    # install package /usr/bin start file
    install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}

# Make systemd service file to start aria2c.
# Make bash script to start webui-aria2 index.html page.
# https://github.com/ziahamza/webui-aria2
# https://wiki.archlinux.org/index.php/aria2#Web_UIs
