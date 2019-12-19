# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgname=kmod-nc
_pkgbase=kmod
pkgver=26
pkgrel=4
pkgdesc="Linux kernel module management tools and library"
arch=('x86_64')
url='https://git.kernel.org/?p=utils/kernel/kmod/kmod.git;a=summary'
license=('GPL2')
depends=('glibc' 'zlib' 'openssl' 'xz')
makedepends=('gtk-doc')
checkdepends=('linux-headers' 'libelf')
options=('strip' 'debug')
provides=('module-init-tools=3.16' 'libkmod.so' 'kmod')
conflicts=('module-init-tools' 'kmod')
replaces=('module-init-tools')
validpgpkeys=('EAB33C9690013C733916AC839BA2A5A630CBEA53')  # Lucas DeMarchi
source=("https://www.kernel.org/pub/linux/utils/kernel/${_pkgbase}/${_pkgbase}-$pkgver.tar."{xz,sign}
        'depmod-search.conf'
        'depmod.hook' 'depmod.script'
        '0001-Link-against-libcrypto-not-all-of-openssl.patch'
        '0002-add-zstd-compressed-module-support.patch')
md5sums=('1129c243199bdd7db01b55a61aa19601'
         'SKIP'
         'dd62cbf62bd8f212f51ef8c43bec9a77'
         '72ce5e14ee3ad8bc06945e0ad4c642ce'
         '18fb3d1f6024a5a84514c8276cb3ebff'
         'e918bef174c1057fa13a5ba8c4a30a46'
         '49696ec36c0a254d107c7c4a7fbbef06')

prepare() {
  cd "${_pkgbase}-$pkgver"

  patch -Np1 <"$srcdir/0001-Link-against-libcrypto-not-all-of-openssl.patch"
  patch -Np1 <"$srcdir/0002-add-zstd-compressed-module-support.patch"

  autoreconf -fisv
}

build() {
  cd "${_pkgbase}-$pkgver"

  ./configure \
    --sysconfdir=/etc \
    --enable-gtk-doc \
    --with-xz \
    --with-zlib \
    --with-zstd \
    --with-openssl

  make
}

check() {
  # As of kmod v20, the test suite needs to build some kernel modules, and thus
  # needs headers available in order to run. We depend on linux-headers, but
  # this is really only to try and make sure that *some* useable tree of kernel
  # headers exist. The first useable tree we find is good enough, as these
  # modules will never be loaded by tests.

  local kdirs=(/usr/lib/modules/*/build/Makefile)
  if [[ ! -f ${kdirs[0]} ]]; then
    printf '==> Unable to find kernel headers to build modules for tests\n' >&2
    return 1
  fi

  local kver kdir=${kdirs[0]%/Makefile}
  IFS=/ read _ _ _ kver _ <<<"$kdir"

  #make -C "${_pkgbase}-$pkgver" check KDIR="$kdir" KVER="$kver"
}

package() {
  make -C "${_pkgbase}-$pkgver" DESTDIR="$pkgdir" install

  # extra directories
  install -dm755 "$pkgdir"/{etc,usr/lib}/{depmod,modprobe}.d

  for tool in {ins,ls,rm,dep}mod mod{probe,info}; do
    ln -s kmod "$pkgdir/usr/bin/$tool"
  done

  # install depmod.d file for search/ dir
  install -Dm644 "$srcdir/depmod-search.conf" "$pkgdir/usr/lib/depmod.d/search.conf"

  # hook
  install -Dm644 "$srcdir/depmod.hook" "$pkgdir/usr/share/libalpm/hooks/60-depmod.hook"
  install -Dm755 "$srcdir/depmod.script" "$pkgdir/usr/share/libalpm/scripts/depmod"
}

# vim: ft=sh syn=sh et
