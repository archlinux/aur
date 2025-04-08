# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=joindesktop-git
_app_id=com.joaomgcd.join
pkgver=1.1.3.r0.geac2304
pkgrel=4
_electronversion=34
pkgdesc="An official desktop app for Join by Joaoapps built in Electron."
arch=('x86_64')
url="https://joaoapps.com/join/desktop"
license=('LicenseRef-unknown')
depends=("electron${_electronversion}")
makedepends=('git' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/joaomgcd/JoinDesktop.git'
        "${_app_id}.desktop"
        "${_app_id}.sh")
sha256sums=('SKIP'
            'e53498372d93c74641ff58c1ac1e658f5c1c5645b9b878afffa85b079f5803da'
            '80d1b1440b6601be076c662c44b4018b951f1cec1bb3bea919cf532c9a4f2b92')

pkgver() {
  cd JoinDesktop
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd JoinDesktop
  export npm_config_cache="$srcdir/npm_cache"
  npm install

  sed -i "s|@ELECTRONVERSION@|${_electronversion}|" "$srcdir/${_app_id}.sh"
}

build() {
  cd JoinDesktop
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  export npm_config_cache="$srcdir/npm_cache"
  npm exec -c "electron-builder build --dir \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer"
}

package() {
  cd JoinDesktop
  install -d "$pkgdir/usr/lib/${pkgname%-git}"
  cp -r dist/linux-unpacked/resources/* "$pkgdir/usr/lib/${pkgname%-git}/"

  install -Dm755 "$srcdir/${_app_id}.sh" "$pkgdir/usr/bin/${_app_id}"
  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/${pkgname%-git}"

  install -Dm644 "$srcdir/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 images/join.png "$pkgdir/usr/share/pixmaps/${_app_id}.png"
}
