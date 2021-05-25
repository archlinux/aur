# Maintainer: ml <>
pkgname=ubports-installer-git
pkgver=0.8.8_beta.r3.g9319bc3
pkgrel=1
pkgdesc='A simple tool to install Ubuntu Touch on UBports devices'
arch=('any')
url='https://github.com/ubports/ubports-installer'
license=('GPL3')
depends=('android-tools' 'android-udev' 'electron' 'heimdall')
makedepends=('git' 'nodejs-lts-fermium' 'npm')
provides=('ubports-installer')
conflicts=('ubports-installer')
source=("$pkgname::git+$url.git"
        ubports-installer
        ubports-installer.desktop
        01-disable-update-check.patch
        02-never-udev.patch
        03-electrondist.patch)
sha256sums=('SKIP'
            'e3167aa1469a33d1eca4dae377ed51675bea08e61e6d17f94f83a241538be56b'
            '7f59cb66ab7e59caeff93f697e47f26f43a9a221258f4d89dee580e41dd7a39a'
            'f5a47dd84c2ce46528385a673d93e465132a80a5a72de5b4cf41e055f9f60fe4'
            'a9d899eaf4e8a004c20d7d9ff6af696aa9cd5602e5e95583f4fe27ecaa7aa03f'
            '768fcea52f63fed0bebb61861437db5f7e1f00358ad594c8d5593adc43a0f0c0')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/-/_/;s/-/.r/;s/-/./'
}

prepare() {
  cd "$pkgname"
  for p in ../{01-disable-update-check,02-never-udev,03-electrondist}.patch; do
    echo "Applying $p"
    patch -Np1 <"$p"
  done
  npm install --no-audit --no-progress --no-fund --ignore-scripts electron@"$(</usr/lib/electron/version)"
  npm run prerender
}

build() {
  cd "$pkgname"
  node ./build.js -o linux -p dir -a x64
}

package() {
  install -Dm644 -t "$pkgdir/usr/share/applications" ubports-installer.desktop
  install -Dm755 -t "$pkgdir/usr/bin" ubports-installer

  cd "$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/ubports-installer" dist/linux-unpacked/resources/app.asar

  find ./dist/linux-unpacked/resources/app.asar.unpacked -type d \( -name linux -o -name mac \) -print -exec rm -r {} +
  cp -rt "$pkgdir/usr/share/ubports-installer" dist/linux-unpacked/resources/app.asar.unpacked

  find "$pkgdir" -type d -empty -delete -print

  cd build/icons
  for i in *x*.png; do
    install -Dm644 "$i" "$pkgdir/usr/share/icons/hicolor/${i%.png}/apps/ubports-installer.png"
  done
}
