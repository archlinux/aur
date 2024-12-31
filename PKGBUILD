# Maintainer: Amish <contact at via dot aur>
# Contributor: Isaac C. Aronson <i@pingas.org>

_user=shirkdog
pkgname=pulledpork
pkgver=3.0.0.5
_pp2_pkgver=0.7.4
_pp3_gitrev=7c4d1f8
pkgrel=2
pkgdesc="Tool to automatically update rules for snort"
arch=('any')
url="https://github.com/${_user}/${pkgname}3"
license=('GPL')
depends=('perl' 'perl-lwp-protocol-https' 'perl-crypt-ssleay' 'perl-archive-tar' 'perl-switch' 'perl-bytes-random-secure'
         'python' 'python-requests')
optdepends=('snort')
backup=('etc/pulledpork/pulledpork.conf'
        'etc/pulledpork/pulledpork3.conf'
        'etc/pulledpork/disablesid.conf'
        'etc/pulledpork/dropsid.conf'
        'etc/pulledpork/enablesid.conf'
        'etc/pulledpork/modifysid.conf')
source=("pulledpork-${_pp2_pkgver}.tar.gz::https://github.com/${_user}/${pkgname}/archive/v${_pp2_pkgver}.tar.gz"
        "pulledpork3-${pkgver}-${_pp3_gitrev}.tar.gz::https://github.com/${_user}/${pkgname}3/archive/${_pp3_gitrev}.tar.gz"
        "pulledpork.conf"
        "pulledpork3.conf"
        "pulledpork_update.sh"
        "pulledpork.service"
        "pulledpork.timer")
sha256sums=('f0149eb6f723b622024295e0ee00e1acade93fae464b9fdc323fdf15e99c388c'
            '35ff3fb6a572a38c424b1ab3e9748ad090e3c6064faddbe06c3a65646889f609'
            '07e937f3fa0d4eefd7aee5c2ea5502b8b8060ecb06fda5f830ce74af65c33493'
            '6db6a4084e2e0d9528a876b7db6e9269cefc8d5a00185f19bbe7bcd187a24418'
            'd2988ea005afb4f8a84baf20a59b616e6350fef140572794afe82cb44776ca1f'
            '629f7f8a5e274a0615f49d81cbc90e5d3697fa3e85af3ca231000761c73554c3'
            '2ac59ce33d8c7baefc809030c1a393d2951e936f1a9fb7d72ab392a69f6eb949')
install=pulledpork.install

prepare() {
  cd "${srcdir}/${pkgname}-${_pp2_pkgver}"
  install -m644 -t etc ../pulledpork.conf
}

package() {
  cd "${srcdir}/${pkgname}-${_pp2_pkgver}"
  install -Dm644 -t "${pkgdir}"/etc/pulledpork etc/*
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system ../pulledpork.{service,timer}
  install -Dm755 -t "${pkgdir}"/usr/bin pulledpork.pl ../pulledpork_update.sh

  cd "${srcdir}/${pkgname}3-${_pp3_gitrev}"*
  install -Dm644 -t "${pkgdir}"/etc/pulledpork ../pulledpork3.conf
  install -Dm755 -t "${pkgdir}"/usr/lib/pulledpork pulledpork.py
  install -Dm755 -t "${pkgdir}"/usr/lib/pulledpork/lib lib/*
}
