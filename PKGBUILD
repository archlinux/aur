#Maintainer: SimPilotAdamT <adam_tazul@outlook.com>

_pkgbase=xmm7360-pci-spat
pkgbase=xmm7360-pci-spat-dkms
pkgname=(xmm7360-pci-spat-dkms xmm7360-pci-spat-utils)
pkgver=1
pkgrel=1
pkgdesc='Driver for the Fibocom L850-GL / Intel XMM7360 LTE modem'
arch=('x86_64')
url="https://github.com/SimPilotAdamT/xmm7360-pci-SPAT"
license=(BSD GPL)
makedepends=(python)
source=("git+$url"
        "dkms.conf"
        "xmm7360.service"
        "lte.sh")
sha512sums=('SKIP'
            'c6bef2f9be2502354455982cf499d474184a12ea02e5decf55814a27e82942a565a167bc728974e9a32d500c59c15660e0f07b3227af45c665a050c3b7c0175d'
            '032253dbd0eb18ad7df730da90b3f899bd0c48c06c85a379f48591fabd82368f5a678f5216d039a7bf51d6a3e12eae3159146ae62bafe671ddafa34319439781'
            '51cc3e1a492204c0c1bf1bc752572a1361fb030bc47f9cd412e1ce7595d7578c540f492ab7d933231dc0f20c74bc92ef5e6fcda3c060cee8806e45a7fc7cec06')

pkgver() {
  cd ${_pkgbase}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgbase}
  python -m compileall -o1 rpc
}

package_xmm7360-pci-spat-dkms() {
  pkgdesc+=" – module sources"
  depends=(dkms)
  provides=(XMM7360-PCI-SPAT-MODULE)
  cd ${_pkgbase}
  install -Dm644 "${srcdir}"/dkms.conf xmm7360.c Makefile -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}

package_xmm7360-pci-spat-utils() {
  pkgdesc+=" – utilities only"
  depends=(XMM7360-PCI-SPAT-MODULE dbus-python python-pyroute2 python-configargparse)
  cd ${_pkgbase}
  install -d "${pkgdir}"/usr/lib/${_pkgbase}
  cp --preserve=mode -R rpc "${pkgdir}"/usr/lib/${_pkgbase}
  install -Dm644 "$srcdir"/xmm7360.service -t "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 xmm7360.ini "${pkgdir}"/etc/xmm7360
  install -Dm755 "$srcdir"/lte.sh "${pkgdir}"/usr/bin/lte
}
