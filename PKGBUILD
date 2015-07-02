# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
pkgname='vlmcsd-svn'
pkgver=svn785
pkgrel=1
pkgdesc="KMS activation using vlmcs."
arch=('any')
url="http://forums.mydigitallife.info/threads/50234-Emulated-KMS-Servers-on-non-Windows-platforms"
license='unknown'
depends=('glibc')
makedepends=('clang' 'p7zip')
source=('vlmcsd.7z::http://plasmon.rghost.ru/download/8HRGm5Qdl/8ef51bbd691046bd76ab18bebffd67afa445e5e4/vlmcsd-svn785-2015-06-29-Hotbird64-Source-Only.7z'
        'vlmcsd.service')
install='vlmcsd.install'
sha256sums=("ae99cf5c403cd191086c4693723a4a42ca484ce350c0b045c62e9c9a10b0ad24"
            "bcaff9edeb0b215535d1d273283c5c5b79cbb652c5a1dfab6798e8b2a671ae7a")
noextract=('vlmcsd.7z')

prepare() {
  cd "${srcdir}"
  7z x -p2015 "${srcdir}/vlmcsd.7z" -y -o"${srcdir}/vlmcsd" > /dev/null
}

build() {
  cd "${srcdir}/vlmcsd"
  mv "${srcdir}/vlmcsd/make_linux" "${srcdir}/vlmcsd/Makefile"
  CC=clang make
}

package(){
  cd "${srcdir}/vlmcsd"

  install -Dm 755 vlmcsd ${pkgdir}/usr/bin/vlmcsd
  install -Dm 755 vlmcs ${pkgdir}/usr/bin/vlmcs

  install -Dm 644 vlmcs.1 "${pkgdir}/usr/share/man/man1/vlmcs.1"
  install -Dm 644 vlmcsd.7 "${pkgdir}/usr/share/man/man7/vlmcsd.7"
  install -Dm 644 vlmcsd.8 "${pkgdir}/usr/share/man/man8/vlmcsd.8"

  # Create vlmcsd service
  install -Dm 644 ${srcdir}/vlmcsd.service ${pkgdir}/usr/lib/systemd/system/vlmcsd.service
}
