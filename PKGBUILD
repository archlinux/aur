# Maintainer: Jakob Hellermann <jakob.hellermann@protonmail.com>
pkgname=uabea-next-git
pkgver=0.0.0.r99.7ae61d2
pkgrel=1
pkgdesc=' A research and modding tool for SerializedFiles and Asset Bundles '
url='https://github.com/nesrak1/UABEANext'
makedepends=('git' 'dotnet-sdk')
depends=('gcc-libs' 'glibc' 'fontconfig' 'dotnet-runtime')
arch=('x86_64' 'armv7h' 'aarch64')
license=('MIT')
source=(
    "$pkgname::git+https://github.com/nesrak1/UABEANext"
    "uabea.desktop"
)
sha1sums=('SKIP'
          'c777f2fc50900ad4b3be907914c30050d588b7df')


pkgver() {
  cd "$pkgname"
  # local tag=$(git tag --sort=-v:refname | grep -v '69420' | head -1)
  # local commits_since=$(git rev-list $tag..HEAD --count)
  # echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
  local commits=$(git rev-list HEAD --count)
  echo "0.0.0.r$commits.$(git log --pretty=format:'%h' -n 1)"
}

prepare() {
    cd "$pkgname"
}

build() {
    cd "$pkgname"
    dotnet restore
    dotnet build --configuration Release --no-restore
    find UABEANext4.Desktop/bin/Release/net8.0/runtimes/* -maxdepth 0 ! -name linux-x64 -type d -exec rm -r {} +
}

package() {
    install -d "$pkgdir/usr/lib"
    cp -r "$pkgname/UABEANext4.Desktop/bin/Release/net8.0" "$pkgdir/usr/lib/UABEANext"

    install -d "$pkgdir/usr/bin"
    ln -sf "$pkgdir/usr/lib/UABEA/UABEANext4.Desktop" "$pkgdir/usr/bin/UABEANext"
    # install -Dm644 "$pkgname/license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # mkdir -p "${pkgdir}/usr/share/icons/hicolor/"{'256x256/apps','48x48/apps','32x32/apps','16x16/apps'}
    # convert "$pkgname/ui/assets/icon/icon.png" -resize 256x265 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/atlas.png"
    # convert "$pkgname/ui/assets/icon/icon.png" -resize 48x48 "${pkgdir}/usr/share/icons/hicolor/48x48/apps/atlas.png"
    # convert "$pkgname/ui/assets/icon/icon.png" -resize 32x32 "${pkgdir}/usr/share/icons/hicolor/32x32/apps/atlas.png"
    # convert "$pkgname/ui/assets/icon/icon.png" -resize 16x16 "${pkgdir}/usr/share/icons/hicolor/16x16/apps/atlas.png"

    install -Dm 644 "uabea.desktop" "${pkgdir}/usr/share/applications/uabea-next.desktop"
}
