# Maintainer: Aetf <aetf@unlimitedcodeworks.xyz>
# Contributor: juantascon <juantascon.aur@horlux.org>
# Contributor: Ilya Kuzmin <i.g.kuzmin.spb@gmail.com>

pkgname=( 'hid-apple-patched-git'
          'hid-apple-patched-git-dkms')

pkgver=20170406.61dce7d
pkgrel=1

_pkgname=hid-apple-patched

pkgdesc="Allows to swap the Fn key and left Control key on Macbook Pro and Apple keyboards in GNU/Linux"
url="https://github.com/free5lot/hid-apple-patched"
arch=('any')
license=('GPL2')
makedepends=('linux-headers' 'git')

source=("git+https://github.com/free5lot/hid-apple-patched#branch=master"
        "hid-apple-patched.conf"
        "hid_apple_pclayout.conf"
        "dkms.conf")

sha256sums=('SKIP'
            '4b94f1f55febddad5ff60a8918487b883ceadd4e6c3fb280e98e4e235cd09663'
            '2a493d3973b80b815779643b2c1039f52c05e2e9a65cebd00b2a1da105630cbb'
            '974d1ae335b4b70e122c24fc82c86147d3b645c8322497486b01a82bb68e866f')

_kernmajor="$(uname -r | cut -d'.' -f-2)"
_distro="$(uname -r | sed -e 's/[^A-Z]*//')"
_kernver="$(</usr/lib/modules/extramodules-"$_kernmajor"-"$_distro"/version)"

pkgver() {
  cd "$srcdir"/"$_pkgname"
  git log -1 --format=%cd.%h --date=short|tr -d -
}

build() {
  make -C /usr/lib/modules/${_kernver}/build M=`pwd`/"$_pkgname"
}

package_hid-apple-patched-git() {
  install=hid-apple-patched.install
  conflits=('hid-apple-patched-git-dkms')

  do_package_general_files

  install -Dm644 "$_pkgname"/hid-apple.ko "$pkgdir"/usr/lib/modules/extramodules-"$_kernmajor"-"$_distro"/hid-apple.ko
  gzip "$pkgdir"/usr/lib/modules/extramodules-"$_kernmajor"-"$_distro"/hid-apple.ko
}

package_hid-apple-patched-git-dkms() {
  pkgdesc="Allows to swap the Fn key and left Control key on Macbook Pro and Apple keyboards in GNU/Linux (DKMS)"
  depends=('dkms')
  install=hid-apple-patched-dkms.install

  ## Copy sources
  install -dm755 "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
  install -Dm644 ${_pkgname}/{hid-apple.c,hid-ids.h,Makefile} "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/

  sed -e "s/@PKGNAME@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  do_package_general_files
}

do_package_general_files()
{
  install -Dm644 hid_apple_pclayout.conf "${pkgdir}"/etc/modprobe.d/hid_apple_pclayout.conf
  install -Dm644 hid-apple-patched.conf "$pkgdir"/etc/depmod.d/hid-apple-patched.conf
}
