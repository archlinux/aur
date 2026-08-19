# Maintainer: Zynix <crossmacro@zynix.net>
pkgname=crossmacro-git
pkgver=1.3.1.r177.gb19b845
pkgrel=1
pkgdesc="Development snapshot of CrossMacro mouse and keyboard macro automation"
arch=('x86_64' 'aarch64')
url="https://github.com/alper-han/CrossMacro"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'zlib' 'openssl' 'fontconfig' 'libx11' 'libxcursor' 'libxrandr' 'polkit' 'libxtst' 'shadow' 'systemd' 'systemd-libs' 'libxkbcommon' 'icu')
makedepends=('dotnet-sdk>=10.0' 'clang' 'zlib' 'git')
conflicts=('crossmacro')
provides=('crossmacro')
options=('!strip')
source=("crossmacro::git+https://github.com/alper-han/CrossMacro.git#commit=b19b845e8f05203955dbdbbdf8881d4668d887cd"
        "crossmacro.sysusers"
        "crossmacro-modules.conf")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
install=crossmacro.install

pkgver() {
    cd "$srcdir/crossmacro"
    (
        set -o pipefail
        git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    ) || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd crossmacro
    local target_rid
    local source_revision
    case "${CARCH}" in
        x86_64)
            target_rid="linux-x64"
            ;;
        aarch64)
            target_rid="linux-arm64"
            ;;
        *)
            echo "Unsupported architecture: ${CARCH}" >&2
            return 1
            ;;
    esac

    source_revision="$(git rev-parse --verify HEAD)"
    export DOTNET_SKIP_WORKLOAD_INTEGRITY_CHECK=1
    dotnet restore -r "$target_rid"

    dotnet publish src/CrossMacro.UI.Linux/CrossMacro.UI.Linux.csproj \
        -c Release \
        -r "$target_rid" \
        -p:CrossMacroPublishProfile=native-aot \
        -p:CrossMacroSourceRevision="$source_revision" \
        -o publish/

    dotnet publish src/CrossMacro.Daemon/CrossMacro.Daemon.csproj \
        -c Release \
        -r "$target_rid" \
        -p:CrossMacroPublishProfile=native-aot \
        -p:CrossMacroSourceRevision="$source_revision" \
        -o publish-daemon/
}

package() {
    cd crossmacro

    install -dm755 "$pkgdir/usr/lib/crossmacro"
    cp -r publish/* "$pkgdir/usr/lib/crossmacro/"

    install -dm755 "$pkgdir/usr/lib/crossmacro/daemon"
    cp -r publish-daemon/* "$pkgdir/usr/lib/crossmacro/daemon/"

    chmod +x "$pkgdir/usr/lib/crossmacro/CrossMacro.UI"
    chmod +x "$pkgdir/usr/lib/crossmacro/daemon/CrossMacro.Daemon"

    install -Dm644 "scripts/daemon/crossmacro.service" \
        "$pkgdir/usr/lib/systemd/system/crossmacro.service"
    install -Dm644 "$srcdir/crossmacro.sysusers" \
        "$pkgdir/usr/lib/sysusers.d/crossmacro.conf"
    install -Dm644 "$srcdir/crossmacro-modules.conf" \
        "$pkgdir/usr/lib/modules-load.d/crossmacro.conf"
    install -Dm644 "scripts/assets/99-crossmacro.rules" \
        "$pkgdir/usr/lib/udev/rules.d/99-crossmacro.rules"
    install -Dm644 "scripts/assets/io.github.alper_han.crossmacro.policy" \
        "$pkgdir/usr/share/polkit-1/actions/io.github.alper_han.crossmacro.policy"
    install -dm755 "$pkgdir/usr/share/polkit-1/rules.d"
    install -Dm644 "scripts/assets/50-crossmacro.rules" \
        "$pkgdir/usr/share/polkit-1/rules.d/50-crossmacro.rules"

    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/lib/crossmacro/CrossMacro.UI" "$pkgdir/usr/bin/crossmacro"

    install -dm755 "$pkgdir/usr/share/icons/hicolor"
    cp -r "src/CrossMacro.UI/Assets/icons/"* "$pkgdir/usr/share/icons/hicolor/"

    install -Dm644 "scripts/assets/CrossMacro.desktop" \
        "$pkgdir/usr/share/applications/CrossMacro.desktop"
    sed -i 's|Exec=crossmacro|Exec=/usr/lib/crossmacro/CrossMacro.UI|g' \
        "$pkgdir/usr/share/applications/CrossMacro.desktop"

    install -Dm644 "docs/man/crossmacro.1" \
        "$pkgdir/usr/share/man/man1/crossmacro.1"
    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/crossmacro/LICENSE"
}
