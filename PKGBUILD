# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=pyruse
pkgver=2.0
pkgrel=1
pkgdesc="Route systemd-journal logs to filters and actions (ban, report, etc.)"
arch=('any')
url="https://yalis.fr/git/yves/pyruse"
license=('GPL3')
depends=('python>=3.4' 'python-systemd')
makedepends=('git' 'python-setuptools')
source=("git+https://yalis.fr/git/yves/pyruse.git#tag=${pkgver}")
sha1sums=('SKIP')
optdepends=(
  'nftables:       for the action_nftBan module'
  'iptables:       for the action_ipsetBan module'
  'ipset:          for the action_ipsetBan module'
  'smtp-forwarder: for the action_email and action_dailyReport modules'
)

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/etc/${pkgname}/"pyruse/{actions,filters}
  mkdir -p "${pkgdir}/var/lib/${pkgname}"

  mkdir -p "${pkgdir}/etc/systemd/system/pyruse-boot@action_nftBan.service.d"
  cp extra/systemd/action_nftBan.conf "${pkgdir}/etc/systemd/system/pyruse-boot@action_nftBan.service.d/"
  mkdir -p "${pkgdir}/etc/systemd/system/pyruse-boot@action_ipsetBan.service.d"
  cp extra/systemd/action_ipsetBan.conf "${pkgdir}/etc/systemd/system/pyruse-boot@action_ipsetBan.service.d/"

  mkdir -p "${pkgdir}/usr/"
  cp -r extra/bin "${pkgdir}/usr/"
  chmod 755 "${pkgdir}/usr/bin/"*

  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  cp extra/systemd/*.service "${pkgdir}/usr/lib/systemd/system/"

  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/extra"
  cp -r README.md Changelog.md doc "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -r extra/examples "${pkgdir}/usr/share/doc/${pkgname}/extra/"

  python extra/setup/setup.py install --root="${pkgdir}/" --optimize=1
}
