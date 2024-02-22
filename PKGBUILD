#Maintainer: SimPilotAdamT <adam_tazul@outlook.com>

__pkgbase=xmm7360-pci-SPAT
_pkgbase=xmm7360-pci-spat
pkgbase=xmm7360-pci-spat-dkms-git
pkgname=(xmm7360-pci-spat-dkms xmm7360-pci-spat-utils)
pkgver=0
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
            '72f18e937aaad32f622f0b20e274b436c08e52025d9e1b72bee5e978e80c67b2dacfe1e935ddf46171d666ad469c11f26a81d66f9f75bc4729851c16743f97f5'
            '51cc3e1a492204c0c1bf1bc752572a1361fb030bc47f9cd412e1ce7595d7578c540f492ab7d933231dc0f20c74bc92ef5e6fcda3c060cee8806e45a7fc7cec06')
install=xmm7360.install

pkgver() {
  cd ${__pkgbase}
  if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
    printf '%s.r%s.g%s' \
      "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
      "$(git rev-list --count ${GITTAG}..)" \
      "$(git log -1 --format='%h')"
  else
    printf '0.r%s.g%s' \
      "$(git rev-list --count master)" \
      "$(git log -1 --format='%h')"
  fi
}

build() {
  cd ${__pkgbase}
  python -m compileall -o1 rpc
}

package_xmm7360-pci-spat-dkms() {
  pkgdesc+=" – module sources"
  depends=(dkms)
  provides=(XMM7360-PCI-SPAT-MODULE)
  cd ${__pkgbase}
  install -Dm644 "${srcdir}"/dkms.conf xmm7360.c Makefile -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}

package_xmm7360-pci-spat-utils() {
  pkgdesc+=" – utilities only"
  depends=(XMM7360-PCI-SPAT-MODULE dbus-python python-pyroute2 python-configargparse)
  cd ${__pkgbase}
  install -d "${pkgdir}"/usr/lib/${_pkgbase}
  cp --preserve=mode -R rpc "${pkgdir}"/usr/lib/${_pkgbase}
  install -Dm644 "$srcdir"/xmm7360.service -t "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 xmm7360.ini "${pkgdir}"/etc/xmm7360
  install -Dm755 "$srcdir"/lte.sh "${pkgdir}"/usr/bin/lte
}
