# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=yubioath-desktop
pkgdesc='Yubico Authenticator for Desktop'
pkgver=5.0.1
pkgrel=2
arch=('x86_64')
url='https://github.com/Yubico/yubioath-desktop'
license=('BSD')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols2'
         'python-pyotherside' 'qt5-graphicaleffects' 'ccid' 'pcsclite'
         'yubikey-manager')
makedepends=('git' 'python')
source=("git+$url.git#tag=$pkgname-$pkgver?signed"
        "0001-catch-expection-in-signal-signal.patch::$url/commit/99be0c8f91e50f8777ab77818682951e3d162135.patch"
        "0002-move-signal-handler-setup-to-cpp-layer.patch::$url/commit/729339d2be10e597c4eac06ebe4cd683b55c2ff7.patch"
        "0003-support-both-unix-and-windows-variants-of-the-signal-api.patch::$url/commit/2066904b3c58aeaa8ee5000f6698a7e70c76fd93.patch")
validpgpkeys=('8D0B4EBA9345254BCEC0E843514F078FF4AB24C3'        # Dag Heyman <dag@yubico.com>
              '57A9DEED4C6D962A923BB691816F3ED99921835E')       # Emil Lundberg <emil@yubico.com>
sha512sums=('SKIP'
            'a55a5beb5650ed8739792392e4a77aa327714cbb95d9be9161e0a7d2eec39b4730a77ff7056f90be08b406b4be7579be3c492b35909a00253f70d507ae9f78c7'
            'ab582153a3237c2f213da5a5c49882fe7ac436fd0754887c952a94655906296f5d92c972ed5004deb64c7b92ed9895c7497f31028590e8f58892a3595bb89113'
            'bd45b58bbd3c015c39a78e0fbbcdc2dcc284b312c6822dc9c64ae373f918652ace0dcb59d3bfb3ed69759e8c0f82c0fa2a318bdc7fbf6e99561b53f7e7547414')

prepare() {
  cd $pkgname

  patch -p1 -i ../0001-*.patch
  patch -p1 -i ../0002-*.patch
  patch -p1 -i ../0003-*.patch
}

build() {
  cd $pkgname

  qmake . \
    PREFIX=/usr \
    QMAKE_CFLAGS_RELEASE="$CFLAGS" \
    QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS"

  make
}

package() {
    cd $pkgname

    make INSTALL_ROOT="$pkgdir" install

    install -Dm 644 debian/copyright "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    install -Dm 644 resources/icons/yubioath.svg "$pkgdir"/usr/share/pixmaps/yubioath.svg
    install -Dm 755 resources/yubioath-desktop.desktop "$pkgdir"/usr/share/applications/yubioath-desktop.desktop
}

