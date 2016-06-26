# Maintainer: Vyacheslav Konovalov <vyachkonovalov@gmail.com>

pkgname=redis-desktop-manager
pkgver=0.8.6
pkgrel=1
pkgdesc='Cross-platform open source Redis DB management tool'
arch=('x86_64')
url="http://redisdesktop.com/"
license=('LGPLv2.1')
depends=('qt5-base' 'qt5-imageformats' 'qt5-tools' 'qt5-declarative' 'qt5-quickcontrols' 'qt5-graphicaleffects' 'qt5-svg' 'libssh2')
makedepends=('git' 'gcc')
conflicts=('redis-desktop-manager-bin')
source=('rdm::git://github.com/uglide/RedisDesktopManager.git#tag=0.8.6'
        'rdm.sh'
        'rdm.desktop')
sha256sums=('SKIP'
            'f469d9a5adce723904efe0f1b1db5d79807410f90aafb117f18ae108d8b2d391'
            '4fac85cec4a7abe7254ff3a6f0382d9a6f2b712372ecbd74474a2f8efe9c4e3c')

prepare() {
  cd rdm/
  git submodule update --init --recursive
  git submodule add https://chromium.googlesource.com/linux-syscall-support 3rdparty/linux-syscall-support

  python2 build/utils/set_version.py "$pkgver" > src/version.h
  python2 build/utils/set_version.py "$pkgver" > 3rdparty/crashreporter/src/version.h

  _lssdir='3rdparty/gbreakpad/src/third_party/lss/'
  mkdir ${_lssdir}
  cp 3rdparty/linux-syscall-support/linux_syscall_support.h ${_lssdir}
  cd 3rdparty/gbreakpad
  touch README
}

build() {
  rm -rf $srcdir/rdm/bin

  cd $srcdir/rdm/3rdparty/crashreporter
  qmake CONFIG+=release DESTDIR="$srcdir/rdm/bin/linux/release" QMAKE_LFLAGS_RPATH=""
  make -j 2

  cd $srcdir/rdm/3rdparty/gbreakpad
  ./configure
  make -j 2

  cd $srcdir/rdm/src
  qmake && make
}

package() {
  _instdir="$srcdir/rdm/bin/linux/release"
  _bindir="$pkgdir/usr/share/redis-desktop-manager/bin"

  mkdir -p "${_bindir}"
  mkdir "$pkgdir/usr/share/licenses"
  mkdir "$pkgdir/usr/share/pixmaps"
  mkdir "$pkgdir/usr/share/applications"

  install -Dm644 "$srcdir/rdm/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "${_instdir}/rdm" "${_bindir}/rdm"
  install -Dm755 "${_instdir}/crashreporter" "${_bindir}/crashreporter"
  install -Dm755 "$srcdir/rdm.sh" "${_bindir}/rdm.sh"
  install -Dm644 "$srcdir/rdm/src/resources/rdm.png" "$pkgdir/usr/share/pixmaps/rdm.png"
  install -Dm644 "$srcdir/rdm.desktop" "$pkgdir/usr/share/applications/rdm.desktop"

  mkdir "$pkgdir/usr/bin"
  ln -s '/usr/share/redis-desktop-manager/bin/rdm.sh' "$pkgdir/usr/bin/rdm"
}
