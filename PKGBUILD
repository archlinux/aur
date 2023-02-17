# Maintainer: Stas Rudakou <stas@garage22.net>

pkgname=happy-hacking-gnu
pkgver=0.2.1
pkgrel=2
pkgdesc='A free, open-source alternative to the HHKB Keymap Tool provided by PFU'
arch=(x86_64)
url='https://gitlab.com/dom/happy-hacking-gnu'
license=(Unlicense)
makedepends=('gcc' 'cmake')
depends=('systemd-libs')
source=(
    "git+https://gitlab.com/dom/happy-hacking-gnu.git#tag=${pkgver}"
    'git+https://github.com/cofyc/argparse'
    'git+https://github.com/libusb/hidapi'
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.deps/argparse.url "$srcdir/argparse"
  git config submodule.hidapi.url "$srcdir/hidapi"
  git -c protocol.file.allow=always submodule update
}

build() {
    cd "$pkgname/bin"
    cmake ..
    make
}

package() {
    cd "$pkgname"
    install -Dm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/$pkgname/"
    install -Dm0755 "bin/hhg" -t "$pkgdir/usr/bin/"
}
