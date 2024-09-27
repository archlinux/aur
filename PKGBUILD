# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pkgname=libcmatrix
pkgname=$_pkgname-lite
pkgver=3.11.0
pkgrel=1
pkgdesc="A library designed for numerical studies of problems in NMR"
arch=(x86_64)
url="https://www.dur.ac.uk/departments/academic/chemistry/about-us/solid-state-nmr/research-profile/equipment-and-software"
license=(MIT)
depends=(gcc-libs)
makedepends=(root cblas lapacke)
source=(https://www.dur.ac.uk/media/training/file-types-test/pNMRsim.zip
        LICENSE
        $_pkgname-3.11.0-gcc5.2.patch
        $_pkgname-3.11.0-shared.patch
        $_pkgname-3.2.1-gcc4.7.patch
        $_pkgname-3.9.0-atlas.patch
        $_pkgname-3.11.0-sse.patch)
sha256sums=('9eff652c726ed990ff5fd7108c7f58e52d4f5e110ca6446da87c4021879a5e2b'
            '2963a12ca6d9dc877463101cd8e13ceaa58b34b545f3f6d80c1313f1ee6b1b06'
            '58a1278a8f1323bd201979cdce8ecdc390ce8825f58a1d143264455d5bc0f80c'
            'e52c2adb42f5a2836db1e71e4ae2f3235e58bc5c92b04594069548201fd821cf'
            'bc4eec9967be3d9ad520d1750abb23f5b6732b8352c7ad61f54c78fb7c9d6312'
            'fc4463ff41d3a691b351f4891bcd2fb3177ce3c04f0f4d2f3d398e5b64c26b0a'
            '91cdf928663ba79cd6f4aa7a4c5d198d6e6d86407fad1640cf6b2c4a66aa106a')

prepare() {
  tar xzf pNMRsim/libcmatrixR3_lite.tar.gz -C .
  mv "$srcdir/libcmatrixR3" "$srcdir/$_pkgname-$pkgver"
  cd "$srcdir/$_pkgname-$pkgver"

  patch -p1 < ../$_pkgname-3.11.0-shared.patch
  patch -p1 < ../$_pkgname-3.2.1-gcc4.7.patch
  patch -p1 < ../$_pkgname-3.9.0-atlas.patch
  patch -p1 < ../$_pkgname-3.11.0-gcc5.2.patch
  patch -p1 < ../$_pkgname-3.11.0-sse.patch

  autoupdate -f configure-compiler.ac
  autoupdate -f configure-libraries.ac
  autoupdate -f configure.ac

  AUTOHEADER=true autoreconf -ifv configure.ac

  sed -i 's/latlas/lcblas/g' configure
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --includedir=/usr/include/$_pkgname \
    --with-sse \
    --with-atlas \
    --with-minuit \
    --without-mpi \
    CXX=g++ \
    CXXFLAGS="$CXXFLAGS -DHAVE_LIBLAPACK -I/usr/include/openblas -I/usr/include/openblas64" \
    ATLAS_CFLAGS='-I/usr/include' \
    ATLAS_LIBS='-lcblas' \
    LDFLAGS='-L/usr/lib -L/usr/lib/root'
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -dm 755 "$pkgdir"/usr/{include/$_pkgname,lib}
  install -m755 include/*.h "$pkgdir/usr/include/$_pkgname"
  install -m755 lib/$_pkgname.so.$pkgver "$pkgdir/usr/lib"

  cd "$pkgdir/usr/lib"
  ln -sf $_pkgname.so.$pkgver $_pkgname.so.3
  ln -sf $_pkgname.so.3 $_pkgname.so

  install -Dm755 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
