# Maintainer: Astrozen

pkgname=hslink-upper-git
pkgver=0.1.0.r7.gd6dc66e
pkgrel=1
pkgdesc="Host utility for HSLink"
arch=('x86_64')
url="https://github.com/HSLink/HSLinkUpper"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('gtk3' 'webkit2gtk-4.1' 'hicolor-icon-theme' 'gcc-libs' 'cairo' 'pango' 'gdk-pixbuf2' 'glibc' 'libsoup3' 'systemd-libs' 'glib2')
makedepends=('git' 'nodejs' 'pnpm' 'rust')

source=("${pkgname%-git}.git::git+${url}.git")

sha512sums=('SKIP')

pkgver(){
    cd $srcdir/${pkgname%-git}.git
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build(){
    cd $srcdir/${pkgname%-git}.git

    export CARGO_HOME="${srcdir}/.cargo"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo 'link-workspace-packages=true'
        echo 'fetch-retry-maxtimeout=10000'
        echo "cache-dir="${srcdir}"/.pnpm_cache"
        echo "store-dir="${srcdir}"/.pnpm_store"
        echo "shamefully-hoist=true"
        echo "virtual-store-dir-max-length=80"
    } >> .npmrc

    NODE_ENV=development    pnpm install --force
    NODE_ENV=production     pnpm tauri build -b deb
}

package() {
    cd $srcdir/${pkgname%-git}.git
    tar xpf src-tauri/target/release/bundle/deb/hslinkupper_${pkgver%%.r*}_amd64/data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

