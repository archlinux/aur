# Maintainer: Maël Kerbiriou <m431.kerbiriou@MountainView>
pkgname=naf-git
_pkgname=naf
pkgver=1.0.0.r92.g814c820
pkgrel=1
pkgdesc="Nucleotide Archival Format - Compressed file format for DNA/RNA/protein sequences"
arch=('i686' 'x86_64')
url="http://kirill-kryukov.com/study/naf/"
license=('custom')
depends=('glibc')
makedepends=('git' 'gcc' 'make')
replaces=('naf')
conflicts=('naf')
source=("git+https://github.com/KirillKryukov/naf.git#branch=develop"
        "git+https://github.com/facebook/zstd.git")
sha1sums=('SKIP' 'SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/${_pkgname}
  git submodule init
  git config submodule.zstd.url ${srcdir}/zstd
  git submodule update
}

build() {
    cd ${srcdir}/${_pkgname}
    make
}

package() {
    cd ${srcdir}/${_pkgname}
    make DESTDIR="${pkgdir}" prefix=/usr/ install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/naf/LICENSE"
}
