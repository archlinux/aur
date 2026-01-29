# Maintainer: Mambuco <gabriele.giambrone@icloud.com>
pkgname=savestate
pkgver=2.4B
pkgrel=1
epoch=
pkgdesc="A versatile game save backup manager, featuring Steam detection, Minecraft support, drag & drop, desktop shortcuts and emulator compatible."
arch=('x86_64')
url="https://github.com/Matteo842/SaveState"
license=('GPL-3.0-only')
groups=()
depends=('glibc' 'zlib')
makedepends=('gendesk' 'python>=3.3' 'tk' 'pyside6' 'python-requests' 'python-psutil')
checkdepends=()
optdepends=()
provides=(savestate)
conflicts=(savestate)
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Matteo842/SaveState/archive/refs/tags/v$pkgver.tar.gz"
  "SaveState.png::https://github.com/Matteo842/SaveState/blob/v$pkgver/icon.png?raw=true"
  "SaveState-OneFile-Linux.spec::https://github.com/Matteo842/SaveState/raw/refs/heads/main/SaveState-OneFile-Linux.spec"
  "requirements.patch"
)
noextract=()
sha256sums=(
  '6af640adf6ce0fc326f29be23a0212072d698c23003baf35a01e18c67c5c7b22'
  '7f7b294aa10ef51f23dbccd814e2ce507269be889e444f2bf2b1fb5c50dcb15e'
  'ac19894ca894e119940a48ec62f51f25c8c8623e433f60d52fee8863a0c4fd61'
  '30e31c8e0e980dbf7726e09e555f1aba339326daf67cc544f230084adf4cea76'
)
validpgpkeys=()
_name="SaveState"
_categories=('Game;Utility')
_exec="/usr/bin/SaveState"

prepare() {
  cd "$srcdir"

  # Generate .desktop file
  echo "Generating .desktop file..."
  gendesk --pkgname="$pkgname" --pkgdesc="$pkgdesc" \
    --categories=$_categories \
    --name=$_name \
    --genericname=$_name \
    --exec=$_exec \
    --icon=$_name \
    -f

  cd "$_name-$pkgver"

  patch -p1 -i ../requirements.patch

  python -m venv ./venv

  source ./venv/bin/activate

  pip install -r requirements.txt
}

build() {
  cd "$srcdir/$_name-$pkgver"

  source ./venv/bin/activate

  # TODO: Remove on next release
  cp ../SaveState-OneFile-Linux.spec .

  pyinstaller --clean SaveState-OneFile-Linux.spec
}

package() {
  cd "$srcdir"

  install -Dm0755 -t "$pkgdir/usr/share/applications/" "savestate.desktop"
  install -Dm0755 -t "$pkgdir/usr/share/icons/" "$_name.png"

  install -Dm0755 -t "$pkgdir/usr/bin" "$_name-$pkgver/dist/SaveState"
}
