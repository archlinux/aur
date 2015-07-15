# Contributer: Philipp Geyer <nistur@gmail.com>
# Mantainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=crark-cuda
pkgver=3.43
download=crark34-linux-cuda.rar
pkgrel=3
pkgdesc="A command-line utility for RAR 2.x-3.x password cracking, uses Password Cracking Library 2.0 that supports special password recovery language. Highly optimized for all modern processors. with CUDA support"
arch=('i686' 'x86_64')
url="http://www.crark.net/"
license="unknown"
options=('!strip')
depends=(cuda)
makedepends=('unrar')
provides=('crark-cuda')
source=("http://www.crark.net/download/${download}")
md5sums=('33256ce4564f6bcfe875bc03a0300158')
noextract=(${download})

if [ "$CARCH" = "i686" ]; then
depends[${#depends[@]}]=nvidia-utils
elif [ "$CARCH" = "x86_64" ]; then
depends[${#depends[@]}]=lib32-nvidia-utils
fi


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
  cp -R ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}

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
# ln -s "/opt/${pkgname}/crark" "$pkgdir/usr/bin/crark-cuda"
# export PATH=/opt/crark-cuda:$PATH

}  