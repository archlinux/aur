# Maintainer: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >

pkgname=docfetcher
_name=DocFetcher
pkgver=1.1.14
pkgrel=1
pkgdesc="A java open source desktop search application"
arch=('i686' 'x86_64')
url="http://${pkgname}.sourceforge.net/"
license=('EPL')
depends=('java-runtime>=1.6')
makedepends=('unzip')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/docfetcher-${pkgver}-portable.zip"
  'docfetcher'
  'swt.patch')
md5sums=('9336e517d3cc12f47b6a1932eb2c99c3'
         '6a798b893868bf6b5e78093143654b39'
         '4ee9dd7e1af40f45708423e297c42bd3')

prepare() {
  cd "${srcdir}"
  unzip -qqo "${pkgname}-${pkgver}-portable.zip"

  # Patch to add where SWT libraries will be unpacked. See the following link:
  # http://docfetcher.sourceforge.net/wiki/doku.php?id=faq  
  cd "${srcdir}/${_name}-${pkgver}/"
  patch -Np0 -i ../swt.patch
}

package() {
  cd "${srcdir}/${_name}-${pkgver}/"

  # Executable
  install -Dm755 "../${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Remove files from other platforms and other unnecessary ones
  rm -r "${_name}.app"
  find . -name '*.exe' -exec rm -r '{}' \;
  rm "Readme.txt"

  # Copy files to destination
  prefix="${pkgdir}/usr/share/${pkgname}"
  install -d "${prefix}"
  for file in *
  do
    cp -a "${file}" "${prefix}/${file}"
  done
  find "${prefix}" -type d -exec chmod 0755 {} \;
  find "${prefix}" -type f -exec chmod 0644 {} \;
  chmod +x "${prefix}/${_name}.sh"
}
