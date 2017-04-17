# Maintainer: Aetf <aetf@unlimitedcodeworks.xyz>
# Contributor: juantascon <juantascon.aur@horlux.org>
# Contributor: Ilya Kuzmin <i.g.kuzmin.spb@gmail.com>

pkgname='hid-apple-patched-git'
_pkgname=hid-apple-patched

pkgver=20170406.61dce7d
pkgrel=2

pkgdesc="Allows to swap the Fn key and left Control key on Macbook Pro and Apple keyboards in GNU/Linux"
url="https://github.com/free5lot/hid-apple-patched"
arch=('any')
license=('GPL2')
makedepends=('linux-headers' 'git')
conflicts=('hid-apple-patched-git-dkms')
install=hid-apple-patched.install

source=("git+https://github.com/free5lot/hid-apple-patched#branch=master"
        "hid-apple-patched.conf"
        "hid_apple_pclayout.conf")

sha256sums=('SKIP'
            '4b94f1f55febddad5ff60a8918487b883ceadd4e6c3fb280e98e4e235cd09663'
            '2a493d3973b80b815779643b2c1039f52c05e2e9a65cebd00b2a1da105630cbb')

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

package() {
  install -Dm644 hid_apple_pclayout.conf "${pkgdir}"/etc/modprobe.d/hid_apple_pclayout.conf
  install -Dm644 hid-apple-patched.conf "$pkgdir"/etc/depmod.d/hid-apple-patched.conf

  install -Dm644 "$_pkgname"/hid-apple.ko "$pkgdir"/usr/lib/modules/extramodules-"$_kernmajor"-"$_distro"/hid-apple.ko
  gzip "$pkgdir"/usr/lib/modules/extramodules-"$_kernmajor"-"$_distro"/hid-apple.ko
}
