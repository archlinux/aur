# Maintainer: Firstp1ck <al.leuzi@hotmail.com>
pkgname="hyprland-simple-setup-git"
pkgver=0.4.0.r31.ge82583e
pkgrel=1
pkgdesc="Setup Hyprland the simple way. (Swiss/German Edition)"
arch=('any')
url="https://github.com/Firstp1ck/Hyprland-Simple-Setup.git"
license=('GPL3')
makedepends=('git')
depends=('git' 'sudo'
'bash'
'base-devel'
'xdg-user-dirs')
source=("$pkgname::git+https://github.com/Firstp1ck/Hyprland-Simple-Setup.git")
sha256sums=('SKIP')

pkgver() {
    : "${srcdir:?srcdir is not set}"
    cd "$srcdir/$pkgname" || exit 1

    if git describe --tags --abbrev=0 >/dev/null 2>&1; then
      git describe --tags --long --always \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
      printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

package() {
    : "${pkgdir:?pkgdir is not set}"
    : "${srcdir:?srcdir is not set}"
    cd "$srcdir/$pkgname" || exit 1
    
    # Install all files to /usr/share/$pkgname
    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -a . "$pkgdir/usr/share/$pkgname/"
    
    # Find and install setup.sh
    if [ -f "setup.sh" ]; then
        # If setup.sh is in root directory
        install -Dm755 "setup.sh" "$pkgdir/usr/bin/hyprland-simple-setup-git"
    else
        # Look in subdirectories
        for dir in */; do
            if [ -f "${dir}setup.sh" ]; then
                install -Dm755 "${dir}setup.sh" "$pkgdir/usr/bin/hyprland-simple-setup-git"
                break
            fi
        done
    fi
}

post_install() {
    echo "==> Run 'hyprland-simple-setup-git' to start the Hyprland setup."
}
