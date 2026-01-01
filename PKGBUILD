# Maintainer: Thomas Touhey <thomas@touhey.fr>
_pkgname=cahute
pkgname=mingw-w64-$_pkgname
pkgver=0.6
pkgrel=2
pkgdesc="A toolkit to handle communication and file formats related to CASIO calculators (mingw-w64)"
url="https://cahuteproject.org"
arch=('any')
license=('custom:CeCILL')
depends=('mingw-w64-crt' 'mingw-w64-libusb')
makedepends=('mingw-w64-cmake' 'python' 'python-toml')
provides=("mingw-w64-cahute")
conflicts=("mingw-w64-cahute")
options=('!buildflags' '!strip')
source=("https://ftp.cahuteproject.org/releases/$_pkgname-$pkgver.tar.gz"
        "2024-12-21-0eb968c38ccdb438803cb6ffa6e1ada818fa66d5.patch")
b2sums=('686b39fd9857afe5758a4cb95e8b889516d80dc7f02507eedc83bb08f4649ba44f816c8d4e756dce044e3c265316e9f884b069ba78efec182c91b3ce4e4d49fc'
        'ad4c3c6fafcbc7ae20567d326d5a85059296f9b9b4ddf61d4c01addbe7657e0e750b7b15c0ce03e1ac70c09fb4c1da8e7d0c585ef14889679daf482d18096076')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd "$_pkgname-$pkgver"
    patch -p1 <../../2024-12-21-0eb968c38ccdb438803cb6ffa6e1ada818fa66d5.patch
}

build() {
    for _arch in ${_architectures}; do
        ${_arch}-cmake -S $_pkgname-${pkgver} -B build/${_arch} \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
            -DCAHUTE_CLI=OFF

        cmake --build build/${_arch}
    done
}

package() {
    for _arch in ${_architectures}; do
        DESTDIR="$pkgdir" cmake --install build/${_arch} --strip
    done

    install -Dm644 "$_pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
