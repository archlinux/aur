# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=sabnzbd-git
pkgver=r7169.fba38a88
pkgrel=1
pkgdesc='A web-interface based binary newsgrabber with NZB file support'
url='http://www.sabnzbd.org'
arch=('any')
license=('GPL')
depends=('curl'
         'par2cmdline'
         'python'
         'python-six'
         'python-cryptography'
         'python-feedparser'
         'python-configobj'
         'python-cherrypy'
         'python-portend'
         'python-chardet'
         'python-notify2'
         'python-cheetah3'
         'python-sabyenc3'
         'sqlite'
         'unrar'
         'unzip')

optdepends=('python-pygobject: tray icon'
            'python-pyopenssl: ssl support'
            'par2cmdline-tbb: par2 multi-threading'
            'p7zip: for .7z support')

provides=('sabnzbd')
conflicts=('sabnzbd')

backup=('var/lib/sabnzbd/sabnzbd.ini')
source=("${pkgname%-git}::git://github.com/sabnzbd/sabnzbd.git"
        'sabnzbd.service'
        'sabnzbd@.service'
        'sabnzbd.sysusers'
        'sabnzbd.tmpfiles')

sha256sums=('SKIP'
            '6c7edcce9f93916521a71ae12d787894b97ed22dde371b72eb2618e5fd7ca967'
            'c9e7f2de422db5bdb9d6bf9e03300b8ac91d9b117295870bc6124e6733aaf67a'
            '525f294372963fde09db08b0368c80078a16d4cefcb34f8179706336709afdf7'
            '3a3c292020cca0251478c70a6499afa64aeca3dfcb6d5e32f6e21d5d4d94fa81')

pkgver() {
  cd "${pkgname%-git}"
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/usr/lib/sabnzbd"
  mkdir -p "${pkgdir}/var/lib/sabnzbd"
  touch "${pkgdir}/var/lib/sabnzbd/sabnzbd.ini"
  cp -r "${srcdir}/sabnzbd/"* "${pkgdir}/usr/lib/sabnzbd"

  find "${pkgdir}/usr/lib/sabnzbd" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/lib/sabnzbd" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/usr/lib/sabnzbd/SABnzbd.py"

  install -D -m 644 "${srcdir}/sabnzbd.service" "${pkgdir}/usr/lib/systemd/system/sabnzbd.service"
  install -D -m 644 "${srcdir}/sabnzbd@.service" "${pkgdir}/usr/lib/systemd/system/sabnzbd@.service"
  install -D -m 644 "${srcdir}/sabnzbd.sysusers" "${pkgdir}/usr/lib/sysusers.d/sabnzbd.conf"
  install -D -m 644 "${srcdir}/sabnzbd.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/sabnzbd.conf"
}
