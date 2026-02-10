# Maintainer: Jakob Hellermann <jakob.hellermann@protonmail.com>
pkgname=fsmexpress-git
pkgver=0.0.0.r57.87d51a0
pkgrel=1
pkgdesc='PlayMaker FSM Viewer'
url='https://github.com/nesrak1/FSMExpress'
makedepends=('git' 'dotnet-sdk' 'imagemagick')
depends=('gcc-libs' 'glibc' 'fontconfig' 'dotnet-runtime')
arch=('x86_64' 'armv7h' 'aarch64')
license=('MIT')
source=(
    "$pkgname::git+https://github.com/nesrak1/FSMExpress#branch=skong"
    "fsmexpress.desktop"
)
sha1sums=('SKIP'
          '71459724f9d466f5bcc3ea4aeda6621cbe91597b')


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
    find FSMExpress/bin/Release/net8.0/runtimes/* -maxdepth 0 ! -name linux-x64 -type d -exec rm -r {} +
}

package() {
    install -d "$pkgdir/usr/lib"
    cp -r "$pkgname/FSMExpress/bin/Release/net8.0" "$pkgdir/usr/lib/FSMExpress"

    install -d "$pkgdir/usr/bin"
    ln -sf "/usr/lib/FSMExpress/FSMExpress" "$pkgdir/usr/bin/FSMExpress"
    # install -Dm644 "$pkgname/license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    mkdir -p "${pkgdir}/usr/share/icons/hicolor/"{'256x256/apps','48x48/apps','32x32/apps','16x16/apps'}
    magick "$pkgname/FSMExpress/Assets/icon.png" -resize 16x16 "${pkgdir}/usr/share/icons/hicolor/16x16/apps/fsmexpress.png"
    magick "$pkgname/FSMExpress/Assets/icon.png" -resize 32x32 "${pkgdir}/usr/share/icons/hicolor/32x32/apps/fsmexpress.png"
    magick "$pkgname/FSMExpress/Assets/icon.png" -resize 48x48 "${pkgdir}/usr/share/icons/hicolor/48x48/apps/fsmexpress.png"
    magick "$pkgname/FSMExpress/Assets/icon.png" -resize 256x265 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/fsmexpress.png"

    install -Dm 644 "fsmexpress.desktop" "${pkgdir}/usr/share/applications/fsmexpress.desktop"
}
