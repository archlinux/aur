#Maintainer: SimPilotAdamT <adam_tazul@outlook.com>

__pkgbase=xmm7360-pci-SPAT
_pkgbase=xmm7360-pci-spat
pkgbase=xmm7360-pci-spat-dkms-git
pkgname=('xmm7360-pci-spat-dkms-git' 'xmm7360-pci-spat-utils-git')
epoch=1
pkgver=0.r261.g27c1b26
pkgrel=1
pkgdesc='Driver for the Fibocom L850-GL / Intel XMM7360 LTE modem'
arch=('x86_64')
url="https://github.com/SimPilotAdamT/xmm7360-pci-SPAT"
license=('BSD' 'GPL')
makedepends=('python')
conflicts=('xmm7360-pci-dkms-git' 'xmm7360-pci-utils-git')
source=("git+$url"
        "dkms.conf"
        "xmm7360.service"
        "lte.sh")
sha512sums=('SKIP'
            'c6bef2f9be2502354455982cf499d474184a12ea02e5decf55814a27e82942a565a167bc728974e9a32d500c59c15660e0f07b3227af45c665a050c3b7c0175d'
            '9bbd2ffbf6b455b69744bccca1c9a495a5fbad9785f1fe536f899b2373b21bbeec1a7f8de3222f694ba54758024c7cb02adcaf4472a117db1f9af4b757711b79'
            '51cc3e1a492204c0c1bf1bc752572a1361fb030bc47f9cd412e1ce7595d7578c540f492ab7d933231dc0f20c74bc92ef5e6fcda3c060cee8806e45a7fc7cec06')

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

package_xmm7360-pci-spat-dkms-git() {
  #replaces=('xmm7360-pci-dkms')
  provides=('xmm7360-pci-dkms' 'xmm7360-pci-spat-dkms')
  pkgdesc+=" – Kernel Module"
  depends=('dkms')
  cd ${__pkgbase}
  install -Dm644 "${srcdir}"/dkms.conf xmm7360.c Makefile -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}

package_xmm7360-pci-spat-utils-git() {
  #replaces=('xmm7360-pci-utils')
  provides=('xmm7360-pci-utils' 'xmm7360-pci-spat-utils')
  install=xmm7360.install
  pkgdesc+=" – utilities only"
  depends=('xmm7360-pci-spat-dkms' 'dbus-python' 'python-pyroute2' 'python-configargparse')
  backup=('etc/xmm7360')
  cd ${__pkgbase}
  install -d "${pkgdir}"/usr/lib/${_pkgbase}
  cp --preserve=mode -R rpc "${pkgdir}"/usr/lib/${_pkgbase}
  install -Dm644 "$srcdir"/xmm7360.service -t "${pkgdir}"/usr/lib/systemd/system
  install -Dm644 xmm7360.ini "${pkgdir}"/etc/xmm7360
  install -Dm755 "$srcdir"/lte.sh "${pkgdir}"/usr/bin/lte
}
