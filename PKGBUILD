# Maintainer: ParticleG <particle_g@outlook.com>

pkgname=uuyc-wine
pkgver=4.33.0.8907
pkgrel=9
pkgdesc='Wine compatibility package for NetEase UU Remote (网易UU远程)'
arch=('x86_64')
url='https://uuyc.163.com/'
license=('LicenseRef-UU-Remote-EULA AND 0BSD')
depends=('wine>=11.1' 'hicolor-icon-theme' 'procps-ng' 'util-linux' 'diffutils')
makedepends=('7zip' 'python')
optdepends=('libnotify: desktop notifications during first-run setup')
options=('!strip' '!debug')
install="$pkgname.install"
_eula_semantic_sha256='5ac767dad456d304ed9be4a089b0bb26f6942544112a1842c720b1edcb7f44fd'

source=(
  "$pkgname-${pkgver}.exe::https://a56.gdl.netease.com/UURemote_Setup_${pkgver}_0715193023_gwqd.exe"
  'uuyc-wine'
  'uuyc-wevtapi.S'
  'uuyc-wevtapi.def'
  'LICENSE'
  'uuyc-wine.desktop'
  'extract-uuyc-eula.py'
  "UU-Remote-EULA-${_eula_semantic_sha256}.source.html::https://uuyc.163.com/contact/20240402/40294_1146065.html"
)
noextract=("$pkgname-${pkgver}.exe")
sha256sums=(
  '5e3cfe8cfdc6552c1fc26f1ad2c94df133ca20dc3c45c23155358c32ac9bf53e'
  'f1df7ab0ec159e8c99759a8088c9fd3fcda93efbf611350dd019dee72ead0c7c'
  'b24c466c330b26aa0a9ef22577a1681705e9b1d092f59a7adda602ef31623ab4'
  'c56c72c159f47b1b812943cd2095a0f64d2c4972f3c7a1a7f75e994c7b52f691'
  'e91389eac5bc82c8398518cc7fd04ffbcc76ed009fcbec9f951015340a9ca2b3'
  'a55bf7d10211616967119ff57f4fe82bebf0b0ad12b93f6eafd3f2f2928fa840'
  '0b9c3e2e9f99367fc6339b70704c97d4ae291806718e16400bfe479689b5b10d'
  'SKIP'
)

verify() {
  local eula_file="UU-Remote-EULA-${_eula_semantic_sha256}.source.html"
  local eula_path="$startdir/$eula_file"
  if [[ ! -f "$eula_path" ]]; then
    eula_path="$SRCDEST/$eula_file"
  fi

  python "$startdir/extract-uuyc-eula.py" --verify-only \
    "$eula_path" "$_eula_semantic_sha256"
}

prepare() {
  python "$srcdir/extract-uuyc-eula.py" \
    "$srcdir/UU-Remote-EULA-${_eula_semantic_sha256}.source.html" \
    "$srcdir/UU-Remote-EULA.html" \
    "$srcdir/UU-Remote-EULA.txt" \
    "$_eula_semantic_sha256"

  rm -rf "$srcdir/$pkgname-icon"
  7z x -y -o"$srcdir/$pkgname-icon" \
    "$srcdir/$pkgname-${pkgver}.exe" '.rsrc/ICON/6'
}

build() {
  cd "$srcdir"
  as --64 uuyc-wevtapi.S -o uuyc-wevtapi-elf.o
  objcopy --remove-section=.note.gnu.property -O pe-x86-64 \
    uuyc-wevtapi-elf.o uuyc-wevtapi-coff.o
  ld -mi386pep --dll --no-insert-timestamp --entry=DllMain \
    --subsystem windows -o wevtapi.dll \
    uuyc-wevtapi-coff.o uuyc-wevtapi.def \
    -L/usr/lib/wine/x86_64-windows -lkernel32
}

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/wevtapi.dll" \
    "$pkgdir/usr/share/$pkgname/wevtapi.dll"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname-${pkgver}.exe" \
    "$pkgdir/usr/share/$pkgname/uuyc-wine-installer.exe"
  install -Dm644 "$srcdir/$pkgname-icon/.rsrc/ICON/6" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 "$srcdir/UU-Remote-EULA.html" \
    "$pkgdir/usr/share/licenses/$pkgname/UU-Remote-EULA.html"
  install -Dm644 "$srcdir/UU-Remote-EULA.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/UU-Remote-EULA.txt"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  printf '%s\n' "$pkgver" >"$pkgdir/usr/share/$pkgname/upstream-version"
  printf '%s-%s\n' "$pkgver" "$pkgrel" \
    >"$pkgdir/usr/share/$pkgname/package-release"
}
