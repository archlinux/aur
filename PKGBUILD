# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Archimede Pitagorico <archimede.pitagorico@mail.com>
# Contributor: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>

pkgbase=megasync-git
pkgname=('libmega-git'
         'megasync-git'
         'megasync-daemon-git'
         'megasync-cli-git'
         'python-megasync-git'
         'python2-megasync-git'
         'fuse-megasync-git'
         )
pkgver=v3.5.0.0.32.g5eb57c4f
pkgrel=1
pkgdesc="Sync your files to your Mega account. (GIT Version)"
arch=('i686' 'x86_64')
url='https://mega.co.nz/#sync'
license=('custom:MEGA')
source=('git+https://github.com/meganz/MEGAsync.git'
        'git+https://github.com/meganz/sdk.git'
        'mega.svg'
        'megasync.conf'
        'megasyncd.service'
        )
makedepends=('qt5-base'
             'c-ares'
             'libuv'
             'curl'
             'crypto++'
             'libsodium'
             'git'
             'qt5-tools'
             'cython'
             'python'
             'cython2'
             'python2'
             'swig'
             'fuse2'
             'pcre'
             )
sha256sums=('SKIP'
            'SKIP'
            'c0abfeafb541509923c85d253f6f64dae8a49e9ae4b067f5c0c484ff1d924403'
            'a3d30b3e198c3c117b2dd3144acaeb66117ee013744d2a0f39e9d4624b979a22'
            '73600a6d5e7ddbb6d0a3eff22aa05cc22715c2b02be7e62d16c2c71ac17a5ad5'
            )
options=('!buildflags')

pkgver() {
  cd MEGAsync
  echo "$(git describe --long --tags | tr - . | tr _ . | sed 's|OSX\.||' | sed 's|Win\.||' | sed 's|Linux\.||' )"
}

prepare() {
  (git clone "${srcdir}/sdk" build; cd build; ./autogen.sh)
  (git clone "${srcdir}/sdk" build-python2; cd build-python2; ./autogen.sh)

  cd MEGAsync
  git config submodule.src/MEGASync/mega.url "${srcdir}/sdk"
  git submodule update --init

  cd src/MEGASync/mega
  ./autogen.sh
}

build() {
  msg2 "Build libmega and programs, include Python bindings"
  cd "${srcdir}/build"
  ./configure \
    --prefix=/usr \
    --without-freeimage \
    --enable-python \
    --with-python3

  make

  msg2 "Build python2 bindings"
  cd "${srcdir}/build-python2"
  PYTHON=python2 \
  PYTHON_VERSION="$(python2 -c "import platform; print('.'.join(platform.python_version_tuple()[:2]))")" \
  ./configure \
      --prefix=/usr \
      --without-freeimage \
      --disable-examples \
      --enable-python

  make

  msg2 "Build MEGASync"
  cd "${srcdir}/MEGAsync/src/MEGASync/mega"
  ./configure \
    --prefix=/usr \
    --without-freeimage

  cd "${srcdir}/MEGAsync/src/MEGASync"
  lrelease-qt5 MEGASync.pro
  qmake-qt5 CONFIG+=debug MEGASync.pro
  make
}

package_megasync-git() {
  pkgdesc="MEGASync Desktop App. (GIT Version)"
  conflicts=('megasync'
             'megatools'
             )
  provides=('megasync')
  depends=('qt5-base'
           'c-ares'
           'libuv'
           'curl'
           'crypto++'
           'libsodium'
           'hicolor-icon-theme'
           )

  install -Dm644 MEGAsync/LICENCE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 MEGAsync/src/MEGASync/megasync "${pkgdir}/usr/bin/megasync"
  install -Dm644 MEGAsync/src/MEGASync/platform/linux/data/megasync.desktop "${pkgdir}/usr/share/applications/megasync.desktop"
  sed 's|System;||g' -i "${pkgdir}/usr/share/applications/megasync.desktop"
  install -Dm644 "${srcdir}/mega.svg" "${pkgdir}/usr/share/pixmaps/mega.svg"
}

package_libmega-git() {
  pkgdesc="MEGASync libs (GIT Version)"
  conflicts=('libmega')
  provides=('libmega')
  depends=('c-ares'
           'curl'
           'crypto++'
           'libsodium'
           'sqlite'
           )

  install -Dm644 MEGAsync/LICENCE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make -C build DESTDIR="${pkgdir}" install-data
  make -C build DESTDIR="${pkgdir}" install-libLTLIBRARIES
  make -C build DESTDIR="${pkgdir}" install-pkgconfigDATA
  make -C build DESTDIR="${pkgdir}" install-pkglibLTLIBRARIES
  make -j1 -C build DESTDIR="${pkgdir}" uninstall-pkgpythonPYTHON
  make -j1 -C build DESTDIR="${pkgdir}" uninstall-pkgpyexecLTLIBRARIES
  make -j1 -C build DESTDIR="${pkgdir}" uninstall-nodist_pkgpythonPYTHON
  rm -fr "${pkgdir}/$(python -c "import os; import inspect; print(os.path.dirname(inspect.getfile(inspect)))")"
}

package_fuse-megasync-git() {
  pkgdesc="MEGASync client based on FUSE (GIT Version)"
  conflicts=('fuse-megasync')
  provides=('fuse-megasync')
  depends=(libmega-git
           'fuse2'
           )
  options=('!emptydirs')

  install -Dm644 MEGAsync/LICENCE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make -C build DESTDIR="${pkgdir}" install-binPROGRAMS
  make -C build DESTDIR="${pkgdir}" uninstall-libLTLIBRARIES
  rm -fr "${pkgdir}/usr/bin/megacli"
  rm -fr "${pkgdir}/usr/bin/megasimplesync"
  rm -fr "${pkgdir}/usr/bin/mega-cmd"
  rm -fr "${pkgdir}/usr/bin/mega-exec"
}

package_megasync-daemon-git() {
  pkgdesc="MEGASync daemon client. (GIT Version)"
  conflicts=('megasync-daemon')
  provides=('megasync-daemon')
  depends=('libmega-git')
  options=('!emptydirs')
  backup=('etc/conf.d/megasync.conf')

  install -Dm644 MEGAsync/LICENCE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make -C build DESTDIR="${pkgdir}" install-binPROGRAMS
  make -C build DESTDIR="${pkgdir}" uninstall-libLTLIBRARIES
  rm -fr ${pkgdir}/usr/bin/megacli
  rm -fr ${pkgdir}/usr/bin/megafuse
  rm -fr "${pkgdir}/usr/bin/mega-cmd"
  rm -fr "${pkgdir}/usr/bin/mega-exec"

  install -Dm644 "${srcdir}/megasyncd.service" "${pkgdir}/usr/lib/systemd/system/megasyncd.service"
  install -Dm600 "${srcdir}/megasync.conf" "${pkgdir}/etc/conf.d/megasync.conf"
  install -d "${pkgdir}/srv/mega"
  install -dm700 "${pkgdir}/var/mega"
}

package_megasync-cli-git() {
  pkgdesc="MEGASync CLI client. (GIT Version)"
  conflicts=('megasync-cli')
  provides=('megasync-cli')
  depends=('libmega-git'
           'pcre'
           )
  options=('!emptydirs')

  install -Dm644 MEGAsync/LICENCE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make -C build DESTDIR="${pkgdir}" install-binPROGRAMS
  make -C build DESTDIR="${pkgdir}" uninstall-libLTLIBRARIES
  rm -fr ${pkgdir}/usr/bin/megafuse
  rm -fr ${pkgdir}/usr/bin/megasimplesync
}
package_python-megasync-git() {
  pkgdesc="Python Bindings for MEGASync. (GIT Version)"
  conflicts=('python-megasync')
  provides=('python-megasync')
  depends=('libmega-git'
           'python'
           )

  install -Dm644 MEGAsync/LICENCE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make -C build DESTDIR="${pkgdir}" install-libLTLIBRARIES
  make -C build DESTDIR="${pkgdir}" install-pkgpythonPYTHON
  make -C build DESTDIR="${pkgdir}" install-pkgpyexecLTLIBRARIES
  make -C build DESTDIR="${pkgdir}" uninstall-libLTLIBRARIES
}
package_python2-megasync-git() {
  pkgdesc="Python2 Bindings for MEGASync. (GIT Version)"
  conflicts=('python2-megasync')
  provides=('python2-megasync')
  depends=('libmega-git'
           'python2'
           )

  install -Dm644 MEGAsync/LICENCE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make -C build DESTDIR="${pkgdir}" install-libLTLIBRARIES
  make -C build-python2 DESTDIR="${pkgdir}" install-pkgpythonPYTHON
  make -C build-python2 DESTDIR="${pkgdir}" install-pkgpyexecLTLIBRARIES
  make -C build DESTDIR="${pkgdir}" uninstall-libLTLIBRARIES
}
