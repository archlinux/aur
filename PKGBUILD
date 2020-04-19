# Maintainer: AnonymerNiklasistanonym <niklas.mikeler@gmail.com>
pkgname=iliasbuddydesktop
pkgver=1.0.0
pkgrel=1
pkgdesc='Read private Ilias RSS feed and notify about changes'
arch=('x86_64')
url='https://github.com/AnonymerNiklasistanonym/IliasBuddyDesktop'
license=('MIT')
depends=('electron')
provides=("$pkgname")
conflicts=("$pkgname")
_gitname="$pkgname.git"
source=("$_gitname::git+$url#branch=master")
sha1sums=('SKIP')

build() {
  cd "$_gitname"
  rm -rf node_modules
  npm install --only=production
}

package() {
  cd "$_gitname"
  install -Dd "$pkgdir/opt/$pkgname"
  find node_modules -exec install -D {} "$pkgdir/opt/$pkgname/"{} \;
  find css fonts images js modules -exec install -D {} "$pkgdir/opt/$pkgname/"{} \;
  install -D index.js "$pkgdir/opt/$pkgname/"
  install -D index.html "$pkgdir/opt/$pkgname/"
  install -D main.js "$pkgdir/opt/$pkgname/"
  install -D default_settings.json "$pkgdir/opt/$pkgname/"
  install -D package.json "$pkgdir/opt/$pkgname/"

  cp images/favicon/favicon.svg "$pkgname.svg"
  install -Dm 644 "$pkgname.svg" "$pkgdir/opt/$pkgname/"

  echo -e "\
#!/usr/bin/env bash\n\
cd \"/opt/$pkgname\"\n\
electron . \$@\n" > "$pkgname"

  install -Dd "$pkgdir/usr/bin"
  install -Dm 777 "$pkgname" "$pkgdir/usr/bin"

  install -Dd "$pkgdir/usr/share/applications"

  echo -e "\
[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Terminal=false\n\
Exec=$pkgname\n\
Name=Ilias Buddy Desktop\n\
Comment=$pkgdesc\n\
Icon=/opt/$pkgname/$pkgname.svg" > "$pkgname.desktop"
  install -Dm 644 "$pkgname.desktop" "$pkgdir/usr/share/applications"
}
