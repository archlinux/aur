# Maintainer: Natsuki <299474069+iamanuclearwarhead@users.noreply.github.com>
pkgname=wallpick-git
pkgver=0.1.0
pkgrel=1
pkgdesc="wallpaper picker carousel for wayland, applies through hyprpaper, awww, swww, swaybg, caelestia or a custom command"
arch=('any')
url="https://github.com/iamanuclearwarhead/wallpick"
license=('AGPL-3.0-or-later')
depends=('quickshell' 'qt6-multimedia' 'qt6-declarative' 'imagemagick' 'ffmpeg' 'jq' 'curl' 'python' 'fontconfig' 'file' 'bash' 'util-linux')
optdepends=('matugen: picker colours derived from the wallpaper'
            'wl-clipboard: copy from the search box'
            'python-pillow: faster colour indexing'
            'hyprpaper: wallpaper daemon for hyprland'
            'awww: animated wallpaper daemon'
            'swaybg: minimal wallpaper daemon')
makedepends=('git')
provides=('wallpick')
conflicts=('wallpick')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$pkgname"
    install -d "$pkgdir/usr/share/wallpick"
    cp -r bin scripts qs assets VERSION "$pkgdir/usr/share/wallpick/"
    chmod 755 "$pkgdir"/usr/share/wallpick/bin/wallpick "$pkgdir"/usr/share/wallpick/scripts/*.sh "$pkgdir"/usr/share/wallpick/scripts/*.py
    install -d "$pkgdir/usr/bin"
    printf '#!/bin/sh\nexport WALLPICK_DIR=/usr/share/wallpick\nexec /usr/share/wallpick/bin/wallpick "$@"\n' > "$pkgdir/usr/bin/wallpick"
    chmod 755 "$pkgdir/usr/bin/wallpick"
    install -Dm644 completions/wallpick.fish "$pkgdir/usr/share/fish/vendor_completions.d/wallpick.fish"
    install -Dm644 completions/wallpick.bash "$pkgdir/usr/share/bash-completion/completions/wallpick"
    install -Dm644 completions/_wallpick "$pkgdir/usr/share/zsh/site-functions/_wallpick"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
