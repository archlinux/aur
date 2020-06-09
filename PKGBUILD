# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Lantald <lantald at gmx.com>
# Contributor: Thomas Dziedzic <gostrc at gmail>
# Contributor: dibblethewrecker <dibblethewrecker.at.jiwe.dot.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Eric Forgeot <http://esclinux.tk>

_pkgname=qgis
pkgname="$_pkgname"-ltr
pkgver=3.10.6
pkgrel=2
pkgdesc='Geographic Information System (GIS); Long Term Release'
url='https://qgis.org/'
license=(GPL)
arch=(x86_64)
depends=(desktop-file-utils exiv2 gdal hicolor-icon-theme libzip python-qscintilla-qt5 qca qt5-3d
         qt5-serialport qt5-webkit qtkeychain qwtpolar spatialindex python-sip)
makedepends=(cmake fcgi gsl python-six qt5-tools txt2tags sip python-setuptools)
optdepends=('fcgi: Map server'
            'gpsbabel: GPS Tools plugin'
            'gsl: Georeferencer plugin'
            'python-gdal: DB Manager plugin; Processing plugin'
            'python-jinja: MetaSearch plugin'
            'python-owslib: MetaSearch plugin'
            'python-psycopg2: DB Manager plugin; Processing plugin'
            'python-pygments: MetaSearch plugin'
            'python-numpy: Processing plugin'
            'python-yaml: Processing plugin')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("https://qgis.org/downloads/$_pkgname-$pkgver.tar.bz2"
        qgis-pyqt5-sip5.patch
        include-QPainterPath.patch
        t2t-toc-level.patch
        qgis-qt-5.15-1.patch::https://github.com/qgis/QGIS/pull/37250/commits/572d092df4f7d985bca11050430e0a4adcb20e6e.patch
        qgis-qt-5.15-2.patch::https://github.com/qgis/QGIS/pull/37250/commits/02c949d3edf2da0fc19f2ff7e1c91fe70d4fadab.patch
        qgis-qt-5.15-3.patch::https://github.com/qgis/QGIS/pull/37250/commits/7b7dd795bb4541a02f7c6c93172b91ab2fd0f062.patch
        qgis-qt-5.15-4.patch::https://github.com/qgis/QGIS/pull/37250/commits/b1dd36c52067ee357fbd0bcf70cb2f6717bf2699.patch
        qgis-qt-5.15-5.patch::https://github.com/qgis/QGIS/pull/37250/commits/a1f74450953594e870ded4cd6c3ae01900041c2d.patch
        qgis-qt-5.15-6.patch::https://github.com/qgis/QGIS/pull/37250/commits/560003668fb91b6b4bd6470babb99e2ac9ddf234.patch
        qgis-qt-5.15-7.patch::https://github.com/qgis/QGIS/pull/37250/commits/21b42cb80f9d39c756ab8691bd26ed7e90dea7fc.patch
        qgis-qt-5.15-8.patch::https://github.com/qgis/QGIS/pull/37250/commits/7e4e6f36f17416931166a3d89e7ab2cf3872b210.patch
        qgis-qt-5.15-9.patch::https://github.com/qgis/QGIS/pull/37250/commits/adb616f9109d0b17cda89479a1dbfa99966587bd.patch
)
# curl https://qgis.org/downloads/qgis-latest-ltr.tar.bz2.sha256
sha256sums=('a96791bf6615e4f8ecdbbb9a90a8ef14a12459d8c5c374ab22eb5f776f864bb5'
            '47fdab75c94ecf5b61a41b334e23714226e895cef507c35a3bc4b46c7d307981'
            'f8a158da9eb9130bba50c17bca266cbdb6adf1004f1c5fa375a9bbf8a1b1f5e2'
            'f7e91914cfe366a63383b39c63d5731f6f20a1a0a0d7e9f3d16809a40bb5acff'
            '6eefa66b4971078f4df7df2cb598b1947a69ea41d775d8a0588886af864cea9d'
            '83a424a2749cb429b71b73cebcf37a83dd220e2df459c3f0756d5759c31c6b31'
            'b5f0ea8ef2962550b32e6f2e0211c3511563d99cba440b159791ea50522aca8b'
            'f52f1ed426711cb203b5b7697a0b0fc253839cd841c6633b6c8103280e00bdeb'
            '068311e8bffd7a3708173cd1f3aa2131afd7d9e9dc5a4adaac94700292017201'
            'da6b1e21daa88e2788a330b240efe80d8aff1365eec58f6bdf61af9878d8c868'
            '137f0cf56be3f8e986dd71c80f6dcb9b54bc81465fa313147557ef19ac3d5b2b'
            '575f44c354bebfeba348b4ee70b6b5c570e2ebcc2086138184a1a0b9c789baa5'
            '52fe6f123f8aeb34db835e036282248f44452f97e64e636a174b3bf84dcead73')

prepare() {
  mkdir -p build
  cd "$_pkgname-$pkgver"
  patch -p1 -i ../qgis-pyqt5-sip5.patch  # Use new pyqt sip file location
  patch -p1 -i ../include-QPainterPath.patch  # Add missing includes
  patch -p1 -i ../t2t-toc-level.patch  # --toc-level has been removed in txt2tags
  for i in 1 2 3 4 5 6 7 8 9; do
      patch -p1 -i ../qgis-qt-5.15-$i.patch
  done
}

build() {
  cd build
  cmake -G "Unix Makefiles" ../"$_pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_3D=TRUE \
    -DWITH_SERVER=TRUE \
    -DWITH_CUSTOM_WIDGETS=TRUE \
    -DBINDINGS_GLOBAL_INSTALL=TRUE \
    -DQGIS_MANUAL_SUBDIR=share/man \
    -DWITH_QWTPOLAR=TRUE \
    -DWITH_INTERNAL_QWTPOLAR=FALSE
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
