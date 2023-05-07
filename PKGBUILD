# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=libmega-git
pkgname=(
  'libmega-git'
  'megasync-daemon-git'
  'megasync-cli-git'
  'python-megasync-git'
  'fuse-megasync-git'
)
pkgver=4.19.0.73.g615a2eff3
pkgrel=1
pkgdesc="Sync your files to your Mega account. (GIT Version)"
arch=('x86_64')
url='https://mega.co.nz/#sync'
license=('custom:MEGA')
source=(
  'git+https://github.com/meganz/sdk.git'
  'megasync.conf'
  'megasyncd.service'
  'esee'
)
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
  'ffmpeg4.4'
  'libmediainfo'
  'libuv'
  'bzip2'
  'sqlite'
  'readline'
)
sha256sums=(
  'SKIP'
  'a3d30b3e198c3c117b2dd3144acaeb66117ee013744d2a0f39e9d4624b979a22'
  '73600a6d5e7ddbb6d0a3eff22aa05cc22715c2b02be7e62d16c2c71ac17a5ad5'
  '66b5f481081157eee82653b3774d22edb5aa2007cf93142fd73cc0c4d577d59f'
)

pkgver() {
  cd sdk
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

_prepare() {
  sed -e 's|ffmpeg-mega|ffmpeg4.4|g' \
      -e 's|FFMPEG_LIBS\=\[\"|&-L/usr/lib/ffmpeg4.4 |g' \
      -e 's|FFMPEG_LIBS\=\"|&-L/usr/lib/ffmpeg4.4 |g' \
      -i configure.ac
}

prepare() {
  # FFmpeg4
  (git clone "${srcdir}/sdk" build; cd build; _prepare; ./autogen.sh)
  (git clone "${srcdir}/sdk" build-python; cd build-python; _prepare; ./autogen.sh)

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

  # FFFFUUUUU hack
  cp "${srcdir}/build/src/libmega.la" src/libmega.la
  make bindings/python/_mega.la
  sed "/^dependency_libs/cdependency_libs=''" \
    -i src/libmega.la
  sed "/^dependency_libs/cdependency_libs='-L/usr/lib -lpython$(python --version | cut -d ' ' -f2 | cut -d '.' -f1-2) ${srcdir}/build/python/src/libmega.la -lrt -ldl'" \
    -i bindings/python/_mega.la
  rm -fr bindings/python/.{libs,deps}
  # yesh, again...
  make bindings/python/_mega.la

  cd bindings/python
  sed -e "s|'libmega.so', ||g" \
      -e '/libmega.so/d' \
      -i setup.py

  python -m build --wheel --no-isolation

}

package_libmega-git() {
  pkgdesc="MEGASync libs (GIT Version)"
  conflicts=('libmega')
  provides=(
    "libmega=${pkgver}"
    'libmega.so'
    )
  depends=(
    'gcc-libs'
    'glibc'
    'crypto++'
    'libsodium'
    'libraw'
    'libuv'
    'libmediainfo'
    'libzen'
    'zlib'
    'c-ares' 'libcares.so'
    'openssl' 'libssl.so' 'libcrypto.so'
    'ffmpeg4.4' 'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libswscale.so'
    'sqlite' 'libsqlite3.so'
    'bzip2' 'libbz2.so'
    'curl' 'libcurl.so'
    'xz' 'liblzma.so'
  )

  make -C build DESTDIR="${pkgdir}" install-data install-libLTLIBRARIES install-pkgconfigDATA

  install -Dm644 sdk/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_fuse-megasync-git() {
  pkgdesc="MEGASync client based on FUSE (GIT Version)"
  conflicts=('fuse-megasync')
  provides=('fuse-megasync')
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
  conflicts=('megasync-daemon')
  provides=('megasync-daemon')
  depends=(
    "libmega-git=${pkgver}" 'libmega.so'
    'readline' 'libreadline.so'
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
  conflicts=('megasync-cli')
  provides=('megasync-cli')
  depends=('libmega-git')

  make -C build DESTDIR="${pkgdir}" install-binPROGRAMS
  rm -fr "${pkgdir}/usr/bin/megafuse"
  rm -fr "${pkgdir}/usr/bin/megasimplesync"

  install -Dm644 sdk/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-megasync-git() {
  pkgdesc="Python Bindings for MEGASync. (GIT Version)"
  conflicts=('python-megasync')
  provides=('python-megasync')
  depends=(
    "libmega-git=${pkgver}" 'libmega.so'
    'python'
  )

  cd build-python/bindings/python
  python -m installer --destdir="${pkgdir}" dist/*.whl

  _sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"
  rm -fr "${pkgdir}${_sites_packages}/mega/libmega.so"
  chrpath -d "${pkgdir}${_sites_packages}/mega/_mega.so"

  install -Dm644 "${srcdir}/sdk/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
