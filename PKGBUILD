# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributer: Philipp Geyer <nistur@gmail.com>
# Contributer: gryffyn <aur (at) micah (dot) mp>

pkgname=crark
pkgver=5.5
pkgrel=3
pkgdesc="A command-line utility for RAR 2.x-3.x password cracking, uses Password Cracking Library 2.0 that supports special password recovery language. Highly optimized for all modern processors. with CUDA support"
arch=('x86_64')
url="http://www.crark.net/"
license=("unknown")
options=('!strip')
optdepends=('cuda' 'opencl-driver')
makedepends=('unrar')
source=(${pkgname}-${pkgver}.rar::"http://www.crark.net/download/${pkgname}${pkgver//./}-linux.rar"
        "crark"
        "crark-ocl")
sha256sums=('f91a5be31112ac2484f85503559ccef2cc0399e2c693a3f27e18962ccbc3de92'
            '5fcb0de11d6ca84ef02b4754f5cc136350d577a6983819a992bc2304ae2fcef6'
            'ce33f675db7549d28595994754b5d8f043b2a8aa4203858299fea50071d8f5e3')
noextract=(${pkgname}-${pkgver}.rar)

prepare() {
  cd ${srcdir}
  rm -rf "${pkgname}-${pkgver}"
  mkdir -p "${pkgname}-${pkgver}"
  unrar x -xcrackme ${pkgname}-${pkgver}.rar ${pkgname}-${pkgver}
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -R ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}
  chmod +r ${pkgdir}/opt/${pkgname}/*.def 
  mv ${pkgdir}/opt/${pkgname}/english.def ${pkgdir}/opt/${pkgname}/password.def
  install ${pkgname} -m644 ${pkgdir}/usr/bin

  cd ${srcdir}
  install ${pkgname} -m644 ${pkgdir}/usr/bin
  install ${pkgname}-ocl -m644 ${pkgdir}/usr/bin
  chmod +x ${pkgdir}/usr/bin/${pkgname}{,-ocl}
}  
