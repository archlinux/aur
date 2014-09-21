# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=ompl
pkgver=0.14.2
pkgrel=2
pkgdesc="The Open Motion Planning Library (OMPL) consists of many state-of-the-art sampling-based motion planning algorithms"
arch=('i686' 'x86_64')
url="http://ompl.kavrakilab.org/"
license=('BSD')
depends=('boost-libs' 'python' 'python-matplotlib')
makedepends=('boost' 'cmake')
optdepends=('py++: Python binding'
            'ode: Plan using the Open Dynamics Engine')
source=(https://bitbucket.org/ompl/ompl/downloads/${pkgname}-${pkgver}-Source.tar.gz
        boost_1_56.patch)
md5sums=('43ea02ca9ffff1719a87edf570874eaf'
         '8087bef2cfce7d95edee33ae85d3864f')
sha256sums=('a3a0f328d7acb22b20f6aab45a7dbf5b5182dc0c959a967232cccca5ad2de2b1'
            '87da05e25991a663a619917b944c6f37623a70e4af700eeb4069a38623ed4558')
sha384sums=('d5d3dad206208939611257d64a2aa2042414318243b3685b45a21dc77639f201989b4f53bdf1ab1058755e696a65573f'
            '080a77a1ee40a9e066ec4d11d53f83d1dce120f601bbb9f4d4324a817e62479a6b8037aa76040ffc6a83ce90fbfa927f')
sha512sums=('e2df279622dbeccfa28e8ed3ff7f46ad94bdc978599207aff74622e954591736c4e9b9a1b828c330059b12ed655293360a8e92d805c7082b9036c066799c5d45'
            'f02e23c6c825577cc8e40eaeab5d9c5420df7923b6d91dbc37244a6e2b149c4e76e4d3b102807e0bcc9777cfd9a6102e7137d46a6b8e131e14c72261b285889a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  patch -p 0 < ${srcdir}/boost_1_56.patch

  rm -rf build
  mkdir build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXEC=/usr/bin/python2 \
    -DCMAKE_CXX_FLAGS=-D_POSIX_VERSION \
    -DOMPL_REGISTRATION=Off ..
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  cd build
  #make test
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd build
  make DESTDIR=${pkgdir} install
}

