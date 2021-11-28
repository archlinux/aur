# Maintainer: FlyCat <yanwh0311@gmail.com>
pkgname=v2csub-git
pkgver=20211127
pkgrel=1
pkgdesc="Subscriber for v2ray-core"
arch=('any')
url="https://github.com/yanwh0311/v2csub"
license=(GPL)
makedepends=('git')
depends=('glibc' 'curl' 'coreutils' 'v2ray-rules-dat-git')
optdepends=('v2ray: connecting support')

_gitname=v2csub
_gitroot='https://github.com/yanwh0311/v2csub.git'


package() {
  cd $srcdir

  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]]; then
    cd $_gitname || return 1
    git pull || return 1
  else
    git clone $_gitroot || return 1
  fi
  msg " checkout done."

  cd $srcdir/$_gitname || return 1

  install -Dm755 v2csub "${pkgdir}/usr/bin/v2csub"
  install -Dm744 config "${pkgdir}/etc/v2csub/config"
  install -Dm744 defaultkeys "${pkgdir}/etc/v2csub/defaultkeys"
  install -Dm744 gfw.json "${pkgdir}/etc/v2csub/gfw.json"
  install -Dm744 nonCN.json "${pkgdir}/etc/v2csub/nonCN.json"
  install -Dm744 v2csub.service "${pkgdir}/usr/lib/systemd/system/v2csub.service"

  for file in $(find templates -type f); do
    install -m 644 -D ${file} "${pkgdir}/etc/v2csub/${file}"
  done
 }

