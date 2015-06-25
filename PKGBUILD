# Maintainer: GreenRaccoon23 <GreenRaccoon a t gmail d o t com>

pkgname=liteide-git
pkgver=r1307.f5de5dc-1
#pkgver=x27.2.1.r0.gf5de5dc
pkgrel=1
pkgdesc="IDE for editing and building projects written in the Go programming 
    language - git variant."
arch=('any')
url="https://github.com/visualfc/${pkgname%-*}"
license=('LGPL')
depends=('go' 'qt5-webkit')
replaces=('golangide' "${pkgname%-*}")
conflicts=('golangide' "${pkgname%-*}" "${pkgname}")
makedepends=('gendesk' 'git' 'go' 'mercurial' 'setconf')
#options=('!strip' '!emptydirs')
source=("git+https://github.com/visualfc/${pkgname%-*}.git"
        'liteide.png')
md5sums=('SKIP'
         '7f459be003d754a3a2c34be91b8c0b1f')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  gendesk -f -n --name 'LiteIDE' --pkgname "${pkgname%-*}" --pkgdesc "$pkgdesc"
  chmod +x "${pkgname%-*}/build/"*_*.sh

  cd "${pkgname%-*}/liteidex/os_deploy/linux/liteenv"
  for bits in 32 64; do
    # Fix for FS#4662 until fixed by upstream.
    sed -i 's/^GOROOT/#GOROOT/g' "linux$bits.env"
  done
}

build() {
  cd "${pkgname%-*}/build"

  export QTDIR=/usr

  mkdir -p go
  export GOPATH=`pwd`/go

  ./update_pkg.sh
  ./build_linux.sh
}

package() {
  cd "${pkgname%-*}/build/liteide"

  msg2 'Creating directories...'
  mkdir -p \
    "$pkgdir/usr/lib/liteide" \
    "$pkgdir/usr/share/liteide" \
    "$pkgdir/usr/share/doc/${pkgname%-*}"

  msg2 'Packaging executables...'
  for binary in gotools gocode liteide; do # goimports
    install -Dm755 "bin/$binary" "$pkgdir/usr/bin/$binary"
  done
  ln -s /usr/bin/liteide "$pkgdir/usr/bin/golangide"

  cd "$srcdir/${pkgname%-*}/liteidex"

  msg2 'Packaging resources...'
  cp -r deploy/* os_deploy/* "$pkgdir/usr/share/liteide"

  msg2 'Packaging libraries and plugins...'
  cp -r liteide/lib/liteide/* "$pkgdir/usr/lib/liteide"
  chmod -x "$pkgdir/usr/lib/liteide/plugins/"*

  msg2 'Packaging license and license exception...'
  install -Dm644 LICENSE.LGPL \
    "$pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE"
  install -Dm644 LGPL_EXCEPTION.TXT \
    "$pkgdir/usr/share/licenses/${pkgname%-*}/LGPL_EXCEPTION"

  cd ../..

  msg2 'Packaging menu entry and icon...'
  install -Dm644 "${pkgname%-*}.desktop" \
    "$pkgdir/usr/share/applications/${pkgname%-*}.desktop"
  install -Dm644 "${pkgname%-*}.png" \
    "$pkgdir/usr/share/pixmaps/${pkgname%-*}.png"

  msg2 'Cleaning up...'
  rm -rf "$pkgdir/usr/share/${pkgname%-*}/doc"

  # Fix for FS#38781
  mv "$pkgdir/usr/share/liteide/linux/liteenv" "$pkgdir/usr/share/liteide/liteenv"
}

# vim:set ts=2 sw=2 et: