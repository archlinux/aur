# Maintainer: codev911 <codev911@mojosolid.dev>

pkgname=antigravity-deb
pkgver=1.18.4
_x86minor=1771638098
_arm64minor=1771638096
_x86check=72f97454beb720380cfbdd654ab03301
_arm64check=f096532b9c0bc65a62dc53ed2bb5ff66
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
sha256sums_aarch64=('648ca0e131c4684398419f4bc8d9d28863a78ab9e2b8f43705437aeb98b0a550')
sha256sums_x86_64=('e0d380717480b45247e8cb40a37c314bc42d0e71c34de7810ae45bbede4db140')

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
