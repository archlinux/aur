# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=joindesktop-git
_app_id=com.joaomgcd.join
pkgver=1.1.2.r2.ga4748ff
pkgrel=5
_electronversion=25
pkgdesc="An official desktop app for Join by Joaoapps built in Electron."
arch=('x86_64')
url="https://joaoapps.com/join/desktop"
license=('unknown')
depends=("electron${_electronversion}")
makedepends=('git' 'npm')
optdepends=('libnotify: for native notifications')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/joaomgcd/JoinDesktop.git'
        "${_app_id}.desktop"
        "${_app_id}.sh")
sha256sums=('SKIP'
            'e53498372d93c74641ff58c1ac1e658f5c1c5645b9b878afffa85b079f5803da'
            '5582e9f4c46f749ec2de54cf6d25c44376f7901644657e0cbf0a05693c5f36b3')

pkgver() {
  cd JoinDesktop
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd JoinDesktop
  export npm_config_cache="$srcdir/npm_cache"
  npm install
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
