# Maintainer: fdossena <info@fdossena.com>

pkgname=flogo
pkgver=1.2.1.r242.f1e07a3
pkgrel=1
pkgdesc='Create and run programs using flow charts'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://fdossena.com?p=flogo/index.frag"
license=('AGPL-3.0-or-later')
depends=('electron')
makedepends=('git' 'yarn' 'npm')
provides=('flogo')
source=(git+https://github.com/adolfintel/flogo
        flogo.desktop
        flogo.sh
        flogo-mime.xml)
sha256sums=(SKIP SKIP SKIP SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(git tag --sort=committerdate | tail -1 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  yarn --cache-folder "${srcdir}/yarn-cache" install
  yarn --cache-folder "${srcdir}/yarn-cache" run build-linux-x64 #architecture is actually irrelevant, we just need the app.asar file
}

package() {
  install -d "${pkgdir}"/{usr/bin,usr/lib/flogo}
  cp -R "./$pkgname/out/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname"
  install -Dm755 "./flogo.sh" "$pkgdir/usr/bin/flogo"
  install -Dm644 "./flogo.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "./flogo-mime.xml" "$pkgdir/usr/share/mime/packages/$pkgname.xml"

  cd $pkgname
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "icons/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 "icons/icon_file.png" "$pkgdir/usr/share/icons/hicolor/256x256/mimetypes/x-${pkgname}_file.png"
  cd ..

}

post_install(){
  update-mime-database /usr/share/mime >/dev/null 2>&1
  update-desktop-database -q /usr/share/applications >/dev/null 2>&1
  gtk-update-icon-cache -f /usr/share/icons/hicolor >/dev/null 2>&1
  xdg-mime default "/usr/share/applications/$pkgname.desktop" application/x-flogo
}
