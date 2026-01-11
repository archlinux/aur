# Maintainer: Astrozen <archlinux[AT]wirano.me>

_app_name=HSLinkNexus
_name=hslinknexus
pkgname=hslink-nexus-git
pkgver=1.2.3.r5.gb34c6b2
pkgrel=1
pkgdesc="HSLink Nexus is a simple tool that allows you to config HSLink."
arch=($CARCH)
url="https://github.com/HSLink/HSLinkNexus"
license=('Apache-2.0')
provides=("${pkgname%-git}" 'hslinknexus')
conflicts=("${pkgname%-git}" 'hslink-upper' 'hslinkupper')
replaces=('hslink-upper-git')
depends=('gtk3' 'webkit2gtk-4.1' 'hicolor-icon-theme' 'cairo' 'gcc-libs' 'gdk-pixbuf2' 'glibc' 'libsoup3' 'systemd-libs' 'glib2')
makedepends=('git' 'npm' 'pnpm' 'rust')

source=("${pkgname%-git}.git::git+${url}.git")

sha512sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname%-git}.git/src-tauri"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

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

    install -Dvm644 69-hslink.rules -t ${pkgdir}/usr/lib/udev/rules.d/
    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
    install -Dm755 src-tauri/target/release/${_name} ${pkgdir}/usr/bin/${_name}
    install -Dm644 src-tauri/icons/32x32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_name}.png
    install -Dm644 src-tauri/icons/128x128.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_name}.png
    install -Dm644 src-tauri/icons/128x128@2x.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_name}.png
    install -Dvm644 /dev/stdin ${pkgdir}/usr/share/applications/${_name}.desktop <<EOF
[Desktop Entry]
Categories=Utility;Development;
Comment=${pkgdesc}
Exec=${_name}
Icon=${_name}.png
Name=${_app_name}
Terminal=false
Type=Application

EOF
}

