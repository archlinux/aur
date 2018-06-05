# Maintainer : blubbblubb <lampadada[removeme][at]googlemail[dot]com>

pkgname=nzb-monkey
_pkgname=nzbmonkey
pkgver=v0.2.2
pkgrel=2
pkgdesc="A Reference implementation of how to handle a NZBLNK-URI, with support for SABnzbd, NZBGet and Synology Download Station"
url="https://nzblnk.info/nzb-monkey/"
arch=("any")
license=("MIT")
depends=("python" "python-pyperclip" "python-requests" "python-configobj"
        "python-colorama" "python-cryptography" "xdg-utils")
install="${pkgname}.install"
source=("https://github.com/nzblnk/${pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.tbz2"
        'konsole.patch')
sha256sums=('c776e6a3c9e900c67cb96e9697a69b4e210a24d2e312cd89c97bdbac0e3035f1'
            '27c46e273704071aa0cf744b3d83fcc3194308f61b16eafbca9f62f0c565a4c3')

prepare() {
  # change to global folder instead of homepath
  sed -i "s+op.join(home, '.local/share/applications/')+'/usr/share/applications/'+g" "${srcdir}/${_pkgname}-${pkgver}-linux/nzblnkconfig.py"
  sed -i "s+op.normpath(op.dirname(__file__))+'/opt/${pkgname}'+g" "${srcdir}/${_pkgname}-${pkgver}-linux/nzblnkconfig.py"

  # dont open cfg file automatically
  sed -i "s+Popen(\['xdg-open', cfg.filename\])+pass+g" "${srcdir}/${_pkgname}-${pkgver}-linux/nzblnkconfig.py"

  patch "${srcdir}/${_pkgname}-${pkgver}-linux/nzblnkconfig.py" "${srcdir}"/konsole.patch
}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  touch "${pkgdir}/opt/${pkgname}/${pkgname}.cfg"
  cp -r "${srcdir}/${_pkgname}-${pkgver}-linux/"* "${pkgdir}/opt/${pkgname}"
}
