# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: skydrome <skydrome@i2pmail.org>
# Maintainer: mutantmonkey <aur@mutantmonkey.in>

pkgname=tcpcrypt-git
pkgver=369.25c9a85
pkgrel=1
pkgdesc="Transparent user space implementation for the tcpcrypt TCP extensions"
arch=('i686' 'x86_64')
url="http://tcpcrypt.org"
license=('BSD')
depends=('libnetfilter_queue' 'libnetfilter_conntrack' 'libnfnetlink'
         'libcap' 'openssl' 'iptables')
makedepends=('git')
provides=('tcpcrypt')
conflicts=('tcpcrypt')
install='tcpcrypt.install'
backup=('etc/conf.d/tcpcryptd.conf')
source=("git+https://github.com/scslab/tcpcrypt.git"
        'tcpcryptd.conf' 'tcpcryptd.service'
        'tcpcryptd.tmpfiles' 'tcpcryptd.sysusers')
sha256sums=('SKIP'
            '4a12aafddb6600a49652acdec13e703a5f4305fd19fdb5c35581b188cd7cca58'
            'ac10f4c3de034bfc0ca8fd7034da7633a95d8fce7a9d12304a998a9c3b6fa51b'
            '3ed90191d41add525242e7e84769c17b6d40b5fa461937739b4d5b7532afc83d'
            '3eeaaa4124904c673cfe7584e6c399ea2ab060f0e1d4d181323552ffee782c81')

pkgver() {
  cd tcpcrypt
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd tcpcrypt

  mkdir -p m4
  ./bootstrap.sh
}

build() {
  cd tcpcrypt

  ./configure --prefix=/usr
  make
}

package() {
  cd tcpcrypt
  make DESTDIR="$pkgdir" install

  install -dm644 "$pkgdir"/usr/share/tcpcryptd

  install -Dm755 src/iptables.sh       "$pkgdir"/usr/share/tcpcryptd/iptables.sh
  install -Dm644 ../tcpcrypt/LICENSE   "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -Dm644 ../tcpcryptd.conf     "$pkgdir"/etc/conf.d/tcpcryptd.conf
  install -Dm644 ../tcpcryptd.service  "$pkgdir"/usr/lib/systemd/system/tcpcryptd.service
  install -Dm644 ../tcpcryptd.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/tcpcryptd.conf
  install -Dm644 ../tcpcryptd.sysusers "$pkgdir"/usr/lib/sysusers.d/tcpcryptd.conf
}

# vim:set ts=2 sw=2 et:
