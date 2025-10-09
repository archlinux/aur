# Maintainer: Jakob Hellermann <jakob.hellermann@protonmail.com>
pkgname=uabea-next-git
_pkgname=uabea-next
pkgver=0.0.0.r100.da7c773
pkgrel=1
pkgdesc='A research and modding tool for SerializedFiles and Asset Bundles'
url='https://github.com/nesrak1/UABEANext'
makedepends=('git' 'dotnet-sdk' 'imagemagick')
depends=('gcc-libs' 'glibc' 'fontconfig' 'dotnet-runtime')
arch=('x86_64' 'armv7h' 'aarch64')
license=('MIT')
source=(
    "$pkgname::git+https://github.com/nesrak1/UABEANext"
    "uabea.desktop"
)
sha1sums=('SKIP'
          '053b63a171fbf04fba2c061ae83d997f7d913e79')


pkgver() {
  cd "$pkgname"
  # local tag=$(git tag --sort=-v:refname | grep -v '69420' | head -1)
  # local commits_since=$(git rev-list $tag..HEAD --count)
  # echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
  local commits=$(git rev-list HEAD --count)
  echo "0.0.0.r$commits.$(git log --pretty=format:'%h' -n 1)"
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
    ln -sf "/usr/lib/UABEANext/UABEANext4.Desktop" "$pkgdir/usr/bin/$_pkgname"
    # install -Dm644 "$pkgname/license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    magick "$pkgname/UABEANext4/Assets/logo-new.ico" "icon.png"
    install -Dm644 "icon-0.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/$_pkgname.png"
    install -Dm644 "icon-1.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
    install -Dm644 "icon-2.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/$_pkgname.png"
    install -Dm644 "icon-3.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
    #install -Dm644 "$pkgname/UABEANext4/Assets/logo-new.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/UABEANext.png"
    # mkdir -p "${pkgdir}/usr/share/icons/hicolor/"{'256x256/apps','48x48/apps','32x32/apps','16x16/apps'}
    # convert "$pkgname/ui/assets/icon/icon.png" -resize 256x265 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/atlas.png"
    # convert "$pkgname/ui/assets/icon/icon.png" -resize 48x48 "${pkgdir}/usr/share/icons/hicolor/48x48/apps/atlas.png"
    # convert "$pkgname/ui/assets/icon/icon.png" -resize 32x32 "${pkgdir}/usr/share/icons/hicolor/32x32/apps/atlas.png"
    # convert "$pkgname/ui/assets/icon/icon.png" -resize 16x16 "${pkgdir}/usr/share/icons/hicolor/16x16/apps/atlas.png"

    install -Dm644 "uabea.desktop" "${pkgdir}/usr/share/applications/$_pkgname.desktop"
}
