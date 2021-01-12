# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>

pkgname=kmod-git
pkgver=28
pkgrel=1
pkgdesc="Linux kernel module management tools and library"
arch=('x86_64')
url='https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git'
license=('GPL2')
depends=('glibc' 'zlib' 'openssl' 'xz' 'zstd')
checkdepends=('linux-headers' 'libelf')
#options=('strip' 'debug')
provides=('module-init-tools=3.16' 'libkmod.so' 'kmod')
conflicts=('module-init-tools' 'kmod')
replaces=('module-init-tools')
#validpgpkeys=('EAB33C9690013C733916AC839BA2A5A630CBEA53')  # Lucas DeMarchi
source=("git+https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git"
        'depmod-search.conf'
        'depmod.hook' 'depmod.script')
md5sums=('SKIP'
         'dd62cbf62bd8f212f51ef8c43bec9a77'
         'e179ace75721e92b04b2e145b69dab29'
         '18fb3d1f6024a5a84514c8276cb3ebff')

pkgver() {
  cd kmod
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd kmod

  ./autogen.sh
  ./configure \
    --sysconfdir=/etc \
    --with-xz \
    --with-zlib \
    --with-zstd \
    --with-openssl

  make
}

#check() {
  # As of kmod v20, the test suite needs to build some kernel modules, and thus
  # needs headers available in order to run. We depend on linux-headers, but
  # this is really only to try and make sure that *some* useable tree of kernel
  # headers exist. The first useable tree we find is good enough, as these
  # modules will never be loaded by tests.

#  local kdirs=(/usr/lib/modules/*/build/Makefile)
#  if [[ ! -f ${kdirs[0]} ]]; then
#    printf '==> Unable to find kernel headers to build modules for tests\n' >&2
#    return 1
#  fi

#  local kver kdir=${kdirs[0]%/Makefile}
#  IFS=/ read _ _ _ kver _ <<<"$kdir"

#  make -C "$pkgname-$pkgver" check KDIR="$kdir" KVER="$kver"
#}

package() {
  make -C kmod DESTDIR="$pkgdir" install

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
