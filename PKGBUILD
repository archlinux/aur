# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=('enchant-pure')

_pkgname=enchant
pkgver="1.6.1.r74.e412b19"
_commithash="e412b1998ec0071a5d55fe5f9decd2c4df18b122"
pkgrel=1

pkgdesc="A wrapper library for pure and generic spell checking for all languages, supporting Aspell and Myspell/Hunspell backend engines"
url="https://github.com/AbiWord/enchant"

arch=('any')
license=('LGPL')

depends=('aspell>=0.50.0' 'dbus-glib>=0.62' 'hunspell')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!libtool')
source=("enchant-${pkgver}.tar.gz::https://github.com/AbiWord/${_pkgname}/archive/${_commithash}.tar.gz"
        "warnings-fix.patch" "configure.patch")
sha512sums=('a176d265fed76636da464a0fe7527162ca1d5367f5409dd836eab48f3eae53b1329bf52c33c07d82aba4845f55493801494843363ef4dd35d748b7cc858a4a00'
            '33312d3714eef836764aeab538517fbe5c44b72593ce9d68e4161d22139c0a859c4a619090c454451db3e2c14790b36c50c1f8ebfcbffe4498b6ee4d5a04faaa'
            'c2b889eb336e44690278768d67464be14a73e24b1bc9078e226efbdc63e4a46e9c86adbc111dc51dbbcac82f0f84a1bb37c612d70067ced0016053a2fd836f77')

prepare() {
  mv "${srcdir}/${_pkgname}-${_commithash}/" "${srcdir}/${_pkgname}-${pkgver}"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ../warnings-fix.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./autogen.sh --prefix=/usr --enable-static=no --disable-ispell --disable-voikko --disable-uspell --disable-hspell --enable-zemberek=no --with-myspell-dir=/usr/share/myspell
  patch -p1 -i ../configure.patch
  ./configure --prefix=/usr --enable-static=no --disable-ispell --disable-voikko --disable-uspell --disable-hspell --enable-zemberek=no --with-myspell-dir=/usr/share/myspell
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

