# Maintainer: Gereon Schomber <Gereon underscore Schomber at fastmail dot fm>
# Contributor: dryes <joswiseman@gmail>
# Contributor: Revelation60, Lucky <https://aur.archlinux.org/packages.php?ID=13691>
# Contributor: Gordin <9ordin @t gmail dot com>
_develop=true
#_develop=false
pkgname='sabnzbd-git'
true && pkgname="sabnzbd-$($_develop && echo develop-)git"
_gitname='sabnzbd'
pkgver=0.7.20.r0.g1df2943
pkgrel=1
pkgdesc='A web-interface based binary newsgrabber with NZB file support.'
arch=('any')
url='http://www.sabnzbd.org/'
license=('GPL')
depends=('par2cmdline' 'python2' 'python2-cheetah' 'python2-feedparser' 'python2-yenc' 'python2-pyopenssl' 'python2-gntp-git' 'unrar' 'unzip' 'sqlite' 'curl' 'zip')
makedepends=('git')
optdepends=("xdg-utils: registration of .nzb files" 
            "python2-feedparser: rss support"
            "python2-pyopenssl: ssl support")
backup=('etc/conf.d/sabnzbd')
install=sabnzbd.install
conflicts=('sabnzbd' 'sabnzbd-bzr' 'sabnzbd-develop-git')
true && conflicts=('sabnzbd' 'sabnzbd-bzr' "sabnzbd-$( ! $_develop && echo develop-)git")

provides=('sabnzbd')
replaces=('sabnzbd-bzr')
source=('git://github.com/sabnzbd/sabnzbd.git' 'sabnzbd.sh' 'sabnzbd.init' 'sabnzbd.confd' 'sabnzbd.desktop' 'addnzb.sh' 'nzb-2.png' 'sab2_64.png' 'x-nzb.xml' 'sabnzbd.service')
true && \
source=("git://github.com/sabnzbd/sabnzbd.git$( $_develop && echo \#branch=develop)"
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

prepare() {
  cd "${startdir}"
  if [ ! -d "bin" ]; then
    mkdir bin
    cd bin
    ln -s /usr/bin/python2 ./python
  fi
}

build() {
  export PATH="${startdir}"/bin:$PATH
  cd "${srcdir}/${_gitname}"
  python package.py source
}

package() {
  mkdir -p "${pkgdir}/usr/share/doc/sabnzbd/examples/"
  cd "${srcdir}/${_gitname}/srcdist/"
  rm -rf win PKG-INFO Sample-PostProc.cmd
  mv licenses/ *.txt "${pkgdir}/usr/share/doc/sabnzbd/"
  mv Sample-PostProc.sh "${pkgdir}/usr/share/doc/sabnzbd/examples/"
  mv "${PWD}" "${pkgdir}/usr/share/sabnzbd/"

  install -Dm755 "${srcdir}/sabnzbd.sh" "${pkgdir}/usr/bin/sabnzbd"
  install -Dm755 "${srcdir}/sabnzbd.init" "${pkgdir}/etc/rc.d/sabnzbd"
  install -Dm644 "${srcdir}/sabnzbd.confd" "${pkgdir}/etc/conf.d/sabnzbd"
  install -Dm755 "${srcdir}/sabnzbd.desktop" "${pkgdir}/usr/share/applications/sabnzbd.desktop"
  install -Dm644 "${srcdir}/sabnzbd.service" "${pkgdir}/usr/lib/systemd/system/sabnzbd.service"
  install -Dm755 "${srcdir}/addnzb.sh" "${pkgdir}/usr/share/sabnzbd/addnzb.sh"
  install -Dm644 "${srcdir}/nzb-2.png" "${pkgdir}/usr/share/sabnzbd/nzb-2.png"
  install -Dm644 "${srcdir}/sab2_64.png" "${pkgdir}/usr/share/sabnzbd/sab2_64.png"
  install -Dm770 "${srcdir}/x-nzb.xml" "${pkgdir}/usr/share/sabnzbd/x-nzb.xml"
}

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

sha1sums=('SKIP'
          '04f871831cff6d986562a317eccf0f7d15bcf0ab'
          'd75132711c2abc21a75f7331efdf0e60d1917a38'
          'f9516105cf5a843ace52c92e7afcc5575507ecfc'
          '72e985c195c93680cea3ae095dd4b02cbcf534db'
          'ffa58afabd773f7669070ef3597a90dbece3f045'
          'a77d34fd2222f060d77d121d56bbb94c85cf3f09'
          '92c17637b360bb938b7000ea0c2dc81178ede130'
          'fd607d2431583320a8233cced780ed98aa074c4e'
          'fd35834076158e6d6455e89572fd2840c0b44675')
