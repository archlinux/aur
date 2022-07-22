# Maintainer: Didrole <Didrole@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgbase=sia
pkgname=('siad')
pkgver=1.5.9
pkgrel=1
pkgdesc='Sia - Decentralized storage for the post-cloud world'
arch=('x86_64')
makedepends=('git' 'go')
url='https://sia.tech'
license=('MIT')
conflicts=('sia-daemon' 'siac')
provides=('siac')
source=("git+https://github.com/SiaFoundation/siad.git#tag=v${pkgver}"
        "sia.sysusers"
        "sia.tmpfiles"
        "siad.service")
sha256sums=('SKIP'
            'c6a0ae73338340d864a7397a577855000c4215d7769c7c872b1b80bfebb5a18e'
            '70d56324ce6b43e6fa6980a4dda3ae6241c84e3983043db246132b765f2d53e6'
            '1533734e672d7ae490fd33307b080730876de5043aa6507a88369e761a14a34d')

build() {
  cd "$srcdir/siad"
  
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  
  make release
  
  PATH="$srcdir/bin/" siac utils bash-completion "siac.bash-completion"
}

package() {
  cd "$srcdir/siad"

  install -Dm 644 "LICENSE" -t "$pkgdir/usr/share/licenses/sia"
  
  install -Dm644 "../siad.service" "${pkgdir}/usr/lib/systemd/system/siad.service"
  install -Dm644 "../sia.sysusers" "${pkgdir}/usr/lib/sysusers.d/sia.conf"
  install -Dm644 "../sia.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/sia.conf"
  
  install -dm 755 "$pkgdir/usr/share/doc/sia"
  cp -dpr doc/* "$pkgdir/usr/share/doc/sia"
  
  install -dm 755 "$pkgdir/usr/share/man/man1"
  cp -dp doc/manpages/* "$pkgdir/usr/share/man/man1"
  
  install -Dm 644 "siac.bash-completion" "$pkgdir/usr/share/bash-completion/completions/siac"
  
  install -Dm 755 "$srcdir/bin/siad" -t "$pkgdir/usr/bin"
  install -Dm 755 "$srcdir/bin/siac" -t "$pkgdir/usr/bin"
}
