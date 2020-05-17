# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Original PKGBUILD by Saancreed (/r/archlinux)
_pkgbase=r8822be
pkgname=${_pkgbase}-dkms-git
pkgver=r23.69b525e
pkgrel=1
pkgdesc="The old r8822be kernel module for Realtek 8822BE WLAN controllers"
arch=('x86_64')
url="https://github.com/mid-kid/r8822be"
license=('GPL')
depends=('dkms')
makedepends=('git')
source=("${_pkgbase}::git+https://github.com/mid-kid/r8822be.git"
        "blacklist.conf"
        "dkms.conf")
sha256sums=('SKIP'
            '435a384c1de7377143489eebccec5043366d5f4a32434ded261d588351d98cd5'
            '6bc0ffd5bd0c3f0dca7856e23742f5e41ec2961e7179be119131a61bcacdc668')

pkgver() {
  cd "$srcdir/${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgbase}"

  install -d "$pkgdir/usr/src/${_pkgbase}-${pkgver}"
  cp -dr --no-preserve=ownership $srcdir/r8822be/* "$pkgdir/usr/src/${_pkgbase}-${pkgver}/"

  install -Dm644 ../dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  install -Dm644 $srcdir/blacklist.conf "${pkgdir}/etc/modprobe.d/${_pkgbase}.conf"
}

# vim:set ts=2 sw=2 et:
