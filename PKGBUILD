# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

# Contributor: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F
# Contributor: Kenny Rasschaert <kenny dot rasschaert at gmail dot com> PGP-Key: 1F70454121E41419
# Contributor: Adrián Pérez de Castro <adrian at perezdecastro dor org> PGP-Key: 91C559DBE4C9123B
# Contributor: Carl George <arch at cgtx dot us> PGP-Key: 4BA2F7E101D9F512

pkgname=rkt
pkgver=1.30.0
pkgrel=1
pkgdesc="App container runtime"
arch=('x86_64')
url="https://github.com/coreos/rkt"
license=(apache)
depends=('glibc' 'openssl' 'zlib' 'systemd')
makedepends=('cpio' 'go' 'wget' 'squashfs-tools' 'perl-capture-tiny'
             'intltool' 'gperf' 'git' 'libseccomp' 'bc' 'python2')

# stage1/usr_from_coreos/coreos-common.mk
CCN_IMG_RELEASE=1478.0.0
CCN_SYSTEMD_VERSION=v233

# stage1/usr_from_kvm/kernel.mk
KERNEL_VERSION=4.9.2

# stage1/usr_from_kvm/lkvm.mk
KVMTOOL_VERSION=cfae4d64482ed745214e3c62dd84b79c2ae0f325

source=(https://github.com/coreos/rkt/archive/v$pkgver/$pkgname-$pkgver.tar.gz
        coreos_production_pxe_image-$CCN_IMG_RELEASE.cpio.gz::http://alpha.release.core-os.net/amd64-usr/$CCN_IMG_RELEASE/coreos_production_pxe_image.cpio.gz
        coreos_production_pxe_image-$CCN_IMG_RELEASE.cpio.gz.sig::http://alpha.release.core-os.net/amd64-usr/$CCN_IMG_RELEASE/coreos_production_pxe_image.cpio.gz.sig
        https://www.kernel.org/pub/linux/kernel/v4.x/linux-$KERNEL_VERSION.tar.xz
        https://www.kernel.org/pub/linux/kernel/v4.x/linux-$KERNEL_VERSION.tar.sign
        git+https://kernel.googlesource.com/pub/scm/linux/kernel/git/will/kvmtool#commit=$KVMTOOL_VERSION
        rkt.sysusers)
noextract=(coreos_production_pxe_image.cpio.gz)
validpgpkeys=('04127D0BFABEC8871FFB2CCE50E0885593D2DCB4' # CoreOS Buildbot
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
              )
sha256sums=('4d22c742b87d15c226cc28970c7daf66a64c6a95af9d752f5b72d9a4012aca1d'
            '9897f9e78e207da42a75d03f7ff74c4400dce15843b752adcb3182ebe66c9868'
            'SKIP'
            '8dda9aedd17ae0bf1e06ebb4b79082f83fb3ade45cbcc3ca4c30bf3faf085738'
            'SKIP'
            'SKIP'
            '2aee4e8547843f4e6c032761b97cb723c1ecd384d508b86f44d16826bc34d6d6')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  mkdir -p build-rkt-$pkgver/tmp/usr_from_kvm/{lkvm,kernel}

  ln -s "$srcdir"/kvmtool build-rkt-$pkgver/tmp/usr_from_kvm/lkvm/src

  # place prefetched kernel sources
  ln -s "$srcdir"/linux-$KERNEL_VERSION.tar.xz \
      build-rkt-$pkgver/tmp/usr_from_kvm/kernel/
  ln -s "$srcdir"/linux-$KERNEL_VERSION \
      build-rkt-$pkgver/tmp/usr_from_kvm/kernel/

  # disable git fetch of kvmtool
  sed -r '/^include makelib\/git.mk$/d' -i stage1/usr_from_kvm/lkvm.mk

  # fix makedev definition
  sed '/^#include <sys\/stat.h>$/a #include <sys/sysmacros.h>' -i \
      build-rkt-$pkgver/tmp/usr_from_kvm/lkvm/src/virtio/9p.c

  # do not extract kernel sources
  sed '/^\$(call forward-vars,\$(KERNEL_MAKEFILE)/,/tar --extract/d' -i \
      stage1/usr_from_kvm/kernel.mk

  # fix for asm headers not found
  cd build-rkt-$pkgver/tmp/usr_from_kvm/lkvm/src/x86
  ln -s "$srcdir"/linux-$KERNEL_VERSION/arch/x86/include/asm/
  sed -E 's/include <(asm\/.*\.h)>/include "\1"/' -i kvm-cpu.c
}

build() {
  cd $pkgname-$pkgver
  export GOPATH="$PWD/Godeps/_workspace/src"

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --enable-tpm=auto \
    --with-stage1-flavors=coreos,kvm,host,fly \
    --with-stage1-kvm-hypervisors=lkvm \
    --with-stage1-default-flavor=host \
    --with-stage1-default-images-directory=/usr/lib/rkt/stage1-images \
    --with-stage1-default-location=/usr/lib/rkt/stage1-images/stage1-host.aci \
    --with-coreos-local-pxe-image-path="$srcdir"/coreos_production_pxe_image-$CCN_IMG_RELEASE.cpio.gz \
    --with-coreos-local-pxe-image-systemd-version=$CCN_SYSTEMD_VERSION

  make manpages
  make bash-completion
  make
}

package() {
  cd $pkgname-$pkgver/dist/init/systemd

  for unit in *.service *.timer *.socket; do
    install -Dm644 $unit "$pkgdir"/usr/lib/systemd/system/$unit
  done

  for tmpfile in tmpfiles.d/*.conf; do
    install -Dm644 $tmpfile "$pkgdir"/usr/lib/$tmpfile
  done

  cd "$srcdir"/$pkgname-$pkgver
  install -Dm644 "$srcdir"/rkt.sysusers "$pkgdir"/usr/lib/sysusers.d/rkt.conf
  install -Dm644 dist/bash_completion/rkt.bash "$pkgdir"/usr/share/bash-completion/completions/rkt

  cd dist/manpages
  for f in *; do
    install -Dm644 "$f" "$pkgdir/usr/share/man/man1/$f"
  done
  cd ../..

  cd build-$pkgname-$pkgver
  install -dm755 "$pkgdir"/usr/bin "$pkgdir"/usr/lib/rkt/stage1-images
  mv target/bin/rkt tools/actool "$pkgdir"/usr/bin
  mv target/bin/stage1-*.aci "$pkgdir"/usr/lib/rkt/stage1-images/
}

# vim:set ts=2 sw=2 et:
