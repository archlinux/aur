# Maintainer: Gereon Schomber <Gereon underscore Schomber at fastmail dot fm>
# Contributor: dryes <joswiseman@gmail>
# Contributor: Revelation60, Lucky <https://aur.archlinux.org/packages.php?ID=13691>
# Contributor: Gordin <9ordin @t gmail dot com>
pkgname="sabnzbd-git"
_gitname='sabnzbd'
pkgver=0.7.0.r1013.g56a89ce
pkgrel=1
pkgdesc='A web-interface based binary newsgrabber with NZB file support.'
arch=('any')
url='http://www.sabnzbd.org/'
license=('GPL')
depends=("curl" "par2cmdline"
         "python2" "python2-cheetah" "python2-yenc"
         "sqlite" "unrar" "unzip")
makedepends=('git')
optdepends=("xdg-utils: registration of .nzb files" 
            "python2-feedparser: rss support"
            "python2-pyopenssl: ssl support")
source=("git+https://github.com/sabnzbd/sabnzbd.git"
        'sabnzbd.sh'
        'sabnzbd.init'
        'sabnzbd.confd'
        'sabnzbd.desktop'
        'addnzb.sh'
        'nzb-2.png'
        'sab2_64.png'
        'x-nzb.xml'
        'sabnzbd.service'
        )
backup=('etc/conf.d/sabnzbd')
install=sabnzbd.install
conflicts=('sabnzbd' 'sabnzbd-bzr' 'sabnzbd-develop-git')

package() {
  mkdir -p "${pkgdir}/opt/${_gitname}"
  touch "${pkgdir}/opt/${_gitname}/${_gitname}.ini"
  cp -r "${srcdir}/${_gitname}/"* "${pkgdir}/opt/${_gitname}"

  # remove Windows and OS X files
  rm -r "${pkgdir}/opt/${_gitname}/win"
  rm -r "${pkgdir}/opt/${_gitname}/osx"

  # Fix for issues with Python 3
  find "${pkgdir}/opt/${_gitname}" -type f -exec sed -i 's/python/python2/g' {} \;
  find "${pkgdir}/opt/${_gitname}" -type d -exec chmod 755 {} \;
  find "${pkgdir}/opt/${_gitname}" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/opt/${_gitname}/SABnzbd.py"

  install -Dm755 "${srcdir}/${_gitname}.sh" "${pkgdir}/usr/bin/${_gitname}"
  install -Dm644 "${srcdir}/${_gitname}.confd" "${pkgdir}/etc/conf.d/${_gitname}"
  install -Dm644 "${srcdir}/${_gitname}.service" "${pkgdir}/usr/lib/systemd/system/${_gitname}.service"
  install -Dm755 "${srcdir}/${_gitname}.desktop" \
    "${pkgdir}/usr/share/applications/${_gitname}.desktop"
  install -Dm755 "${srcdir}/addnzb.sh"    "${pkgdir}/opt/${_gitname}/addnzb.sh"
  install -Dm644 "${srcdir}/nzb-2.png"    "${pkgdir}/opt/${_gitname}/nzb-2.png"
  install -Dm644 "${srcdir}/sab2_64.png"  "${pkgdir}/opt/${_gitname}/sab2_64.png"
  install -Dm770 "${srcdir}/x-nzb.xml"    "${pkgdir}/opt/${_gitname}/x-nzb.xml"
}

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

sha256sums=('SKIP'
            '411738ad4dcd761daeda3a97aedfbe39c71f70d7f91c29765f85fb2a5942522d'
            '35c7ec1bdaadeb1db3c0794254f99e8e44323ef1665d5f4ae2832d5367bd937c'
            '29190e47cf3140053b000b1bbc9a1f8f5a20e30db19fa065c03576bb5f8e15eb'
            '6ffe460bebea63faea39e1131131711fdfa3f744fee129f0cc2b3dffff261289'
            'baea3351a40551a63b90b4a4c32719d4c27b5fff596e74e4a91f289964960eb6'
            '7fec4494a04ffd6a94644c8ef499ec1c92998a613b1fde5c3a46f38c53dfbc43'
            '099d625d6efc9e69e7c6a2833221928fb19e9e356e3aa8341c36ffdc281e567d'
            'f53261d7578c67fb9fd6a639df94cd53604bcf37b9b03a926cb03e5214b496fe'
            '29e83913b7f66cb5ade8ab6682754c975323fc9905451a1e7147e04dc6ddcc12')
