# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
_pkgname=pear-desktop
pkgname=pear-desktop-noads-git
_app_id=com.github.th_ch.youtube_music
pkgver=3.11.0.r389.g6aa7cdb
pkgrel=1
_electronversion=43
pkgdesc="Extension for music player - tweaked to ruin required submission to our capitalist overseers in exchange for pleasant noises."
arch=('x86_64')
url="https://github.com/pear-devs/pear-desktop"
license=('MIT')
depends=(
  'electron'
  'libsecret'
)
makedepends=(
  'git'
  'nodejs'
  'pnpm'
)
provides=("$_pkgname")
conflicts=("$_pkgname" 'youtube-music')
install="$_pkgname.install"
source=('git+https://github.com/pear-devs/pear-desktop.git'
        "$_pkgname.sh"
        "${_app_id}.desktop")
sha256sums=('SKIP'
            'bf77b9390f6657d6b58613600cc76178da9ffa97cce55b8d0ba50b4c2ab7f996'
            '19a3c15cb705d56c205bdcd3d473545226b641952ed87677afd5b6c70a5573b4')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git revert f5175a6 || true
  git restore -SW README.md
  sed -i "s|@ELECTRONVERSION@|${_electronversion}|" "$srcdir/$_pkgname.sh"
}

build() {
  cd "$_pkgname"
  export PNPM_HOME="$srcdir/pnpm-home"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  pnpm install --frozen-lockfile
  pnpm clean
  pnpm build
  pnpm electron-builder --linux dir \
    ${dist} -c.electronDist=${electronDist} -c.electronVersion=${electronVer}
}

package() {
  cd "$_pkgname"
  install -Dm644 pack/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/$_pkgname/"
  cp -r pack/linux-unpacked/resources/app.asar.unpacked "$pkgdir/usr/lib/$_pkgname"

  install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.png"
  install -Dm644 license -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
