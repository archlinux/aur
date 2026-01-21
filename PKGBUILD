# Maintainer: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >
# Maintainer: Macxcool <macx cool at tuta nota dot com>

pkgname=docfetcher
_name=DocFetcher
pkgver=1.1.27
pkgrel=1
pkgdesc="A java open source desktop search application"
arch=('i686' 'x86_64')
url="http://${pkgname}.sourceforge.net/"
license=('EPL')
depends=('java-runtime>17')
makedepends=('unzip')
optdepends=('gtk3: GTK3-based interface')
_downloadfile="${_name}-${pkgver}-Linux-64bit-NonPortable"
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${_downloadfile}.zip"
  'docfetcher'
  'docfetcher.desktop')
sha256sums=('10a5831b384330a45849ddcf1e2e22d8c9e0669d23da45a74c423fc673bab267'
            'd49d1c1327b72345040c76ae510a3eaa520c82dd5c43f2a6e597f1c984b55c50'
            '878ea6e2188733f13a7580606fef290ae5b547b814b33efcd61f8cef79b76b61')

prepare() {
  # Change path for config, cache, and where SWT libraries will be unpacked. See the following link:
  # http://docfetcher.sourceforge.net/wiki/doku.php?id=faq  
  cd "${srcdir}/${_downloadfile}/misc/"
  sed -i 's_#settings=C:/path/to/settings/folder_settings=${user.home}/.config/docfetcher_' paths.txt
  sed -i 's_#indexes=C:/path/to/indexes/folder_indexes=${user.home}/.cache/docfetcher_' paths.txt
  sed -i 's_#swt=C:/path/to/swt/folder_swt=${user.home}/.local/share/docfetcher_' paths.txt

  # Now make sure that the java path is correct
  cd "${srcdir}/${_downloadfile}"
  sed -i 's_./jre/bin/java_/usr/bin/java_' DocFetcher.sh
}

package() {
  cd "${srcdir}/${_downloadfile}/"

  # Executable
  install -Dm755 "../${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  
  # .desktop file
  install -Dm755 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"  

  # Copy files to destination
  prefix="${pkgdir}/usr/share/${pkgname}"
  install -d "${prefix}"
  for file in *; do
    cp -a "${file}" "${prefix}/${file}"
  done
  find "${prefix}" -type d -exec chmod 0755 {} \;
  find "${prefix}" -type f -exec chmod 0644 {} \;
  
  # make start script executable
  chmod +x "${prefix}/${_name}.sh"
}
