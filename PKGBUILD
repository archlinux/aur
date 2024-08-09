# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.8.12
pkgrel=1
pkgdesc="Kernel module for OpenAFS (dkms)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=(IPL-1.0)
depends=('dkms' 'libelf' 'openafs')
provides=("openafs-modules=$pkgver")
conflicts=('openafs-features-libafs' 'openafs-modules' 'openafs<1.6.6-2')
options=(!emptydirs)
source=(http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
        0001-Linux-6.10-Use-filemap_alloc_folio-when-avail.patch
        0002-Linux-6.10-define-a-wrapper-for-vmalloc.patch
        0003-Linux-6.10-remove-includes-for-asm-ia32_unistd.h.patch
        0004-afs-avoid-empty-body-warning.patch
        0005-Linux-6.10-Move-inline-before-func-return-type.patch
        dkms.conf)
sha256sums=('10fea6810c6c0b00ffb2cd3f38ed732c17cfd7955ca0954dc24a2a6172a26e75'
            '9e6605fd9f045b85d28d6b275e7f77f93d991cb266f10877d5e4b820322b2e13'
            'fd4fe8f2a1cd99c239a4bf42f600fcec5399206395c72297631dcfb7b8b7302a'
            '40cc3b6588c9bfab6d1eb8f0785952791b728f0c2bb17a35ee0d3084afd36aeb'
            'c5287bf9f467af7e7db37dbe193f53983b955a32117018d7984b9a75fee79af5'
            '60104dc7d8418829f2e5670783f1a7548e22f717673a1a312ed455c464d6116e'
            '5ea5e184f9b44f5ed45817d2b5a10149d15c8c54f49e0b5b4b773652673cb9b0')

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

  case "$CARCH" in
    "i686")    sysname=i386_linux26 ;;
    "x86_64")  sysname=amd64_linux26 ;;
    "armv7h")  sysname=arm_linux26 ;;
    *)         error "Unknown architecture '$CARCH'" && false
  esac

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --disable-fuse-client \
              --disable-kernel-module \
              --without-swig \
              --with-afs-sysname=$sysname

  make only_libafs_tree
}

package() {

  # install license
  install -Dm644 "${srcdir}/${_srcname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # install sources
  install -dm755 "${pkgdir}/usr/src/${_srcname}-${pkgver}"
  mv "${srcdir}/${_srcname}-${pkgver}/libafs_tree/"* "${pkgdir}/usr/src/${_srcname}-${pkgver}"
  sed "s/__VERSION__/$pkgver/" "${srcdir}/dkms.conf" > "${pkgdir}/usr/src/${_srcname}-${pkgver}/dkms.conf"

}
