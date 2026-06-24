# Maintainer: meow <aur at mreow full point org>
# Contributor: John Regan <john@jrjrtech.com>
pkgname=fluxer-git
_pkgname=fluxer
pkgver=r192.a45693f
pkgrel=1
pkgdesc="A free and open source instant messaging and VoIP platform built for friends, groups, and communities."
arch=('x86_64' 'aarch64')
url="https://fluxer.app/"
license=('AGPL-3.0-or-later')
options=('!lto')
provides=('fluxer')
conflicts=('fluxer')
_electronver=39
_nodever=20
makedepends=(
  'git'
  "nodejs>=$_nodever"
  "electron$_electronver"
  'npm'
  'pnpm'
  'python'
  'rust'
  'clang'
  'libfido2'
)
source=(
  "$_pkgname::git+https://github.com/fluxerapp/fluxer.git#branch=main"
)
sha256sums=(
  'SKIP'
)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_pkgname/fluxer_desktop"
    pnpm install --frozen-lockfile
}

build() {
    local electron_builder_options=(
      --linux
      --dir
      -c.electronDist=/usr/lib/electron$_electronver
    )
    cd "$_pkgname/fluxer_desktop"
    export NODE_ENV=production
    pnpm build
    pnpm exec electron-builder --config electron-builder.config.cjs ${electron_builder_options[@]}
}

package() {
    cd "$_pkgname/fluxer_desktop"
    sed -i 's|Exec=app.fluxer.Fluxer|Exec=/usr/lib/fluxer/fluxer|' packaging/linux/app.fluxer.Fluxer.desktop
    install -vDm 644 packaging/linux/app.fluxer.Fluxer.desktop -t "$pkgdir/usr/share/applications/"
    install -vDm 644 packaging/linux/app.fluxer.Fluxer.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/app.fluxer.Fluxer.svg"
    install -vdm 755 "$pkgdir/usr/lib/$_pkgname/"
    cp -rv dist-electron/linux-unpacked/* "$pkgdir/usr/lib/$_pkgname/"
}
