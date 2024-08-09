# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.12
pkgrel=1
pkgdesc="Kernel module for OpenAFS"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=(IPL-1.0)
depends=('openafs')
makedepends=('libelf' 'linux-headers')
conflicts=('openafs-features-libafs' 'openafs<1.6.6-2')
options=(!emptydirs)
install=openafs-modules.install
source=(http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
        0001-Linux-6.10-Use-filemap_alloc_folio-when-avail.patch
        0002-Linux-6.10-define-a-wrapper-for-vmalloc.patch
        0003-Linux-6.10-remove-includes-for-asm-ia32_unistd.h.patch
        0004-afs-avoid-empty-body-warning.patch
        0005-Linux-6.10-Move-inline-before-func-return-type.patch)
sha256sums=('10fea6810c6c0b00ffb2cd3f38ed732c17cfd7955ca0954dc24a2a6172a26e75'
            '9e6605fd9f045b85d28d6b275e7f77f93d991cb266f10877d5e4b820322b2e13'
            'fd4fe8f2a1cd99c239a4bf42f600fcec5399206395c72297631dcfb7b8b7302a'
            '40cc3b6588c9bfab6d1eb8f0785952791b728f0c2bb17a35ee0d3084afd36aeb'
            'c5287bf9f467af7e7db37dbe193f53983b955a32117018d7984b9a75fee79af5'
            '60104dc7d8418829f2e5670783f1a7548e22f717673a1a312ed455c464d6116e')

# Heuristic to determine version of installed kernel
# You can modify this if the heuristic fails
if uname -r | grep -q lts; then
  # if you are currently running an lts kernel, only consider lts versions
  _kernelver=$(ls -dt /usr/lib/modules/*lts* | head -n1 | cut -d/ -f5)
else
  _kernelver=$(ls -dt /usr/lib/modules/* | head -n1 | cut -d/ -f5)
fi
_extramodules="/usr/lib/modules/${_kernelver}/extramodules"

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Compatibility with Linux 6.10
  patch -p1 < "$srcdir"/0001-Linux-6.10-Use-filemap_alloc_folio-when-avail.patch
  patch -p1 < "$srcdir"/0002-Linux-6.10-define-a-wrapper-for-vmalloc.patch
  patch -p1 < "$srcdir"/0003-Linux-6.10-remove-includes-for-asm-ia32_unistd.h.patch
  patch -p1 < "$srcdir"/0004-afs-avoid-empty-body-warning.patch
  patch -p1 < "$srcdir"/0005-Linux-6.10-Move-inline-before-func-return-type.patch

  # Only needed when changes to configure were made
  ./regen.sh -q
}

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --disable-fuse-client \
              --without-swig \
              --with-linux-kernel-packaging \
              --with-linux-kernel-build="/usr/lib/modules/${_kernelver}/build"

  make only_libafs
}


package() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  make DESTDIR="${pkgdir}" install_only_libafs

  # install kernel module
  install -dm755 "${pkgdir}${_extramodules}"
  mv "${pkgdir}/lib/modules/${_kernelver}/extra/openafs/openafs.ko" "${pkgdir}${_extramodules}/openafs.ko"
  gzip -9 "${pkgdir}${_extramodules}/openafs.ko"

  # install license
  install -Dm644 "${srcdir}/${_srcname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove files already included in openafs package
  find "${pkgdir}/usr" -maxdepth 3 -type f -delete
  find "${pkgdir}/usr" -maxdepth 3 -type l -delete

  # update major kernel version in install file
  sed -i "s/depmod .*/depmod ${_kernelver}/g" "${startdir}/openafs-modules.install"
}
