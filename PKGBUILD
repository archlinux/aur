# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Alexander Adler <alexadler1@protonmail.com>
# Contributor: Yan Burdonsky <psyrccio@gmail.com>

# Copy your OGG|MP3|WAV noises into ~/ANoise or ~/.ANoise

pkgname=anoise
pkgver=0.0.36
pkgrel=3
pkgdesc="Ambient Noise Player. Relax or concentrate with a noise"
arch=('any')
url="https://costales.github.io/projects/anoise"
license=('GPL3')
depends=('gst-python' 'webkit2gtk' 'anoise-media')
makedepends=('python-distutils-extra')
optdepends=('anoise-community-extension1: Sounds and icons from the users'
            'anoise-community-extension2: Sounds and icons from the users'
            'anoise-community-extension3: Sounds and icons from the users'
            'anoise-community-extension4: Sounds and icons from the users'
            'anoise-community-extension5: Sounds and icons from the users'
            'anoise-gui: GUI for anoise'
            'libappindicator-gtk3: tray icon')
source=("https://launchpad.net/~costales/+archive/ubuntu/$pkgname/+sourcefiles/$pkgname/$pkgver/${pkgname}_${pkgver}.tar.gz"
        'setup.patch')
sha256sums=('cd6e2e1e8691b950c503b4319f7f9ecf6e66c745e5194724be0c3e026e9dd3ac'
            'e561b2513e791c29d097e7eea7c83f9bbe3d993ead398e7dd0352bbb55ce451a')

prepare() {

  # remove space from SRCDEST folder
  mv -f "$pkgname " "$pkgname"

  cd "$srcdir/$pkgname"
  patch --forward --strip=1 --input="$srcdir/setup.patch"
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # This file is included in anoise-gui
  rm "$pkgdir/usr/share/$pkgname/$pkgname.ui"

  # Files setup.py does not install
  cp -r locale "$pkgdir/usr/share/locale"

  install -Dm644 "build/share/applications/$pkgname.desktop" -t \
    "$pkgdir/usr/share/applications"
}
