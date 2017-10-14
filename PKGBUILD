# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
pkgname='vlmcsd-svn'
pkgver=svn1111
pkgrel=1
pkgdesc="KMS activation using vlmcs."
arch=('any')
url="http://forums.mydigitallife.info/threads/50234-Emulated-KMS-Servers-on-non-Windows-platforms"
license=('unknown')
depends=('glibc')
makedepends=('p7zip')
replaces=('vlmcsd')
conflicts=('vlmcsd')
source=('vlmcsd.service')
install='vlmcsd.install'
sha256sums=("c145194521ebf5eadc858d89b77a468f878c9a6e1699130ff9822e133ba6917f")

prepare() {
  cd "${srcdir}"
  curl -c _rghost_session='abc' -o vlmcsd.7z 'http://meson.ad-file.net/download/7JwqCtsJG/9535b1e4bc29e1e3df3c3ac2ba5279cf5ae1b8d3/vlmcsd-1111-2017-06-17-Hotbird64-source-only.7z'
  if [ "$(sha256sum vlmcsd.7z |awk '{print $1}')" == 'db22d890bc364991eb52f1f94bb3a04cd08cd98033716ccacfbec643805d282c' ]
  then
    7z x -p2017 "${srcdir}/vlmcsd.7z" -y -o"${srcdir}/vlmcsd" > /dev/null
  else
    exit 1
  fi
}

build() {
  cd "${srcdir}/vlmcsd"
  make
}

package(){
  cd "${srcdir}/vlmcsd"
  install -Dm 755 bin/vlmcsd ${pkgdir}/usr/bin/vlmcsd
  install -Dm 755 bin/vlmcs ${pkgdir}/usr/bin/vlmcs

  install -Dm 644 etc/vlmcsd.ini ${pkgdir}/etc/vlmcsd.ini
  install -Dm 644 etc/vlmcsd.kmd ${pkgdir}/etc/vlmcsd.kmd

  install -Dm 644 man/vlmcs.1 "${pkgdir}/usr/share/man/man1/vlmcs.1"
  install -Dm 644 man/vlmcsd.7 "${pkgdir}/usr/share/man/man7/vlmcsd.7"
  install -Dm 644 man/vlmcsd.8 "${pkgdir}/usr/share/man/man8/vlmcsd.8"
  install -Dm 644 man/vlmcsd.ini.5 "${pkgdir}/usr/share/man/man5/vlmcsd.ini.5"
  install -Dm 644 man/vlmcsd-floppy.7 "${pkgdir}/usr/share/man/man7/vlmcsd-floppy.7"
  install -Dm 644 man/vlmcsdmulti.1 "${pkgdir}/usr/share/man/man1/vlmcsdmulti.1"

  # Create vlmcsd service
  install -Dm 644 ${srcdir}/vlmcsd.service ${pkgdir}/usr/lib/systemd/system/vlmcsd.service
}
