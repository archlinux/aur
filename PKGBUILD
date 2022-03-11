# Maintainer: flbzh <frederic_lebouc (a) yahoo.fr>
# Contributor: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: Tavian Barnes <tavianator (a) tavianator.com>
# Contributor: jhorcl
pkgname=mozillavpn-git
pkgver="v2.7.1"
pkgrel=1
pkgdesc="A fast, secure and easy to use VPN. Built by the makers of Firefox."
arch=('i686' 'x86_64')
url="https://vpn.mozilla.org/"
license=('GPL')
depends=('polkit'
         'libxcb'
         'libxmu'
         'libxrender'
         'libtiff'
         'libxdmcp'
         'dbus'
         'freetype2'
         'qt5-charts'
         'qt5-declarative'
         'qt5-websockets'
         'qt5-graphicaleffects'
         'qt5-imageformats'
         'qt5-networkauth'
         'qt5-quickcontrols2'
         'qt5-svg'
         'hicolor-icon-theme'
         'wireguard-tools'
         'WIREGUARD-MODULE'
         'openresolv')
makedepends=('qt5-tools' 'go' 'flex' 'python-pip' 'python-yaml')

source=(
    "${pkgname}-${pkgver}::git+https://github.com/mozilla-mobile/mozilla-vpn-client.git#tag=${pkgver}"
)

sha256sums=(
    'SKIP'
)

build() {
    cd "${pkgname}-${pkgver}"
    git submodule init
    git submodule update

    # Without this, pip3 user installed packages are not properly detected...
    export PATH=$HOME/.local/bin:$PATH

    # TODO: is it a good idea to "force" that here and so ?
    pip3 install -r requirements.txt --user

    python3 ./scripts/generate_glean.py
    python3 ./scripts/importLanguages.py

    # Linker flags removed from the "production" build:
    # * -Wl,-O1
    # * -O2

    # Compiler flags removed from the "production" build:
    # * -O2 -Wp,-D_FORTIFY_SOURCE=2
    # * -flto -fno-fat-lto-objects

    qmake PREFIX=/usr CONFIG+=debug \
        QMAKE_LFLAGS='-Wl,--sort-common,--as-needed,-z,relro,-z,now -pipe -march=x86-64 -mtune=generic -pipe -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security -fstack-clash-protection -fcf-protection -Wp,-D_GLIBCXX_ASSERTIONS -std=gnu++1z -pthread -flto=4 -fno-fat-lto-objects -fuse-linker-plugin -fPIC' \
        QMAKE_CFLAGS='-pipe -march=x86-64 -mtune=generic -fno-plt -fexceptions -Wformat -Werror=format-security -fstack-clash-protection -fcf-protection -pthread -Wall -Wextra -D_REENTRANT -fPIC $(DEFINES)' \
        QMAKE_CXXFLAGS='-pipe -march=x86-64 -mtune=generic -fno-plt -fexceptions -Wformat -Werror=format-security -fstack-clash-protection -fcf-protection -Wp,-D_GLIBCXX_ASSERTIONS -std=gnu++1z -pthread -Wall -Wextra -D_REENTRANT -fPIC $(DEFINES)'

    make all
}

package() {
    cd "${pkgname}-${pkgver}"
    make INSTALL_ROOT="$pkgdir" install
    install -dm 755 "$pkgdir/usr/lib/systemd/system"
    install -Dm 644 "linux/mozillavpn.service" "$pkgdir/usr/lib/systemd/system"
}
