# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Hugo Doria <hugo@archlinux.org>

_name=libcap
pkgname=lib32-libcap
pkgver=2.52
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=('x86_64')
url="https://sites.google.com/site/fullycapable/"
license=('GPL2')
depends=("libcap=${pkgver}" 'lib32-glibc' 'lib32-pam')
makedepends=('linux-api-headers')
provides=('libcap.so' 'libpsx.so')
source=("https://kernel.org/pub/linux/libs/security/linux-privs/${_name}2/${_name}-$pkgver.tar."{xz,sign}
        "${_name}-2.45-makefile.patch"
        "${_name}-2.52-link_pam_cap.patch"
)
sha512sums=('95d9e0f81fd955c42a0f299163a4402f00e9e7a2b392dfbabe613abea4babba2730576e76c9b612665a0bb8bd88aa98bf28ea3eb5582b5c06cd1137594a59893'
            'SKIP'
            '4f613f83198dfccb8b79e1b2c8764657a85300cb166d633d86b87f46567d51fa9395387caf33e82a8718f19e9a1fc65c11e7b6f63c3c4cde1b2a27f70671ec07'
            '52256a9d79a7beb8f82312e94032426201b45e105dc04274f4589c39003546e0b41c2d8b0a7c1a9a44a7560e25e1f1455ad0a89527fca172f97478935afeb1f3')
b2sums=('0696ae00a485df019f5441efe1d71676ddf294f1116e7fc3f352ad0595f9d4830f2e4fac1f98353016de36a4866f9d018f53419970ccd114c6df0faa556bcea3'
        'SKIP'
        '6f50d5a03c3532e6e50506cd878b1c9ca5cee5f1758f9318d4cb5d1e319cbe5f31210ba46a81b1af30730e2329aed7921c11f1a468a596a3f210972ca0da9d64'
        'b734ffa08cc91b69d3af7700b094c8803db65d6d72d9d0ff6e736e9b8cea8f65f63d452ddf4500e7d538b72bafee16d9f43b6231d316f914af724fdbb987a081')
validpgpkeys=('38A644698C69787344E954CE29EE848AE2CCF3F4') # Andrew G. Morgan <morgan@kernel.org>

prepare() {
  mv "${_name}-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # SBINDIR is hardcoded to sbin. set to bin
  # add CPPFLAGS
  patch -Np1 -i ../"${_name}-2.45-makefile.patch"
  # fix issue with pam_cap.so not linking against libpam.so:
  # https://bugzilla.kernel.org/show_bug.cgi?id=214023
  patch -Np1 -i ../"${_name}-2.52-link_pam_cap.patch"
}

build() {
  cd "$pkgname-$pkgver"
  make KERNEL_HEADERS='/usr/include' CC="gcc -m32" lib='lib32' prefix='/usr'
}

check() {
  cd "$pkgname-$pkgver"
  make -k test CC="gcc -m32"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" RAISE_SETFCAP='no' lib='lib32' prefix='/usr' install

  # docs
  install -vDm 644 {CHANGELOG,README} -t "${pkgdir}/usr/share/doc/${pkgname}/"
  rm -r "${pkgdir}/usr/"{include,share/man,bin}
}
