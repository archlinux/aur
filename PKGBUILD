# Maintainer: Cole Erickson <colese2 at byu dot edu>
pkgname=uxpin
pkgver=20180503
pkgrel=1
epoch=0
pkgdesc="Electron version of the UXPin web app"
arch=('x86_64')
url="https://uxpin.com/"
license=('GPL')
groups=()
depends=()
makedepends=('p7zip')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://files.uxpin.com/desktop-app/latest/UXPin-win.exe"
        "https://github.com/electron/electron/releases/download/v2.0.0/electron-v2.0.0-linux-x64.zip")
noextract=('UXPin-win.exe')
md5sums=("3e0555f29831198ca61d59dd16156cb6"
         "b173a5463f68c2a083d7e1164d51a67e")
validpgpkeys=()

prepare() {
  # Make a clean directory to muck about with exe files
  mkdir temp
  mv UXPin-win.exe temp
  cd temp

  # Extract the app-64 7z file (installer bundle)
  7z x UXPin-win.exe '$PLUGINSDIR/app-64.7z'

  # Extract from that the app.asar file (electron bundle)
  7z x '$PLUGINSDIR/app-64.7z' resources/app.asar
  cd ..

  # Put that in our electron app
  mv temp/resources/app.asar ./resources/

  # Clean up the source zip
  rm electron-v2.0.0-linux-x64.zip

  # Clean up
  rm -r temp
}

build() {
  # Rename our binary
  mv electron uxpin
}

check() {
  echo "Fine" > /dev/null
}

package() {
  # Put uxpin in /usr/lib/uxpin
  mkdir -p "$pkgdir/usr/lib/uxpin"
  mv ./* "$pkgdir/usr/lib/uxpin/"

  # Symlink in /usr/bin
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/lib/uxpin/uxpin" "$pkgdir/usr/bin/uxpin"
}
