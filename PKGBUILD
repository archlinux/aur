# Maintainer: Aetf <aetf@unlimitedcodeworks.xyz>
# Contributor: juantascon <juantascon.aur@horlux.org>
# Contributor: Ilya Kuzmin <i.g.kuzmin.spb@gmail.com>

pkgname=hid-apple-patched-git-dkms
_pkgname=hid-apple-patched

pkgver=20200401.5ebf708
pkgrel=1

url="https://github.com/free5lot/hid-apple-patched"
arch=('any')
license=('GPL2')
pkgdesc="Swaping the Fn and left Control keys and some other mapping tweaks on Macbook Pro and Apple keyboards (DKMS)"

depends=('dkms' 'mkinitcpio-modconf-hook')
makedepends=('git')

install=hid-apple-patched-dkms.install

source=("git+https://github.com/free5lot/$_pkgname#branch=master"
        "hid_apple.depmod"
        "hid_apple.modprobe"
        "dkms.conf")

sha256sums=('SKIP'
            '4b94f1f55febddad5ff60a8918487b883ceadd4e6c3fb280e98e4e235cd09663'
            'bf214ca80aa4abb6fe85c1108ea7c941684a5bc57891982b0aefafd5a6339a26'
            '5d2457728a93e73a96f2ca88f66455859363f083097ad20e661bdc12dc44a9ba')

pkgver() {
  cd "$srcdir"/"$_pkgname"
  git log -1 --format=%cd.%h --date=short|tr -d -
}

package() {

  ## Copy sources
  install -dm755 "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
  install -Dm644 ${_pkgname}/{hid-apple.c,hid-ids.h,Makefile} "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/

  sed -e "s/@PKGNAME@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  install -Dm644 hid_apple.modprobe "${pkgdir}"/usr/lib/modprobe.d/hid_apple.conf
  install -Dm644 hid_apple.depmod "${pkgdir}"/usr/lib/depmod.d/hid_apple.conf
}
