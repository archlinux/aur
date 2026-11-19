# Maintainer: LIghtJUNction
pkgname=mihomo-party-ghproxy-git
pkgver=2.0.4.r32.ge837463
pkgrel=1
pkgdesc='Clash Party (formerly Mihomo Party), built from Git with automatic GitHub download route selection'
arch=('x86_64' 'aarch64')
url='https://github.com/mihomo-party-org/clash-party'
license=('GPL-3.0-only')
depends=('alsa-lib' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils'
         'at-spi2-core' 'util-linux-libs' 'libsecret' 'wl-clipboard' 'mesa' 'hicolor-icon-theme')
makedepends=('curl' 'git' 'nodejs>=22.21.0' 'pnpm' 'libxcrypt-compat')
optdepends=('libappindicator-gtk3: tray integration on supported desktops')
provides=('clash-party' 'mihomo-party')
conflicts=('clash-party' 'clash-party-bin' 'clash-party-git' 'clash-party-electron'
           'clash-party-electron-bin' 'mihomo-party' 'mihomo-party-bin'
           'mihomo-party-git' 'mihomo-party-electron' 'mihomo-party-electron-bin')
source=("clash-party::git+$url.git" 'github-route.sh')
sha256sums=('SKIP' '97f09725c13e8f32da43c44c7260e58c676b75067fb6bdb4cb0b87d48c900662')
options=('!strip' '!debug')

# Keep makepkg's canonical VCS URL and cache. Only wrap its remote clone/fetch.
_route_file=$(realpath -- "${BASH_SOURCE[0]%/*}/github-route.sh")
_upstream_git=$url.git
git() {
    if [[ $1 == clone && $2 == --origin=origin && $3 == --mirror && $4 == "$_upstream_git" ]] ||
       [[ $1 == -c && $2 == safe.bareRepository=all && $3 == fetch &&
          $(command git -c safe.bareRepository=all config --get remote.origin.url) == "$_upstream_git" ]]; then
        (
            source "$_route_file"
            _github_git "$@"
        )
    else
        command git "$@"
    fi
}

pkgver() {
    cd "$srcdir/clash-party"
    local version
    if version=$(git describe --tags --match 'v[0-9]*' --long --abbrev=7); then
        sed -E 's/^v//; s/-([0-9]+)-g([0-9a-f]+)$/.r\1.g\2/; s/-/./g' <<< "$version"
    else
        printf 'r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

prepare() {
    cd "$srcdir/clash-party"
    sed -i 's/^productName: Clash Party$/productName: clash-party/' electron-builder.yml
    source "$srcdir/github-route.sh"
    _github_build_env
    pnpm install --frozen-lockfile
}

build() {
    cd "$srcdir/clash-party"
    source "$srcdir/github-route.sh"
    _github_build_env
    pnpm build:linux deb
}

package() {
    cd "$srcdir/clash-party"
    local version deb_arch payload
    version=$(node -p "require('./package.json').version")
    case $CARCH in
        x86_64) deb_arch=amd64 ;;
        aarch64) deb_arch=arm64 ;;
    esac
    local deb="dist/clash-party-linux-${version}-${deb_arch}.deb"
    payload=$(bsdtar -tf "$deb" | sed -n '/^data\.tar\./p')
    (set -o pipefail; bsdtar -xOf "$deb" "$payload" | bsdtar -xf - -C "$pkgdir")
    install -d "$pkgdir/usr/lib" "$pkgdir/usr/bin"
    mv "$pkgdir/opt/clash-party" "$pkgdir/usr/lib/clash-party"
    rmdir "$pkgdir/opt"
    local app_dir="$pkgdir/usr/lib/clash-party"
    rm -f "$app_dir/install.sh"
    # The file-icon executable is a macOS-only helper.
    rm -f "$app_dir/resources/app.asar.unpacked/node_modules/file-icon/file-icon"
    find "$app_dir" \( -type f -o -type d \) -perm /022 -exec chmod go-w {} +
    ln -s ../lib/clash-party/mihomo-party "$pkgdir/usr/bin/clash-party"
    ln -s clash-party "$pkgdir/usr/bin/mihomo-party"
    sed -i -e 's|^Exec=/opt/clash-party/mihomo-party|Exec=clash-party|' \
        -e 's/^Comment=Clash Party$/Comment=Manage Mihomo proxy profiles/' \
        "$pkgdir/usr/share/applications/mihomo-party.desktop"
    chmod 4755 "$app_dir/chrome-sandbox"
}
