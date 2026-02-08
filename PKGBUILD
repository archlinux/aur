# Maintainer: Santiago Almeida <santyalmeida@gmail.com>
pkgname=you-tui
pkgver=0.1.0
pkgrel=1
pkgdesc="YouTube Terminal Music Player with daemon/client architecture"
arch=('x86_64')
url="https://github.com/santiagoalmeida/you-tui"
license=('custom')
depends=('mpv' 'yt-dlp' 'fzf' 'socat')
makedepends=('dotnet-sdk>=10.0')
install=you-tui.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dfd9020bd60c2d8ef1ab10bcf9eae22e545c8baf521d6829ada26d7991168279')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Restore dependencies
    dotnet restore
    
    # Publish daemon self-contained
    dotnet publish YouTui.Daemon/YouTui.Daemon.csproj \
        -c Release \
        -r linux-x64 \
        --self-contained true \
        -p:PublishSingleFile=false \
        -p:PublishTrimmed=false \
        -o build/daemon
    
    # Publish client self-contained
    dotnet publish YouTui.Client/YouTui.Client.csproj \
        -c Release \
        -r linux-x64 \
        --self-contained true \
        -p:PublishSingleFile=false \
        -p:PublishTrimmed=false \
        -o build/client
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install daemon binary and runtime files
    install -Dm755 build/daemon/you-tui-daemon "$pkgdir/usr/lib/$pkgname/you-tui-daemon"
    
    # Copy daemon runtime libraries
    for file in build/daemon/*.{dll,so,json}; do
        [ -f "$file" ] && install -Dm644 "$file" "$pkgdir/usr/lib/$pkgname/$(basename "$file")"
    done
    
    # Install client binary and runtime files
    install -Dm755 build/client/you-tui "$pkgdir/usr/lib/$pkgname/you-tui"
    
    # Copy client runtime libraries
    for file in build/client/*.{dll,so,json}; do
        [ -f "$file" ] && install -Dm644 "$file" "$pkgdir/usr/lib/$pkgname/$(basename "$file")"
    done
    
    # Create wrapper scripts in /usr/bin
    install -d "$pkgdir/usr/bin"
    echo '#!/bin/bash' > "$pkgdir/usr/bin/you-tui-daemon"
    echo 'exec /usr/lib/you-tui/you-tui-daemon "$@"' >> "$pkgdir/usr/bin/you-tui-daemon"
    chmod 755 "$pkgdir/usr/bin/you-tui-daemon"
    
    echo '#!/bin/bash' > "$pkgdir/usr/bin/you-tui"
    echo 'exec /usr/lib/you-tui/you-tui "$@"' >> "$pkgdir/usr/bin/you-tui"
    chmod 755 "$pkgdir/usr/bin/you-tui"
    
    # Install systemd service
    install -Dm644 you-tui-daemon.service \
        "$pkgdir/usr/lib/systemd/user/you-tui-daemon.service"
    
    # Install auxiliary scripts
    install -Dm755 you-tui-status "$pkgdir/usr/bin/you-tui-status"
    
    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
