# Maintainer: rechie <gaoruiqi@kylinos.cn>

pkgbase=libkysdk-base
pkgname=libkysdk-base
pkgver=3.0.1.0
pkgrel=1
pkgdesc="kylin system develpoer kit - base kit"
arch=('x86_64')
license=('GPL-3.0-only')
#_tag=e3a0df5878b515fb27c6f58e756ae7d46bff0a22
url="https://gitee.com/openkylin/libkysdk-base"
depends=(
	'dbus'
	'glib2'
	'glibc'
	'yaml-cpp'
	'qt5-base'
	'openssl'
	'sqlite'
	'systemd-libs'
	'gcc-libs')
makedepends=(
	'git'
	'cmake'
	'gcc'
        'gtk3')

groups=('ukui')
source=(
	"git+https://gitee.com/openkylin/libkysdk-base.git"
	"0001-fix-ICEQUL.patch"
	"0002-fix-ICETPG.patch")
sha512sums=('SKIP'
            '1cce12a96fc5b7ed7b1c6b58715596a229784f3af5e1012cb2988455fe77dd2d50ed81acff11e33e4c6b2d71f395924c749e92633ab46df7da82014078a6f597'
            '183904c1b189943b56defe04321648e60a17113e9a5f1a16496ea8468e1bc030fc8472ad4822f3cf732e48b0cbbd9250e44a36a9761a20625a6c73827705f02d')

prepare() {
  cd "$srcdir/$pkgbase"
  git checkout upstream/${pkgver}
  git apply ../*patch
}

build() {
  cd "$srcdir/${pkgbase}"
  cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 .
  make
}

check() {
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"$srcdir/$pkgbase/lib"
  cd "$srcdir/$pkgbase/bin"
  ./test-delete
  #./test-insert
  #./test-kytimer
  #./test-search
  #./test-utils
}

package() {
  cd "$srcdir/$pkgbase" 
  DESTDIR="$pkgdir" make install
  install -d $pkgdir/usr/share/pkgconfig/
  # libkysdk-base-dev
  install -D -m644 development-files/kysdk-base.pc $pkgdir/usr/share/pkgconfig/
  install -d $pkgdir/etc/ld.so.conf.d/
  # libkysdk-basecommon
  install -D -m644 development-files/kysdk-base.conf $pkgdir/etc/ld.so.conf.d/
  # libkysdk-conf2-dev
  install -D -m644 development-files/kysdk-conf2.pc $pkgdir/usr/share/pkgconfig/
  # libkysdk-config-dev
  install -D -m644 development-files/kysdk-config.pc $pkgdir/usr/share/pkgconfig/
  # libkysdk-diagnostics-dev
  install -D -m644 development-files/kysdk-diagnostics.pc $pkgdir/usr/share/pkgconfig/
  # libkysdk-gsetting-dev
  install -D -m644 development-files/kysdk-gsetting.pc $pkgdir/usr/share/pkgconfig/
  # libkysdk-log-dev
  install -D -m644 development-files/kysdk-log.pc $pkgdir/usr/share/pkgconfig/
  # libkysdk-log
  install -d $pkgdir/etc/kysdk/kysdk-base/
  install -D -m644 src/log/kylog-default.conf $pkgdir/etc/kysdk/kysdk-base/
  install -D -m644 src/log/kylog-rotate-default $pkgdir/etc/kysdk/kysdk-base/
  # libkysdk-timer
  install -D -m644 development-files/kysdk-timer.pc $pkgdir/usr/share/pkgconfig/
  # libkysdk-utils-dev
  install -D -m644 src/utils/sdkmarcos.h $pkgdir/usr/include/kysdk/kysdk-base/
  install -D -m644 src/utils/kerr.h $pkgdir/usr/include/kysdk/kysdk-base/
  install -D -m644 src/utils/cstring-extension.h $pkgdir/usr/include/kysdk/kysdk-base/
  install -D -m644 src/utils/kyutils.h $pkgdir/usr/include/kysdk/kysdk-base/
  install -D -m644 src/utils/data-structure/linklist/skip_linklist/skip_linklist.h $pkgdir/usr/include/kysdk/kysdk-base/
  install -D -m644 src/utils/data-structure/linklist/listdata.h $pkgdir/usr/include/kysdk/kysdk-base/
  install -D -m644 development-files/kysdk-utils.pc $pkgdir/usr/share/pkgconfig/
}
