# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.8.8.1
pkgrel=3
pkgdesc="Kernel module for OpenAFS (dkms)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('dkms' 'libelf' 'openafs')
provides=("openafs-modules=$pkgver")
conflicts=('openafs-features-libafs' 'openafs-modules' 'openafs<1.6.6-2')
options=(!emptydirs)
source=("http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2"
	"dkms.conf"
	0001-Add-autoconf-archive-to-src-external.patch
	0002-Import-of-code-from-autoconf-archive.patch
	0003-Use-autoconf-archive-m4-from-src-external.patch
	0004-Linux-5.17-kernel-func-complete_and_exit-renamed.patch
	0005-Linux-5.17-Kernel-build-uses-Wcast-function-type.patch
	0006-Linux-5.18-replace-set_page_dirty-with-dirty_folio.patch
	0007-afs-remove-vestigial-externs-for-afs_xcbhash.patch
	0008-afs-introduce-afs_alloc_ncr-afs_free_ncr.patch
	0009-LINUX-Don-t-panic-on-some-file-open-errors.patch
	0010-afs-Introduce-afs_IsDCacheFresh.patch
	0011-afs-introduce-get_dcache_readahead.patch
	0012-Linux-5.18-replace-readpages-with-readahead.patch)
sha256sums=('e7c4bed7075bcd6402e3f0c2d5b9dbe76ad2ee3c5fd5ddc3973a3356ca23ef44'
            '5ea5e184f9b44f5ed45817d2b5a10149d15c8c54f49e0b5b4b773652673cb9b0'
            'cbf078639b9b25d1e9ec191b9c340720f1fe5ebd1b7665c2ea762498fcf66fbf'
            'f1feac79a69b9ecff4c7259842184e16ef1213e9fb5a2601c4963ea3dc12041c'
            '97410d4f5a7a09254ffa18411f242234aba483a0a7b989503ee831457c0ddb9f'
            '47faddb068dcbbea74c973c23aac7fe29b1482e984a37b5cfee283200da6b9e2'
            '45fa5eaa7b0e7e7bc6c9e0b7c5d97e5fefc54f60c084d5e7deddbe2c0c4697e9'
            'd42fa0772193cd6a66e09ba9cdb81b77c636a266caaf0c465331ff7ca3925b1c'
            'b47e4d5405961b7d40bd24e50c18740b9cd85a90e0e7f630101602efb2f12c2f'
            '9801be6de6399a2e0d899b0ed71bc5881ede5a926720d32377a24db31b035593'
            'ce21b7ed721d685fb0f1ddf068003410b585e09be7a96daeb1e8bb10378cf4b3'
            '7a5410bce86f1471ae5d990b68f2b25fcff8d5f32d2b7fd9e29c098a91ef1cef'
            '4816b8502366995eb5e8e58e485db910269a118ea6ed67e8f16e6bc1aab53864'
            'b51739e2670d13a46f0936fd50ef4bfadf40e83b22a53d46dd7b0eb490ebb700')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Updates to autoconf required for following patches
  patch -p1 < "${srcdir}/0001-Add-autoconf-archive-to-src-external.patch"
  patch -p1 < "${srcdir}/0002-Import-of-code-from-autoconf-archive.patch"
  patch -p1 < "${srcdir}/0003-Use-autoconf-archive-m4-from-src-external.patch"

  # Compatibility with Linux 5.17
  patch -p1 < "${srcdir}/0004-Linux-5.17-kernel-func-complete_and_exit-renamed.patch"
  patch -p1 < "${srcdir}/0005-Linux-5.17-Kernel-build-uses-Wcast-function-type.patch"

  # Linux 5.18 (14939)
  patch -p1 < "${srcdir}/0006-Linux-5.18-replace-set_page_dirty-with-dirty_folio.patch"

  # Backport from master to make later patches apply cleanly
  patch -p1 < "${srcdir}/0007-afs-remove-vestigial-externs-for-afs_xcbhash.patch"

  # Prep. for Linux 5.18 patch (14954)
  patch -p1 < "${srcdir}/0008-afs-introduce-afs_alloc_ncr-afs_free_ncr.patch"

  # Backports from master to make later patches apply cleanly
  patch -p1 < "${srcdir}/0009-LINUX-Don-t-panic-on-some-file-open-errors.patch"
  patch -p1 < "${srcdir}/0010-afs-Introduce-afs_IsDCacheFresh.patch"

  # Prep. for Linux 5.18 patch (14962)
  patch -p1 < "${srcdir}/0011-afs-introduce-get_dcache_readahead.patch"

  # Linux 5.18 (14953)
  patch -p1 < "${srcdir}/0012-Linux-5.18-replace-readpages-with-readahead.patch"

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
