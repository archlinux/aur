# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=libmega-git
pkgname=('libmega-git'
         'megasync-daemon-git'
         'megasync-cli-git'
         'python-megasync-git'
         'fuse-megasync-git'
         )
pkgver=v3.6.6a.314.gd808462b0
pkgrel=1
pkgdesc="Sync your files to your Mega account. (GIT Version)"
arch=('x86_64')
url='https://mega.co.nz/#sync'
license=('custom:MEGA')
source=('git+https://github.com/meganz/sdk.git'
        'megasync.conf'
        'megasyncd.service'
        )
makedepends=('qt5-svg'
             'c-ares'
             'libuv'
             'crypto++'
             'libsodium'
             'git'
             'qt5-tools'
             'cython'
             'python'
             'swig'
             'fuse2'
             'libraw'
             'ffmpeg'
             'libmediainfo'
             'libuv'
             'chrpath'
             )
sha256sums=('SKIP'
            'a3d30b3e198c3c117b2dd3144acaeb66117ee013744d2a0f39e9d4624b979a22'
            '73600a6d5e7ddbb6d0a3eff22aa05cc22715c2b02be7e62d16c2c71ac17a5ad5'
            )

pkgver() {
  cd sdk
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  (git clone "${srcdir}/sdk" build; cd build; ./autogen.sh)
  (git clone "${srcdir}/sdk" build-python; cd build-python; ./autogen.sh)
}

build() {
  msg2 "Build libmega and programs"
  cd "${srcdir}/build"
  ./configure \
    --prefix=/usr \
    --without-freeimage

  sed '/install-binPROGRAMS: install-libLTLIBRARIES/d' -i Makefile

  make

  msg2 "Build Python bindings"
  cd "${srcdir}/build-python"
  ./configure \
    --prefix=/usr \
    --without-freeimage \
    --disable-examples \
    --enable-python \
    --with-python3

  make

  cd bindings/python
  python setup.py build

}

package_libmega-git() {
  pkgdesc="MEGASync libs (GIT Version)"
  conflicts=('libmega')
  provides=('libmega')
  depends=('c-ares'
           'crypto++'
           'libsodium'
           'ffmpeg'
           'libraw'
           'libuv'
           'libmediainfo'
           'sqlite'
           )
  optdepends=('python-megasync-git: python bindings'
              'python2-megasync-git: python2 bindings'
              )
  make -C build DESTDIR="${pkgdir}" install-data install-libLTLIBRARIES install-pkgconfigDATA

  install -Dm644 sdk/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_fuse-megasync-git() {
  pkgdesc="MEGASync client based on FUSE (GIT Version)"
  conflicts=('fuse-megasync')
  provides=('fuse-megasync')
  depends=(libmega-git
           'fuse2'
           'gcc-libs'
           )

  make -C build DESTDIR="${pkgdir}" install-binPROGRAMS
  rm -fr "${pkgdir}/usr/bin/megacli"
  rm -fr "${pkgdir}/usr/bin/megasimplesync"

  install -Dm644 sdk/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_megasync-daemon-git() {
  pkgdesc="MEGASync daemon client. (GIT Version)"
  conflicts=('megasync-daemon')
  provides=('megasync-daemon')
  depends=('libmega-git')
  options=('!emptydirs')
  backup=('etc/conf.d/megasync.conf')

  make -C build DESTDIR="${pkgdir}" install-binPROGRAMS
  rm -fr ${pkgdir}/usr/bin/megacli
  rm -fr ${pkgdir}/usr/bin/megafuse

  install -Dm644 "${srcdir}/megasyncd.service" "${pkgdir}/usr/lib/systemd/system/megasyncd.service"
  install -Dm600 "${srcdir}/megasync.conf" "${pkgdir}/etc/conf.d/megasync.conf"
  install -d "${pkgdir}/srv/mega"
  install -dm700 "${pkgdir}/var/mega"

  install -Dm644 sdk/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_megasync-cli-git() {
  pkgdesc="MEGASync CLI client. (GIT Version)"
  conflicts=('megasync-cli')
  provides=('megasync-cli')
  depends=('libmega-git')

  make -C build DESTDIR="${pkgdir}" install-binPROGRAMS
  rm -fr ${pkgdir}/usr/bin/megafuse
  rm -fr ${pkgdir}/usr/bin/megasimplesync

  install -Dm644 sdk/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-megasync-git() {
  pkgdesc="Python Bindings for MEGASync. (GIT Version)"
  conflicts=('python-megasync')
  provides=('python-megasync')
  depends=('libmega-git'
           'python'
           )

#   make -C build-python DESTDIR="${pkgdir}" install-pkgpythonPYTHON install-pkgpyexecLTLIBRARIES install-nodist_pkgpythonPYTHON

  cd build-python/bindings/python
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  _sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"
  rm -fr ${pkgdir}${_sites_packages}/mega/libmega.so
  chrpath -d ${pkgdir}${_sites_packages}/mega/_mega.so

  install -Dm644 "${srcdir}/sdk/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
