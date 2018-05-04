pkgname=upwork-latest
pkgver=5.1.0.509
_rawver=${pkgver//./_}
_hashver="87zq7fllb6sf8y49"
pkgrel=1
pkgdesc="Desktop App (aka Team App) Standard Latest version"
arch=('x86_64')
url="https://www.upwork.com/downloads?source=Footer"
license=('custom')
conflicts=('upwork' 'upwork-alpha' 'upwork-appimage' 'upwork-beta')
depends=('alsa-lib' 'gconf' 'gtkglext' 'libgcrypt15' 'libxss' 'libxtst' 'nss')
makedepends=('git' 'gtk-doc')  # needed to build pango
install=upwork.install

source=("LICENSE" "git+https://git.gnome.org/browse/pango#commit=6c5d1d35061a91c3c0792f7720da3f8308ebff65")
md5sums=('bb535c74d4673cee6437b04d33b32138' 'SKIP')
# how to get links Standard, Beta, Alpha: grep "https://updates-desktopapp.upwork.com/binaries" ~/.Upwork/Upwork/Logs/* | tail -n 4
source_x86_64=(upwork_amd64_${pkgver}.deb::https://updates-desktopapp.upwork.com/binaries/v${_rawver}_${_hashver}/upwork_${pkgver}_amd64.deb)
md5sums_x86_64=('e9701690c32a84ceaf1e93a104471040')
#source_i686=(upwork_i386_${pkgver}.deb::https://updates-desktopapp.upwork.com/binaries/v${_rawver}_${_hashver}/upwork_i386.deb)

prepare() {
    cd "${srcdir}"
    tar -xf "${srcdir}/data.tar.xz"
### BEGIN pango section ###
    cd pango
    NOCONFIGURE=1 ./autogen.sh
### END pango section ###
}

### BEGIN pango section ###
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
### END pango section ###

package() {
    cd "${srcdir}"
    cp -rp usr "${pkgdir}/usr"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/upwork/LICENSE"
### BEGIN pango section ###
    install -Dm755 "${srcdir}/pango/pango/.libs/libpangoft2-1.0.so.0.4000.5" \
                   "${pkgdir}/usr/share/upwork/libpangoft2-1.0.so.0.4000.5"
    ln -s "libpangoft2-1.0.so.0.4000.5" "${pkgdir}/usr/share/upwork/libpangoft2-1.0.so.0"
### END pango section ###
}
