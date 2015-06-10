# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=dcpu16
pkgver=r22.998bb5f
pkgrel=1
pkgdesc='DCPU-16 emulator'
arch=('x86_64' 'i686')
url='https://github.com/dcpu16/dcpu16-go'
license=('unknown')
makedepends=('go')
options=('!strip')
source=('git://github.com/dcpu16/dcpu16-go.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname-go"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p go
  export GOPATH="$srcdir/go"
  go get github.com/nsf/termbox-go
}

build() {
  export GOPATH="$srcdir/go"
  cd "$pkgname-go"

  msg2 'Building emulator...'
  go build -o "$pkgname" dcpu16.go video.go main.go

  msg2 'Building assembler...'
  go build -o "${pkgname}asm" dcpu16.go assembler.go

  msg2 'Building disassembler...'
  go build -o "${pkgname}disasm" dcpu16.go disassembler.go
}

package() {
  cd "$pkgname-go"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "${pkgname}asm" "$pkgdir/usr/bin/${pkgname}asm"
  install -Dm755 "${pkgname}disasm" "$pkgdir/usr/bin/${pkgname}disasm"

  # No license yet
  #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
