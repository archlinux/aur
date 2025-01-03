# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: GordonGR <gordongr@freemail.gr>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Merkil <merkil@savhon.org>

_name="libmad"
pkgname="lib32-${_name}"
pkgver=0.15.1b
pkgrel=1
pkgdesc="A high-quality MPEG audio decoder (32-bit)"
arch=('x86_64')
url="https://www.underbit.com/products/mad"
license=('GPL-2.0-or-later')
depends=('lib32-glibc' "${_name}")
provides=("${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://downloads.sourceforge.net/sourceforge/mad/${_pkgsrc}.tar.gz"
        "${_pkgsrc}.tar.gz.sign::https://downloads.sourceforge.net/sourceforge/mad/${_pkgsrc}.tar.gz.sign"
        "${_name}-pkgconfig.patch"
        "${_name}-amd64-64bit.diff"
        "${_name}-md_size.diff"
        "${_name}-length-check.patch"
        "${_name}-0.15.1b-gcc43.patch")
sha512sums=('2cad30347fb310dc605c46bacd9da117f447a5cabedd8fefdb24ab5de641429e5ec5ce8af7aefa6a75a3f545d3adfa255e3fa0a2d50971f76bc0c4fc0400cc45'
            'SKIP'
            'ff815f5aa32aec4230351b258430ca2184c0a44f80845c92b46aedb9942b3cd85c7b3aa575f4f562a5e02f7fadf6f3d6fe06e64d2b65418dbcd10762214695b1'
            '4fc15af4ef497220ee75e3798fbf504be2495fded7202b202169440a387573a3b3105a278d6e5c2ae10d2351a6f9b61895ccde323787314605519ffa23bb080f'
            '511fc4496044bc676e1957c5085aded89e33248c5ee4c965c76c609904086911dcc912a943be98244b2d7e5f140f432584722cc3b53fdb27265328322a727427'
            'dd412962246d4c9db8c07dbafcaba2f64fdc0c94cf6bcc3f4f0f88a92800f40e550cc56dc8a2324c0123d9c70a89055dc50cd714206d7886e2f6877d4cc26600'
            '464a81b5ec9cac77fe8913de5625bb1dcbaa761f83508afe49a216e8d3fe85d10afee7bdc0922606c3fadc3894b07edc758f36c112612a5a5daadd58216d3dca')
validpgpkeys=('4229B6BBA00DE143B485B74D2CE2036B4BF38A33') # Rob Leslie <rob@underbit.com>

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_name}-pkgconfig.patch"
  patch -Np1 -i "${srcdir}/${_name}-amd64-64bit.diff"
  patch -Np1 -i "${srcdir}/${_name}-md_size.diff" # CVE-2017-8372 CVE-2017-8373
  patch -Np1 -i "${srcdir}/${_name}-length-check.patch" # CVE-2017-8374
  patch -Np1 -i "${srcdir}/${_name}-0.15.1b-gcc43.patch"
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  autoconf
  ./configure \
    --prefix='/usr' \
    --program-suffix="-32" \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "include"
}
