# Maintainer: ml <>
pkgname=ubports-installer-git
pkgver=0.9.8_beta.r3.g1756231
pkgrel=1
pkgdesc='A simple tool to install Ubuntu Touch on UBports devices'
arch=('x86_64')
url='https://github.com/ubports/ubports-installer'
license=('GPL3')
depends=('android-tools' 'android-udev' 'dbus' 'glib2' 'heimdall')
makedepends=('git' 'nodejs' 'npm')
provides=('ubports-installer')
conflicts=('ubports-installer')
source=("$pkgname::git+$url.git"
        ubports-installer
        ubports-installer.desktop)
sha256sums=('SKIP'
            '461694d8ebce4d14e27be15d278ab1c1610c998962a94a7aaff1c64886f85dbe'
            '7f59cb66ab7e59caeff93f697e47f26f43a9a221258f4d89dee580e41dd7a39a')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/-/_/;s/-/.r/;s/-/./'
}

prepare() {
  cd "$pkgname"
  npm ci
}

build() {
  cd "$pkgname"
  node ./build.js -o linux -p dir -a x64
}

package() {
  install -Dm644 -t "$pkgdir/usr/share/applications" ubports-installer.desktop
  install -Dm755 -t "$pkgdir/usr/bin" ubports-installer

  cd "$pkgname"
  install -dm755 "$pkgdir/opt/ubports-installer"

  find ./dist/linux-unpacked/resources/app.asar.unpacked -type d \( -name linux -o -name mac \) -print -exec rm -r {} +
  cp -rt "$pkgdir/opt/ubports-installer" dist/linux-unpacked/*

  cd build/icons
  for i in *x*.png; do
    install -Dm644 "$i" "$pkgdir/usr/share/icons/hicolor/${i%.png}/apps/ubports-installer.png"
  done
}
