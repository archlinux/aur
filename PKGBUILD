# Maintainer: Lev Lybin <lev.lybin at gmail dot com>
# Maintainer: Maksym Sheremet <msheremet at sheremets dot com>

pkgname=upwork
pkgver=4.2.153.0
_rawver=${pkgver//./_}
_hashver="tkzkho5lhz15j08q"
pkgrel=3
pkgdesc="Desktop App (aka Team App) Standard version"
arch=('i686' 'x86_64')
url="https://www.upwork.com/downloads?source=Footer"
license=('custom')
conflicts=('upwork-alpha' 'upwork-appimage' 'upwork-beta')
depends=('alsa-lib' 'gconf' 'gtkglext' 'libgcrypt15' 'libxss' 'libxtst' 'nss')
makedepends=('gobject-introspection' 'help2man' 'gtk-doc' 'git')  # needed to build pango
install=upwork.install

source=("LICENSE" "git+https://git.gnome.org/browse/pango#commit=6c5d1d35061a91c3c0792f7720da3f8308ebff65")
md5sums=('1a87c2b530067bcf4c632e49c18af484' 'SKIP')
md5sums_i686=('fa3aa945068e49081e1ac2cc7490032b')
md5sums_x86_64=('6c33e3ff5ae168c840f46887d690fd5e')
# how to get links Standard, Beta, Alpha: grep "https://updates-desktopapp.upwork.com/binaries" ~/.Upwork/Upwork/Logs/* | tail -n 4
source_x86_64=(upwork_amd64_${pkgver}.deb::https://updates-desktopapp.upwork.com/binaries/v${_rawver}_${_hashver}/upwork_amd64.deb)
source_i686=(upwork_i386_${pkgver}.deb::https://updates-desktopapp.upwork.com/binaries/v${_rawver}_${_hashver}/upwork_i386.deb)

prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
    cd pango
    NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${srcdir}/pango"
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd "${srcdir}/pango"
  make -k check || :
}

package() {
    cd "${srcdir}"
    cp -rp usr "${pkgdir}/usr"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
