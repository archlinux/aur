# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=rpmrebuild
_ver=2.21
_rel=1
pkgver=${_ver}.${_rel}
pkgrel=1
pkgdesc="A tool to build an RPM file from an existing package that has already been installed."
arch=('any')
url='https://sourceforge.net/projects/rpmrebuild'
license=('GPL-2.0-or-later')
depends=('bash' 'rpm-tools')
makedepends=('tar')
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${_ver}/${pkgname}-${_ver}.tar.gz"{,.sig})
validpgpkeys=('F80D3B85029F2DACC6A8469A364644463D1079A1') # Eric Gerbier
noextract=("${pkgname}-${_ver}.tar.gz")
sha256sums=('e7e94ce068878cdb8041602dc41f03e6271835df0b125066cb6fed8c367dfee4'
            'SKIP')

prepare() {
    cd "$srcdir"
    mkdir "$pkgname-$pkgver"
    # we need to use tar (and not bsdtar) because the archive includes hardlinks, which bsdtar doesn't handle very well.
    tar -xf "${pkgname}-${_ver}.tar.gz" -C "$pkgname-$pkgver"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
