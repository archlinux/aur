# Maintainer: John Regan <john@jrjrtech.com>
pkgname=fluxer
pkgver=r92.aa4e5b0
pkgrel=1
pkgdesc="A free and open source instant messaging and VoIP platform built for friends, groups, and communities. "
arch=('x86_64' 'aarch64')
url="https://fluxer.app/"
license=('AGPL-3.0-or-later')
_electronver=39
_nodever=20
depends=(
  "electron$_electronver"
  bash
  hicolor-icon-theme
)
makedepends=(
  'cargo'
  'git'
  'librsvg'
  "nodejs>=$_nodever"
  'npm'
  'pnpm'
  'python'
)
source=(
  "$pkgname::git+https://github.com/fluxerapp/fluxer.git#branch=main"
  "$pkgname.sh.in"
  "$pkgname.desktop"
)
sha256sums=(
  'SKIP'
  '6e7f62aebf5d3ba3326a4b562724235657852786900b366b5d72e05d69e4c599'
  '54af8898c7d6674f803f4ae436da03e710a686d81f3915e14da61dcbea69e1dd'
)
_resolutions=( 16 32 48 64 96 128 256 512 1024 )

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    #export RUSTUP_TOOLCHAIN=stable
    sed "s/@ELECTRON@/electron$_electronver/" $pkgname.sh.in > $pkgname.sh

	cd "$pkgname/fluxer_app"
    # TODO is there a way to set the store-dir via
    # environment variable?
    echo "store-dir=${srcdir}/pnpm-store" > .npmrc

    for resolution in "${_resolutions[@]}" ; do
        rsvg-convert --width=$resolution --height=$resolution src/images/fluxer-logo-color.svg > "$pkgname-$resolution.png"
    done

    pnpm install --frozen-lockfile
}

build() {
    local electron_builder_options=(
      --linux
      --dir
      -c.electronDist=/usr/lib/electron$_electronver
    )

	cd "$pkgname/fluxer_app"
    export NODE_ENV=production
    pnpm electron:compile
    pnpm exec electron-builder --config electron-builder.config.cjs ${electron_builder_options[@]}
}

package() {
    install -vDm 755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
    install -vDm 644 $pkgname.desktop -t "$pkgdir/usr/share/applications/"

    cd "$pkgname/fluxer_app"

    install -vdm 755 "$pkgdir/usr/lib/$pkgname/"
    cp -rv  dist-electron/linux-unpacked/resources/* "$pkgdir/usr/lib/$pkgname/"
    install -vDm 644 src/images/fluxer-logo-color.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

    for resolution in "${_resolutions[@]}" ; do
        install -vDm 644 "$pkgname-$resolution.png" "$pkgdir/usr/share/icons/hicolor/${resolution}x${resolution}/apps/$pkgname.png"
    done
}
