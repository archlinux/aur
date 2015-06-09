# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=comodo
pkgver=1.1.268025
_revision=1
pkgrel=6
pkgdesc="An antivirus suite with real-time protection"
arch=('x86_64' 'i686')
url="https://www.comodo.com/"
license=('custom')
#depends=('bzip2' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'libdbus' 'libffi' 
#         'libice' 'libpng' 'libsm' 'libutil-linux' 'libx11' 'libxau' 'libxcb' 'libxdmcp'
#         'libxext' 'libxrender' 'openssl' 'pam' 'pcre' 'qt4' 'zlib')
depends=('pam' 'glibc' 'qt4' 'gcc-libs')
optdepends=('postfix'
            'exim'
            'qmail'
            'sendmail'
            'comodo-modules: real-time protection')
options=(!strip)
install=comodo.install
source=(comodo.sh
        cmdagent.service
        cmgdaemon.service)
source_x86_64+=("http://cdn.download.comodo.com/cavmgl/download/installs/1000/standalone/CAV_LINUX-${pkgver}-${_revision}.x86_64.rpm")
source_i686+=("http://cdn.download.comodo.com/cavmgl/download/installs/1000/standalone/CAV_LINUX-${pkgver}-${_revision}.i686.rpm")

md5sums=('cf564cf0421e14d1121eaa7112003c1e'
         '372d8c3171424cb9e3ab0797842a7f77'
         'be4bb222442f2668075dc175cbbe964c')
md5sums_x86_64+=('555ee6f51d116d2462962a2e4256aeba')
md5sums_i686+=('94c3b08023754ecc09c81be1cc5e7ba0')

package() {
  # dump opt files to /opt
  mv opt "$pkgdir/"

  # don't install to /usr/local
  mv usr/local "$pkgdir/usr"

  # remove libs provided by dependencies
  #NOTE: this is not permitted by the license and is therefore disabled
  #rm -rf "$pkgdir/usr/Trolltech/Qt-4.7.4-Comodo/lib"

  # install profile script to add binaries to PATH
  install -Dm755 comodo.sh "$pkgdir/etc/profile.d/comodo.sh"
  
  # install subscriber agreement
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
  cp "$pkgdir/opt/COMODO/doc/eula_free.txt" "$pkgdir/usr/share/licenses/$pkgname/"

  # install service file
  install -Dm644 cmdagent.service "$pkgdir/usr/lib/systemd/system/cmdagent.service"
  install -Dm644 cmgdaemon.service "$pkgdir/usr/lib/systemd/system/cmgdaemon.service"

  # make setup script call systemd service instead of sysvinit script
  #NOTE: this is not permitted by the license and is therefore disabled
  #sed -i 's:^sh /opt/COMODO/load_cmdagent\.sh.*:systemctl restart cmdagent:' "$pkgdir/opt/COMODO/post_setup.sh"
  #sed -i 's:^sh /opt/COMODO/load_cmgdaemon\.sh.*:systemctl restart cmgdaemon:' "$pkgdir/opt/COMODO/post_setup.sh"

  # install .desktop files
  install -dm755 "$pkgdir/usr/share/applications/"
  cd "$pkgdir/opt/COMODO/menu/"
  for file in *.desktop; do
    cp "$file" "$pkgdir/usr/share/applications/"
  done
}
