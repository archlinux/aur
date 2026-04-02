# Maintainer: A43 <arirera43 [at] gmail [dot] com>
# Contributor: Aira Hinano <hinanoaira at hinasense dot jp>
# Contributor: kazu0617 <archlinux at kazu0617 dot net>
srcname=VRCX
pkgname=vrcx-git
pkgver=v2021.03.08.r3262.g92ae1c5
pkgrel=1
pkgdesc="Friendship management tool for VRChat (git version built with Electron)"
arch=('x86_64')
url="https://github.com/vrcx-team/VRCX"
license=('MIT')
depends=('dotnet-runtime-9.0' 'electron' 'gtk3' 'nss' 'libxss' 'libxrandr' 'alsa-lib')
makedepends=('dotnet-sdk-9.0' 'git' 'nodejs' 'npm' 'imagemagick')
conflicts=('vrcx-bin' 'vrcx')
provides=('vrcx')
options=(!debug !lto)
source=(
    "git+https://github.com/vrcx-team/VRCX.git"
    "vrcx.desktop"
    "build.patch"
)

sha256sums=('SKIP'
            '3e40d0056adfd86848cf0bc594bf399d9fff1f894d470bad90d2b232d17f95c5'
            'db8f2ca37e76cc81ab15f91005882248cd68b97f59f3c8a5bf54674d190ca5df')

pkgver() {
  cd "$srcname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
            
prepare() {
    cd "$srcdir/VRCX"
    patch -p1 < "$srcdir/build.patch"
    echo "$pkgver" > Version
    echo "" > .no-updater
    # WORKAROUND: Upstream lock file is out of sync.
    # Prefer package.json until it gets fixed upstream.
    # https://github.com/vrcx-team/VRCX/issues/1640
    # npm ci --loglevel=error
	
    npm install --package-lock-only --no-fund
    npm ci --loglevel=error
}

build() {
    cd "$srcdir/$srcname"
    
    dotnet build 'Dotnet/VRCX-Electron.csproj' \
        -p:Configuration=Release \
        -p:Platform=x64 \
        -p:PlatformTarget=x64 \
        -p:RestorePackagesConfig=true \
        -t:"Restore;Clean;Build" \
        -m -r linux-x64
    
    npm run prod-linux --no-fund --loglevel=error
    npm run build-electron --no-fund --loglevel=error
}

package() {
    cd "$srcdir/$srcname"

    install -dm755 "$pkgdir/opt/vrcx"
    cp -r build/linux-unpacked/* "$pkgdir/opt/vrcx/"
    chmod +x "$pkgdir/opt/vrcx/vrcx"
    
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/vrcx/vrcx" "$pkgdir/usr/bin/vrcx"
    
    install -Dm644 "$srcdir/vrcx.desktop" "$pkgdir/usr/share/applications/vrcx.desktop"
    
    # Install icons in multiple sizes
    for size in 16 24 32 64 128 256 512; do
        install -dm755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        magick "images/VRCX.png" -resize "${size}x${size}" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/vrcx.png"
    done

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    for readme in README.*.md; do
        if [ -f "$readme" ]; then
            install -Dm644 "$readme" "$pkgdir/usr/share/doc/$pkgname/$readme"
        fi
    done
}
