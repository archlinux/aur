# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Sergey A. <murlakatamenka@disroot.org>
pkgname=tuxclocker
pkgver=1.3.2
pkgrel=1
pkgdesc="Qt overclocking tool for GNU/Linux"
arch=('x86_64')
url="https://github.com/Lurkki14/tuxclocker"
license=('GPL3')
depends=('boost-libs' 'hicolor-icon-theme' 'libdrm' 'qt5-base' 'qt5-charts')
makedepends=('boost' 'git' 'meson' 'qt5-tools')
optdepends=('libxnvctrl: XNVCtrl support'
            'nvidia-utils: nvidia-ml support'
            'python-hwdata: PCI subsystem support')
_commit=2b2e80e6bd32e9fe796157282a5886adcbc08b10  # tags/1.3.2^0
source=("git+https://github.com/Lurkki14/tuxclocker.git#commit=${_commit}"
        'git+https://github.com/mpark/patterns.git'
        'git+https://github.com/Dobiasd/FunctionalPlus.git'
        "$pkgname.desktop"
        "$pkgname.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'dd5628bea92e16f4d8cbee851deceb1e3488cbabfcf34716946923710eb03d24'
            '9e0f528d7f24e501fa9586101231c7f85cf5fbb1709ff354b2abe8d422977d9f')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.src/include/deps/patterns.url "$srcdir/patterns"
  git config submodule.src/include/deps/FunctionalPlus.url "$srcdir/FunctionalPlus"
  git -c protocol.file.allow=always submodule update

  # Add missing cstdint include
  patch -Np1 -i ../"$pkgname.patch"
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 "$pkgname/src/$pkgname-qt/resources/$pkgname-logo.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
