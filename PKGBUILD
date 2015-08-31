# Contributer: Gustavo Alvarez <sl1pkn07 [at] gmail [dot] com>
# Mantainer: Abelardo Ricart <aricart@gmail.com>
# Moved to AUR4: GI Jack <iamjacksemail@hackermail.com>

pkgname=crark-opencl
pkgver=3.43
download=crark34-linux-opencl.rar
pkgrel=1
pkgdesc="A command-line utility for RAR 2.x-3.x password cracking, uses Password Cracking Library 2.0 that supports special password recovery language. Highly optimized for all modern processors. with OpenCL support"
arch=('i686' 'x86_64')
url="http://www.crark.net/"
license="unknown"
options=('!strip')
depends=(libcl)
makedepends=('unrar')
provides=('crark-opencl')
source=("http://www.crark.net/download/${download}")
md5sums=('d96a4d93bf8060879f11ea0f6d318631')
noextract=(${download})

build() {
  cd ${srcdir}
  rm -rf "${pkgname}-${pkgver}"
  mkdir -p "${pkgname}-${pkgver}"
  unrar x -xcrackme ${download} ${pkgname}-${pkgver}
  cd ${srcdir}/${pkgname}-${pkgver}
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -R "${srcdir}"/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}

  cat >> ${pkgname} << EOF
#!/bin/sh
now=`pwd`
cd /opt/${pkgname}
./crark ${now}/$*

exit
EOF

  chmod +r ${pkgdir}/opt/${pkgname}/{spanish,english,russian}.def 
  mv ${pkgdir}/opt/${pkgname}/english.def ${pkgdir}/opt/${pkgname}/password.def
  install ${pkgname} -m644  $pkgdir/usr/bin
  chmod +x ${pkgdir}/usr/bin/${pkgname}
}

