# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=libmega-git
pkgname=(
  'libmega-git'
  'megasync-daemon-git'
  'megasync-cli-git'
  'python-megasync-git'
#   'fuse-megasync-git' # disabled in upstream https://github.com/meganz/sdk/commit/eb3be4b7ca62019d418ed9e77b1c59a6c6c5f40e
)
pkgver=6.2.0.38.gd93d7417c
pkgrel=1
pkgdesc="Sync your files to your Mega account. (GIT Version)"
arch=('x86_64')
url='https://mega.co.nz/#sync'
license=('custom:MEGA')
makedepends=(
  'git'
  'chrpath'
  'gcc-libs'
  'glibc'
  'c-ares'
  'libuv'
  'crypto++'
  'libsodium'
  'cython'
  'python-build'
  'python-wheel'
  'python-installer'
  'swig'
  'fuse2'
  'libraw'
  'ffmpeg'
  'libmediainfo'
  'libuv'
  'bzip2'
  'sqlite'
  'readline'
)
source=(
  'git+https://github.com/meganz/sdk.git'
  'megasync.conf'
  'megasyncd.service'
  'esee'
)
sha256sums=(
  'SKIP'
  'a3d30b3e198c3c117b2dd3144acaeb66117ee013744d2a0f39e9d4624b979a22'
  '73600a6d5e7ddbb6d0a3eff22aa05cc22715c2b02be7e62d16c2c71ac17a5ad5'
  '66b5f481081157eee82653b3774d22edb5aa2007cf93142fd73cc0c4d577d59f'
)
options=('debug')

pkgver() {
  cd sdk
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  (git clone "${srcdir}/sdk" build
   cd build

   # use system ffmpeg
   sed -e 's|ffmpeg-mega/||g' \
       -e 's|/ffmpeg-mega||g' \
       -i configure.ac

   # https://github.com/meganz/sdk/pull/2628
   git cherry-pick 5d6f470bc65e9e5c1778bcb228be95d55ddc2b06 -m 1

   sed 's|c++11|c++17|g' \
     -i configure.ac \
     -i bindings/qt/sdk.pri

   ./autogen.sh

   # fix autogen am__pep3147_tweak fails
   sed -e "/^am__py_compile/aam__pep3147_tweak \= \\\\\n  sed \-e 's\|\\\.py\$\$\|\|' \-e 's\|\[\^\/\]\*\$\$\|__pycache__\/&\.\*\.pyc __pycache__\/&\.\*\.pyo\|'/" \
     -i Makefile.in
   )
}

build() {
  msg2 "Build libmega and programs"

  cd "${srcdir}/build"
  ./configure \
    --prefix=/usr \
    --without-freeimage \
    --with-fuse \
    --enable-python \
    --with-python3

  # force no install the libs when install the executables when do "make install"
  # force no install the python libs/foo when do "make install"
  sed -e '/install-binPROGRAMS: install-libLTLIBRARIES/d' \
      -e 's|install-nodist_pkgpythonPYTHON install-phpLTLIBRARIES|install-phpLTLIBRARIES|g' \
      -e 's|install-pkgconfigDATA install-pkgpythonPYTHON|install-pkgconfigDATA|g' \
      -e 's|install-pkglibLTLIBRARIES install-pkgpyexecLTLIBRARIES|install-pkglibLTLIBRARIES|g' \
      -i Makefile

  make

  cd bindings/python
  sed -e "s|'libmega.so', ||g" \
      -e '/libmega.so/d' \
      -i setup.py

  python -m build --wheel --no-isolation

}

package_libmega-git() {
  pkgdesc="MEGASync libs (GIT Version)"
  provides=(
    "libmega=${pkgver}"
    'libmega.so'
    )
  conflicts=('libmega')
  depends=(
    'gcc-libs' # libgcc_s.so libstdc++.so
    'glibc' # ld-linux-x86-64.so libc.so libm.so
    'crypto++' # libcryptopp.so
    'libsodium' 'libsodium.so'
    'libraw' # libraw.so
    'libuv' # libuv.so
    'libmediainfo' # libmediainfo.so
    'libzen' # libzen.so
    'curl' 'libcurl.so'
    'c-ares' 'libcares.so'
    'openssl' 'libssl.so' 'libcrypto.so'
    'ffmpeg' 'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libswscale.so'
    'sqlite' 'libsqlite3.so'
    'bzip2' 'libbz2.so'
    'zlib' 'libz.so'
    'xz' 'liblzma.so'
    'icu' 'libicuuc.so'
  )

  make -C build DESTDIR="${pkgdir}" install-data install-libLTLIBRARIES install-pkgconfigDATA
  make -C build DESTDIR="${pkgdir}" uninstall-nodist_pkgpythonPYTHON uninstall-pkgpyexecLTLIBRARIES uninstall-pkgpythonPYTHON

  install -Dm644 sdk/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_fuse-megasync-git() {
  pkgdesc="MEGASync client based on FUSE (GIT Version)"
  provides=("fuse-megasync=${pkgver}")
  conflicts=('fuse-megasync')
  depends=(
    "libmega-git=${pkgver}" 'libmega.so'
    'fuse2'
  )

  make -C build DESTDIR="${pkgdir}" install-binPROGRAMS
  rm -fr "${pkgdir}/usr/bin/megacli"
  rm -fr "${pkgdir}/usr/bin/megasimplesync"

  install -Dm644 sdk/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_megasync-daemon-git() {
  pkgdesc="MEGASync daemon client. (GIT Version)"
  provides=("megasync-daemon=${pkgver}")
  conflicts=('megasync-daemon')
  depends=(
    'gcc-libs' # libgcc_s.so libstdc++.so
    'glibc' # ld-linux-x86-64.so libc.so
    "libmega-git=${pkgver}" 'libmega.so'
  )
  options=('!emptydirs')
  backup=('etc/conf.d/megasync.conf')

  make -C build DESTDIR="${pkgdir}" install-binPROGRAMS
  rm -fr "${pkgdir}/usr/bin/megacli"
  rm -fr "${pkgdir}/usr/bin/megafuse"

  install -Dm644 "${srcdir}/megasyncd.service" "${pkgdir}/usr/lib/systemd/system/megasyncd.service"
  install -Dm600 "${srcdir}/megasync.conf" "${pkgdir}/etc/conf.d/megasync.conf"
  install -d "${pkgdir}/srv/mega"
  install -dm700 "${pkgdir}/var/mega"

  install -Dm644 sdk/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_megasync-cli-git() {
  pkgdesc="MEGASync CLI client. (GIT Version)"
  provides=("megasync-cli=${pkgver}")
  conflicts=('megasync-cli')
  depends=(
    'gcc-libs' # libgcc_s.so libstdc++.so
    'glibc' # ld-linux-x86-64.so libc.so
    'readline' 'libreadline.so'
    'crypto++' # libcryptopp.so
    "libmega-git=${pkgver}" 'libmega.so'
  )

  make -C build DESTDIR="${pkgdir}" install-binPROGRAMS
  rm -fr "${pkgdir}/usr/bin/megafuse"
  rm -fr "${pkgdir}/usr/bin/megasimplesync"

  install -Dm644 sdk/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-megasync-git() {
  pkgdesc="Python Bindings for MEGASync. (GIT Version)"
  provides=("python-megasync=${pkgver}")
  conflicts=('python-megasync')
  depends=(
    "libmega-git=${pkgver}" 'libmega.so'
    'python'
  )

  cd build/bindings/python
  python -m installer --destdir="${pkgdir}" dist/*.whl

  _sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"
  rm -fr "${pkgdir}${_sites_packages}/mega/libmega.so"
  chrpath -d "${pkgdir}${_sites_packages}/mega/_mega.so"

  install -Dm644 "${srcdir}/sdk/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
