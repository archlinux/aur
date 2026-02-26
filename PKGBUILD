# Maintainer: codev911 <codev911@mojosolid.dev>

pkgname=antigravity-deb
pkgver=1.19.5
_x86minor=1772095947
_arm64minor=1772095935
_x86check=c54799e9c89b1ec7c5b6acc14aa95383
_arm64check=47ff166585ab2c83768e2c310d43a420
pkgrel=1
pkgdesc='An agentic development platform from Google, evolving the IDE into the agent-first era.'
arch=(aarch64 x86_64)
url='https://antigravity.google/'
license=(LicenseRef-Google-Antigravity)
_electron=electron39
depends=(bash $_electron libx11 libxkbfile)
makedepends=(jq)
options=(!strip !debug)
source=($pkgname.sh)
source_aarch64=("Antigravity-$pkgver-aarch64.deb::https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/pool/antigravity-debian/antigravity_$pkgver-${_arm64minor}_arm64_${_arm64check}.deb")
source_x86_64=("Antigravity-$pkgver-x86_64.deb::https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/pool/antigravity-debian/antigravity_$pkgver-${_x86minor}_amd64_${_x86check}.deb")
sha256sums=('d3f365e6796836980a1439fb78be5cbfe1e11767fbd98fe695d3a953426d038b')
sha256sums_aarch64=('dde796ce3811e8b9a399d14908eaa6eadcbb85fea5d06284f1dcac0bd6e58bbd')
sha256sums_x86_64=('25487373c7ccb695adb99f45c750655841c4f1d4b657cb7962ec833c42beceed')

prepare() {
    tar -xpf data.tar.xz

    # Find out which major release of electron this version of antigravity requires
    local _electron_major=$(jq --raw-output '.devDependencies.electron' < "usr/share/antigravity/resources/app/package.json" | sed 's/^[~^]\?\([0-9]\+\)\(\.[0-9]\+\)*$/\1/')

    # Check if we depend on the correct electron version
    if [ "$_electron" != "electron$_electron_major" ] ; then
        echo "Error: Incorrect electron version detected. Please change the value of \"_electron\" from \"$_electron\" to \"electron$_electron_major\"."
        return 1
    fi

    # Specify electron version in launcher (lib path stays /usr/lib/antigravity)
    sed -i "s|electron39|$_electron|g" "$srcdir/$pkgname.sh" || {
        echo "Error: Failed to replace electron39 in launcher script"
        return 1
    }
    sed -i "s|@LIB_PATH@|/usr/lib/antigravity|g" "$srcdir/$pkgname.sh" || {
        echo "Error: Failed to replace @LIB_PATH@ in launcher script"
        return 1
    }

    sed -i 's|/usr/share/antigravity/antigravity|/usr/bin/antigravity|g' usr/share/applications/*.desktop
}

package() {
    install -Dm755 $pkgname.sh "$pkgdir/usr/bin/antigravity"

    cd usr/share/

    install -d "$pkgdir/usr/lib/antigravity"
    cp -a antigravity/resources/app/* "$pkgdir/usr/lib/antigravity/"

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /usr/lib/antigravity/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

    # Note: files from deb use 'antigravity' name, not $pkgname
    install -Dm644 appdata/antigravity.appdata.xml -t "$pkgdir/usr/share/metainfo"

    install -Dm644 applications/antigravity.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 applications/antigravity-url-handler.desktop -t "$pkgdir/usr/share/applications"

    install -Dm644 bash-completion/completions/antigravity -t "$pkgdir/usr/share/bash-completion/completions"
    install -Dm644 zsh/vendor-completions/_antigravity -t "$pkgdir/usr/share/zsh/site-functions"

    install -Dm644 mime/packages/antigravity-workspace.xml -t "$pkgdir/usr/share/mime/packages"
    install -Dm644 pixmaps/antigravity.png -t "$pkgdir/usr/share/pixmaps"
    rm -rf "$pkgdir/usr/lib/resources/"
}
