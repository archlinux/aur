# Maintainer: Jonpas <jonpas33@gmail.com>
# Contributor: M4rQu1Nh0S

_pkgbase=r8168
pkgname=${_pkgbase}-8136
pkgver=8.053.00
pkgrel=1
pkgdesc="A kernel module for Realtek 8168 network cards (DKMS version) for Device ID 0x8136."
url="https://github.com/mtorromeo/r8168"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms' 'linux-headers')
makedepends=('git')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("r8168-8136::git+https://github.com/mtorromeo/r8168.git"
        "dkms.conf"
        "8136.patch"
        "kernel69.patch")
sha256sums=('SKIP'
            'd37b8acbd4fe06f81538581712a04751a96fc37bad3a4bd3ae8329f8744c49b3'
            'f203ed455d17f03c964b8bb91d9d7da6c33d8494c0b47ecf3096bde16e95b310'
            '583274ab545c9fe453a434a5f2b243575a0aeb3bf9c982f524c8efabb2745f84')
install=r8168-dkms.install

prepare() {
  cd "$pkgname"
  patch -Np1 -i '../8136.patch'
  patch -Np1 -i '../kernel69.patch'
}

package() {
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  sed -e "s/@PKGNAME@/${_pkgbase}/g" \
      -e "s/@PKGVER@/${pkgver}/g" \
      -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  cd "${pkgname}"
  cp -dr --no-preserve='ownership' src "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"

  echo "blacklist r8169" | \
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/modprobe.d/$pkgname.conf"
}
